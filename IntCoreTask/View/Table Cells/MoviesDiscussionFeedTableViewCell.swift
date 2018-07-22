//
//  MoviesDiscussionFeedTableViewCell.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class MoviesDiscussionFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var cellImageView: RoundImageView!
    
    func configureCell(movie: Movie, comment: String)
    {
        cellImageView.loadImageUsingUrlString(urlString: imageBaseURl + movie.backdropPath)
        descriptionLabel.text = movie.overview
        commentLabel.text = comment
    }
    


}
