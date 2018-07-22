//
//  AsyncImageView.swift
//  AsyncImageViewWithCashe
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString,UIImage>()

class AsyncImageView: UIImageView {

    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String)
    {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCashe = imageCache.object(forKey: urlString as NSString)
        {
            self.image = imageFromCashe
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, resp, error) in
            if error != nil
            {
                debugPrint(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let imageToCashe = UIImage(data: data!)
                {
                    if self.imageUrlString == urlString
                    {
                        self.image = imageToCashe
                    }
                    imageCache.setObject(imageToCashe, forKey: urlString as NSString)
                }
            }
        }.resume()
    }
    
    

}
