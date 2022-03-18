//
//  AlertViewController.swift
//  czechitas-mobile-app
//
//  Created by Svetlana Margetová on 26.06.16.
//  Copyright © 2016 Svetlana Margetová. All rights reserved.
//

import UIKit

class AlertViewController: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func presentViewController(alert: UIAlertController, animated flag: Bool, completion: (() -> Void)?) -> Void {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: flag, completion: completion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
