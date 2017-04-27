//
//  NavigationItemExtension.swift
//  Tinder
//
//  Created by Huang Edison on 4/26/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func setImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        //imageView.frame = CGRect(x: 0, y: 0, width: 380, height: 74)
        let screenSize: CGRect = UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFit
        self.titleView = imageView
        self.titleView?.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 64)
        self.titleView?.contentMode = .scaleAspectFit
    }
}
