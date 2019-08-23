//
//  ViewController.swift
//  PinterestApplication
//
//  Created by Kaiserdem on 22.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //MARK: Outlets
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  //MARK: Properties
  
  let images = [#imageLiteral(resourceName: "image-1.jpg"),#imageLiteral(resourceName: "image-2.jpg"),#imageLiteral(resourceName: "image-3.jpg"),#imageLiteral(resourceName: "image-4.jpg"),#imageLiteral(resourceName: "image-5.jpg"),#imageLiteral(resourceName: "image-6.jpg"),#imageLiteral(resourceName: "image-7.jpg")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let layout = collectionView.collectionViewLayout as? PinterestLayout {
      layout.delegate = self
    }
    collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
  }


}

// MARK: Flow layout delegate
extension ViewController: PinterestLayoutDelegate  {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
    let image = images[indexPath.item]
    let height = image.size.height
    
    return height
  }
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let numberOfColumns: CGFloat = 3
//    let width = collectionView.frame.size.width
//    let xInsets: CGFloat = 10
//    let cellSpacing: CGFloat = 5
//    let image = images[indexPath.item]
//    let height = image.size.height
//
//    return CGSize(width: (width / numberOfColumns) - (xInsets + cellSpacing), height: height)
//  }
}

// MARK: Data sourse

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
    let image  = images[indexPath.item]
    cell.imageView.image = image
    return cell
  }
  
  
}
