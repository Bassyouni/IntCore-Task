//
//  RoundImageView.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: AsyncImageView {

    
    func setupView(cornerRadius: CGFloat)
    {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            guard  cornerRadius >= 0 else{
                return
            }
            
            setupView(cornerRadius: cornerRadius)
        }
    }
    

}
