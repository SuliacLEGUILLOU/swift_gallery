//
//  CustomCell.swift
//  d03
//
//  Created by Suliac LE-GUILLOU on 3/30/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

protocol ErrorDelegate: class {
    func loadingError()
}

class CustomCell: UICollectionViewCell {
    var item: String? {
        didSet {
            let url: URL = URL(string: item!)!
            DispatchQueue.global(qos: .userInitiated).async {
                self.indicator.startAnimating()
                do {
                    let imageData:Data
                    try imageData = Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: imageData)
                        self.indicator.stopAnimating()
                    }
                } catch {
                    print("ERROR \(error)")
                    self.indicator.stopAnimating()
                    self.handleError()
                }
            }
        }
    }
    
    weak var delegate: ErrorDelegate?
    
    @objc func handleError() {
        print("POPIN UP")
        self.delegate?.loadingError()
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.color = .black
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(indicator)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        indicator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        indicator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        indicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        indicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
