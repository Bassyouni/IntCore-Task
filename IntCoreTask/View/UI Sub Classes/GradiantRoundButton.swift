//
//  GradiantRoundButton.swift
//  IntCoreTask
//
//  Created by MacBook Pro on 7/22/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class GradiantRoundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.layer.shadowColor = UIColor.darkGray.cgColor
//        self.layer.shadowRadius = 15
//        self.layer.shadowOpacity = 0.5
        
        self.layer.cornerRadius = self.frame.height / 2
        
        let lightpurpleColor = UIColor(red: 147/255, green: 95/255, blue: 148/255, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.purple.cgColor, lightpurpleColor]
        gradientLayer.locations = [0,1]
        
        
        let angle = -90 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
