//
//  CollectionViewHelpers.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 15/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollection.dequeueReusableCell(withReuseIdentifier: "cellPrototype", for: indexPath) as! CollectionViewCell
        let image = Gallery[indexPath.row].source
        let cellName = Gallery[indexPath.row].name
//        cell.getImgFromURL(imgUrl: imageURL, imgName: cellName)
        cell.displayCell(image: image, name: cellName)
        
        return cell
    }
}
