//
//  ViewController.swift
//  GestureRecognizerExample
//
//  Created by R J Herrema on 02/12/2018.
//  Copyright © 2018 R J Herrema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inc = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var pan: UIPanGestureRecognizer!
    
    // only prints to console to illustrate available properties (state, numberOfTouches)
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        if pan.state == .began || pan.state == .changed {
            switch pan.numberOfTouches {
            case 1:
                let point: CGPoint = sender.location(ofTouch: 0, in: self.view)
                print("y value of 1 is \(point.y)")
            case 2:
                let point: CGPoint = sender.location(ofTouch: 1, in: self.view)
                print("x value of 2 is \(point.x)")
            case 3:
                let point: CGPoint = sender.location(ofTouch: 1, in: self.view)
                print("x value of 3 is \(point.x)")
            default:
                break
            }
        }
    }
    
    // moves the image view within its parent view
    @IBAction func panImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        // the 'if let' construction checks to see if sender.view is nil
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    // generates a randomly placed small version of the main image
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        if tap.state == .ended {
            print("was tapped")
            // CG stands for Core Graphics - these kinds of values are holdovers from C
            let randY = CGFloat(arc4random_uniform(400) + 250)
            let randX = CGFloat(arc4random_uniform(200) + 50)
            let newImage = UIImageView(frame: CGRect(x: randX, y: randY, width: 30, height: 20))
            newImage.image = UIImage(named: "scene.jpg")
            // for some reason this resets the main image view, also
            self.view.addSubview(newImage)
        }
    }
    
    
}
