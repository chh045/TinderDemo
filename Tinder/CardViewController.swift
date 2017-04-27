//
//  CardViewController.swift
//  Tinder
//
//  Created by Huang Edison on 4/26/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var profileImagesView: UIImageView!
    var cardInitialCenter: CGPoint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
        
        let image = UIImage(named: "nav_bar")
        let imageView = UIImageView(image: image)
        //imageView.contentMode = .scaleAspectFit
        //imageView.frame = CGRect(x: 0, y: 0, width: 700, height: 300)
        self.navigationItem.titleView = imageView
        //print(self.navigationItem.titleView?.frame.width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadImage(){
        let image = UIImage(named: "ryan")
        profileImagesView.image = image
        profileImagesView.contentMode = .scaleAspectFill
    }
    
    @IBAction func imageDidPan(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            cardInitialCenter = profileImagesView.center
            //profileImagesView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            //profileImagesView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * Double.pi / 180))

        }
        if sender.state == .changed {
            profileImagesView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            //profileImagesView.transform = view.transform.scaledBy(x: 0.5, y: 0.5)
             self.profileImagesView.transform = CGAffineTransform(rotationAngle: CGFloat(0.5 * translation.x / 180))

        }
        
        if sender.state == .ended {
            //profileImagesView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            UIImageView.animate(withDuration: 0.3, animations: { 
                self.profileImagesView.center = self.cardInitialCenter
                self.profileImagesView.transform = CGAffineTransform(rotationAngle: 0)
            })
            
            if velocity.x > 1500 || translation.x > 120 {
                UIImageView.animate(withDuration: 0.2, animations: {
                    self.profileImagesView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: self.cardInitialCenter.y)
                })
            }
            
            if velocity.x < -1500 || translation.x < -120  {
                UIImageView.animate(withDuration: 0.2, animations: {
                    self.profileImagesView.center = CGPoint(x: self.cardInitialCenter.x-500, y: self.cardInitialCenter.y)
                })
            }
        }
    }
    
    
    @IBAction func buttonOnTap(_ sender: Any) {
        if let cardInitialCenter = cardInitialCenter {
            profileImagesView.center = cardInitialCenter
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
