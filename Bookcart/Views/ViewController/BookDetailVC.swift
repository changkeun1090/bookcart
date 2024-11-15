//
//  BookDetailVC.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/13/24.
//

import UIKit

class BookDetailVC: UIViewController {
    
    var book: Book?
    
    let bookDetailContainer = UIView()
    let bookDetailImageView = BCBookImageView(frame: .zero)
    
    var titleLabel = BCTitleLabel(textAlignment: .center, fontSize: .title2)
    var authorLabel = BCBodyLabel(textAlignment: .center)
    var publisherLabel = BCBodyLabel(textAlignment: .center, color: .secondaryLabel)
    var dateLabel = BCBodyLabel(textAlignment: .center, color: .secondaryLabel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureBookDetailContainer()
    }
    
    private func configureBookDetailContainer() {
        
        view.addSubview(bookDetailContainer)
        
        bookDetailContainer.backgroundColor = .quaternarySystemFill
        bookDetailContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookDetailContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookDetailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookDetailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bookDetailContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        configureBookDetail()
    }
    
    private func configureBookDetail() {
        
        // Book Image
        bookDetailImageView.thumnail = book?.thumbnail
        bookDetailContainer.addSubview(bookDetailImageView)
        bookDetailImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bookDetailImageView.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            bookDetailImageView.topAnchor.constraint(equalTo: bookDetailContainer.topAnchor, constant: 15),
            bookDetailImageView.widthAnchor.constraint(equalToConstant: 100),  // Set width as needed
            bookDetailImageView.heightAnchor.constraint(equalToConstant: 140)  // Set height as needed
        ])
        
        // Book Title
        titleLabel.text = book?.title
        bookDetailContainer.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bookDetailImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
        ])
        
        // Book Author
        authorLabel.text = book?.authors.first
        bookDetailContainer.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            authorLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            authorLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
        ])
        
        // Book Publisher & Date - Using a Horizontal Stack View
        publisherLabel.text = book?.publisher
        dateLabel.text = book?.datetime.convertToDisplayFormat()
        
        let publisherDateStackView = UIStackView(arrangedSubviews: [publisherLabel, dateLabel])
        publisherDateStackView.axis = .horizontal
        publisherDateStackView.alignment = .center
        publisherDateStackView.distribution = .fillEqually
        publisherDateStackView.spacing = 5
        bookDetailContainer.addSubview(publisherDateStackView)
        publisherDateStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            publisherDateStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            publisherDateStackView.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            publisherDateStackView.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.5)
        ])
    }
}

