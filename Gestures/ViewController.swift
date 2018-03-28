//
//  ViewController.swift
//  Gestures
//
//  Created by Isaac Ballas on 2018-03-28.
//  Copyright © 2018 Isaac Ballas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureLabel: UILabel!
    @IBOutlet weak var rectangleView: UIView!
    
    let longPressText = "Let go of me"
    let swipeText = "You swiped me"
    let edgePanText = "Edge Pan"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectangleView = UIView(frame: CGRect(x:150, y:250, width: 200, height: 100))
        rectangleView.backgroundColor = .green
        view.addSubview(rectangleView)
        
        gestureLabel.text = ""
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleEdgePan(recognizer:)))
        
        rectangleView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture, longPressGesture]
        view.gestureRecognizers = [swipeGesture, edgePanGesture]
    
        
    }
    
    @objc func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        print(swipeText)
        gestureLabel.text = swipeText
    }
    
    
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer){ //Consider using @objc as a class?
        print(longPressText)
        gestureLabel.text = longPressText
    }
    
    @objc func handleEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        print (edgePanText)
        gestureLabel.text = edgePanText
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        recognizer.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

