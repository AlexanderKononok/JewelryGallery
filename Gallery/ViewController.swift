//
//  ViewController.swift
//  Gallery
//
//  Created by Alexander Kononok on 10/18/20.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  let arrImages = ["Gold-Ring-1", "Gold-Ring-2", "Gold-Ring-3", "Gold-Ring-4"]
  var indexArr = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ringImage = UIImage(named: arrImages.first!)
    
    imageView.image = ringImage
    imageView.contentMode = .scaleToFill
    imageView.layer.cornerRadius = imageView.frame.width / 2
    
//    imageView.layer.shadowColor = UIColor.systemOrange.cgColor
//    imageView.layer.shadowOpacity = 1
//    imageView.layer.shadowOffset = CGSize(width: 5, height: -5)
//    imageView.layer.shadowRadius = 20

    view.backgroundColor = .black
    
    let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(showNewImage(_:)))
    leftSwipeGesture.direction = .left
    view.addGestureRecognizer(leftSwipeGesture)
    
    let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(showNewImage(_:)))
    rightSwipeGesture.direction = .right
    view.addGestureRecognizer(rightSwipeGesture)
    
  }
  
  @objc func showNewImage(_ swipeGesture: UISwipeGestureRecognizer) {
    switch swipeGesture.direction {
    case .left:
      if indexArr < arrImages.count - 1 {
        indexArr += 1
        self.imageView.center.x = view.frame.maxX
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut]) {
          let ringImage = UIImage(named: self.arrImages[self.indexArr])
          self.imageView.image = ringImage
          self.imageView.center.x = 0
        }
      } else {
        indexArr = 0
        self.imageView.center.x = view.frame.maxX
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut]) {
          let ringImage = UIImage(named: self.arrImages[self.indexArr])
          self.imageView.image = ringImage
          self.imageView.center.x = 0
        }
      }
    case .right:
      if indexArr > 0 {
        indexArr -= 1
        self.imageView.center.x = view.frame.minX - self.imageView.frame.width
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut]) {
          let ringImage = UIImage(named: self.arrImages[self.indexArr])
          self.imageView.image = ringImage
          self.imageView.center.x = 0
        }
      } else {
        indexArr = arrImages.count - 1
        self.imageView.center.x = view.frame.minX - self.imageView.frame.width
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut]) {
          let ringImage = UIImage(named: self.arrImages[self.indexArr])
          self.imageView.image = ringImage
          self.imageView.center.x = 0
        }
      }
    default:
      print("")
    }
  }
  
  
}

