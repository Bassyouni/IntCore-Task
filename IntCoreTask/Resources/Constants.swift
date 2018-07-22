//
//  Constants.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import Foundation

let moiveDBBaseUrl = "https://api.themoviedb.org/"


let discoverMovies = "3/discover/movie?api_key="

let apiKey = "ceb888b71023afda704f84975d2642b5"

let imageBaseURl = "https://image.tmdb.org/t/p/w185"

let moviesUrlString = "\(moiveDBBaseUrl)\(discoverMovies)\(apiKey)"

extension String {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
}

