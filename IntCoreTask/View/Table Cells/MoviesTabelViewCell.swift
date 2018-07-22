//
//  MoviesTabelViewCell.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class MoviesTabelViewCell: UITableViewCell {
    
    //MARK:- UI Variables
    let moviePosterimageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Steve Jobs the man of the Machine"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Story about steve jobs"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 7
        return label
    }()
    
    //MARK:- cells init's
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- methods
    fileprivate func updateViews()
    {
        self.addSubview(moviePosterimageView)
        self.addSubview(movieNameLabel)
        self.addSubview(movieOverviewLabel)
        
        
        let views = ["imageView":moviePosterimageView, "nameLabel": movieNameLabel, "overviewLabel": movieOverviewLabel]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[imageView(100)]-[nameLabel]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[imageView]-[overviewLabel]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView(150)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[nameLabel]-[overviewLabel]", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
    }
    
    func configureCell(forMovie movie: Movie)
    {
        let imageStringUrl = imageBaseURl + movie.posterPath
        
        moviePosterimageView.loadImageUsingUrlString(urlString: imageStringUrl)
        movieNameLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
    }
    
}
