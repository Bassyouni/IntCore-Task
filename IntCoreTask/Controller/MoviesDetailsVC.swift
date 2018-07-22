//
//  MoviesDetailsVC.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit
import Cosmos

class MoviesDetailsVC: ParentViewController {

    //MARK:- variables
    var movie: Movie?
    var comments = [String]()
    
    //MARK:- iboutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var starRatingView: CosmosView!
    @IBOutlet weak var posterImageView: CurvedImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    //MARK:- view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        populateCommentsArray()
        updateStarRatingView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //MARK:- methods
    func setupView()
    {
        if let movie = movie
        {
            imageWidth = 400
            posterImageView.loadImageUsingUrlString(urlString: imageBaseURl + "\(imageWidth)" + movie.backdropPath)
            movieNameLabel.text = movie.title
        }
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        self.view.addGestureRecognizer(swipeGesture)
        
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: UIControlEvents.touchUpInside)
        
        let angle:CGFloat = .pi / 4
        
        closeBtn.transform = CGAffineTransform(rotationAngle: angle)
        
    }
    func updateStarRatingView()
    {
        if let vote = movie?.voteAverage
        {
            starRatingView.rating = vote / 2.0
            starRatingView.settings.updateOnTouch = false
            starRatingView.settings.fillMode = .precise
            starRatingView.settings.starSize = 10
            starRatingView.settings.starMargin = 2
        }
        else
        {
            starRatingView.isHidden = true
        }
    }
    
    func populateCommentsArray()
    {
        comments.append(contentsOf: ["Just testing photos at work. I have others but are too large. Thoughts?","Looks good!","It's not exposed very well, but if you took the same photo as RAW, you'd be able to 'fix' it with Lightroom or another photo editor.","Why don't you upload all images to Dropbox, Google+ or Google Disk (or whatever else...) and then just share a link? This would be easier for you and for us... IMHO of course... :))","Nice pic .","They seem like great photos. I'll upload some with my g3 for comparison. Seems they're not as crisp. Still decent enough for my liking."])
        
    }
    
    fileprivate func dismissViewController()
    {
        self.navigationController?.popViewController(animated: true)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer)
    {
        if gesture.direction == .right
        {
            dismissViewController()
        }
    }
    
    @objc func closeBtnPressed()
    {
        dismissViewController()
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



