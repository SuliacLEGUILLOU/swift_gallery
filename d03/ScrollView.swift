//
//  ScrollView.swift
//  d03
//
//  Created by Suliac LE-GUILLOU on 3/30/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

class ScrollView: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        return sv
    }()
    
    var item: String? {
        didSet {
            print("Printing \(item!)")
            let url: URL = URL(string: item!)!
            let imageData:Data
            do {
                try imageData = Data(contentsOf: url)
                self.imageView.image = UIImage(data: imageData)
            } catch {
                print("Error \(error)")
            }
            
        }
    }
    
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Detail"
        view.addSubview(scrollView)
        view.addSubview(imageView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        scrollView.contentSize = (imageView.frame.size)
        scrollView.maximumZoomScale = 100
        scrollView.minimumZoomScale = 0.3
        view.backgroundColor = .black
    }
}
