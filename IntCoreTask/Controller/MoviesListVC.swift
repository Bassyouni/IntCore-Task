//
//  MoviesListVC.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class MoviesListVC: UITableViewController {
    
    //MARK:- variables
    var hud : MBProgressHUD!
    var movies = [Movie]()
    let moviesTableCellIdentifer = "MoviesTabelViewCell"
    
    let refreshConrtol: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: .valueChanged)
        return refresh
    }()
    
    //MARK:- view's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        showLoading()
        setupTableView()
        grabMoviesFromAPi {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.hideLoading()
            }
        }
    }
    
    //MARK:- methods
    func setupTableView()
    {
        tableView.register(MoviesTabelViewCell.self, forCellReuseIdentifier: moviesTableCellIdentifer)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshConrtol)
        
    }
    
    func grabMoviesFromAPi(completion: @escaping ()->())
    {
        let url = URL(string: moviesUrlString)!
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil
            {
                print("error: \(error.debugDescription)")
                completion()
                return
            }
            
            
            if let data = data
            {
                do
                {
                    if let dataDict = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, AnyObject>
                    {
                        if (dataDict["status_message"] as? String) != nil
                        {
                            print("error")
                            completion()
                            return
                        }
                        
                        if let results = dataDict["results"] as? [Dictionary<String, AnyObject>]
                        {
                            self.movies.removeAll()
                            for movieDict in results
                            {
                                let tempMovie = Movie()
                                tempMovie.parseObject(fromDict: movieDict)
                                self.movies.append(tempMovie)
                                
                            }
                        }
                    }
                }
                catch
                {
                    print("error: \(error.localizedDescription)")
                    completion()
                    return
                }
            }
            
            completion()
            }.resume()
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl)
    {
        grabMoviesFromAPi
        {
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
                self.refreshConrtol.endRefreshing()
            }
        }
    }
    
}

//MARK: - table dataSource
extension MoviesListVC
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: moviesTableCellIdentifer, for: indexPath) as? MoviesTabelViewCell
        {
            cell.configureCell(forMovie: movies[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main )
        
        if let moviesDetailsVC = mainStoryboard.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC
        {
            moviesDetailsVC.movie = movies[indexPath.row]
            navigationController?.pushViewController(moviesDetailsVC, animated: true)
            moviesDetailsVC.navigationController?.isNavigationBarHidden = true
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK: - progress hud
extension MoviesListVC
{
    func showLoading()
    {
        //        self.view.alpha = 0.5
        //        self.view.backgroundColor = UIColor.black
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDModeIndeterminate
    }
    
    func hideLoading()
    {
        //        self.view.alpha = 1.0
        self.hud.hide(true)
    }
}

