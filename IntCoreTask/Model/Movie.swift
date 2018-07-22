//
//  Movie.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import Foundation

class Movie
{
    //MARK:- varibales
    private var _id: Int
    private var _title: String
    private var _posterPath: String
    private var _backdropPath: String
    private var _overview: String
    private var _voteAvergae: Double
    
    //MARK:- init's
    init() {
        _id = -1
        _title = ""
        _posterPath = ""
        _overview = ""
        _backdropPath = ""
        _voteAvergae = 0.0
    }
    
    // Methods
    func parseObject(fromDict dict: Dictionary<String, AnyObject>)
    {
        if let id = dict["id"] as? Int
        {
            _id = id
        }
        if let title = dict["title"] as? String
        {
            _title = title
        }
        if let posterPath = dict["poster_path"] as? String
        {
            _posterPath = posterPath
        }
        if let overview = dict["overview"] as? String
        {
            _overview = overview
        }
        if let backdropPath = dict["backdrop_path"] as? String
        {
            _backdropPath = backdropPath
        }
        if let voteAverage = dict["vote_average"] as? Double
        {
            _voteAvergae = voteAverage
        }
        
    }
    
    //MARK:- Setters & Getters
    var id: Int {
        get { return _id }
    }
    
    var title: String {
        set { _title = newValue }
        get { return _title }
    }
    
    var posterPath: String {
        set { _posterPath = newValue }
        get { return _posterPath }
    }
    
    var overview: String {
        set { _overview = newValue }
        get { return _overview }
    }
    
    var backdropPath: String {
        set { _backdropPath = newValue }
        get { return _backdropPath }
    }
    
    var voteAverage: Double {
        set { voteAverage = newValue }
        get { return voteAverage }
    }
    
}
