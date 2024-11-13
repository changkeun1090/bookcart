//
//  BookDetailVC.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/13/24.
//

import UIKit

class BookDetailVC: UIViewController {
    
    var book: Book?
    
    let infoContainerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupContainers()
    }
    
    private func setupContainers() {
        
        view.addSubview(infoContainerView)
        
//        infoContainerView.backgroundColor = .systemBackground
        infoContainerView.backgroundColor = .red
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
        ])
    
    }
}
