//
//  BCBookImageView.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/11/24.
//

import UIKit

class BCBookImageView: UIImageView {
    
    var thumnail: String? {
        didSet {
            configure()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
        clipsToBounds = true
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        guard let imageUrl = thumnail else {
            self.image = UIImage(systemName: "book")
            return
        }
        
        guard let url = URL(string: imageUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            if error != nil {return}
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
        task.resume()
    }
    
}
