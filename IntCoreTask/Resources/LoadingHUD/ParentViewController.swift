//
//  ParentViewController.swift
//  Marriage
//
//  Created by ZooZoo on 12/17/16.
//  Copyright © 2016 ZooZoo. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    var hud : MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //MARK: - progress hud
    func showLoading()
    {
        //        self.view.alpha = 0.5
        //    self.view.backgroundColor = UIColor.blackColor()
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDModeIndeterminate
    }
    
    func showLoadingWith(heading label: String? , details detaliesLabel: String?)
    {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDModeIndeterminate
        
        if let label = label {
            hud.labelText = label
        }
        
        if let details = detaliesLabel {
            hud.detailsLabelText = details
        }
    }
    
    func hideLoading()
    {
        //        self.view.alpha = 1.0
        self.hud.hide(true)
    }

}
