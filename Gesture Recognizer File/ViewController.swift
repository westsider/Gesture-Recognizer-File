//
//  ViewController.swift
//  Gesture Recognizer File
//
//  Created by Warren Hansen on 1/10/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIImageView!
    
    @IBOutlet weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
        view.bringSubview(toFront: fileImageView)
    }

    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }

    @objc func handlePan(sender:UIPanGestureRecognizer) {
        
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            
            if fileView.frame.intersects(trashImageView.frame) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.fileImageView.alpha = 0.0
                })
                
            } else {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.fileImageView.frame.origin = self.fileViewOrigin
                })
            }
            
        default:
            break
        }
    }
    
    func 

}

