//
//  ViewController.swift
//  d03
//
//  Created by Suliac LE-GUILLOU on 3/29/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseId = "myid"
    let images:[String] = [
        "https://apod.nasa.gov/apod/image/1803/NGC247_70mosSchedler1024.jpg",
        "https://farm1.staticflickr.com/792/40945513351_9a7401c250_o.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-h-p1816a-f-3000x2000.png",
        "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/insight.jpg",
        "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/27024283098_4f984e095a_o.jpg",
        "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss054e005626_lrg.jpg",
        "LOLNOPE"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Images"
        collectionView?.backgroundColor = .clear
        view.backgroundColor = .white
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width / 2 - 1, height: collectionView.frame.height / 6)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        print(images[indexPath.item])
        cell.item = images[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension ViewController: ErrorDelegate {
    func loadingError() {
        let alert = UIAlertController(title: "Image Loading Failed", message: "An error occured during loading of images", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cancel)
        navigationController?.present(alert, animated: true, completion: nil)
    }
}

