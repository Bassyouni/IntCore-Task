//
//  MoviesDetailsVC.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit


class MoviesDetailsVC: ParentViewController {

    //MARK:- variables
    var movie: Movie?
    var comments = [String]()
    
    //MARK:- iboutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCommentsArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK:- methods
    func populateCommentsArray()
    {
        comments.append(contentsOf: ["Just testing photos at work. I have others but are too large. Thoughts?","Looks good!","It's not exposed very well, but if you took the same photo as RAW, you'd be able to 'fix' it with Lightroom or another photo editor.","Why don't you upload all images to Dropbox, Google+ or Google Disk (or whatever else...) and then just share a link? This would be easier for you and for us... IMHO of course... :))","Nice pic .","They seem like great photos. I'll upload some with my g3 for comparison. Seems they're not as crisp. Still decent enough for my liking."])
        
    }
}

//MARK: - table datasource
extension MoviesDetailsVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesDiscussionFeedTableViewCell", for: indexPath) as? MoviesDiscussionFeedTableViewCell
        {
            cell.configureCell(movie: movie!, comment: comments[indexPath.section])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let baseHeight: CGFloat = 338.0
        var descriptionHeight: CGFloat = 0
        var messageHeight: CGFloat = 0
        
        if let overview = movie?.overview
        {
            descriptionHeight = overview.height(withConstrainedWidth: 297)
            messageHeight = comments[indexPath.section].height(withConstrainedWidth: 234)
        }
    
        return baseHeight + descriptionHeight + messageHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
}



