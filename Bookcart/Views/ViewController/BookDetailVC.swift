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
    var publisherLabel = BCBodyLabel(textAlignment: .right, color: .secondaryLabel)
    var dateLabel = BCBodyLabel(textAlignment: .left, color: .secondaryLabel)
    var separator: UILabel = {
        let separatorLabel = UILabel()
        separatorLabel.text = "|"
        separatorLabel.textAlignment = .center
        separatorLabel.textColor = .secondaryLabel
        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        return separatorLabel
    }()
    var contents = BCBodyLabel(textAlignment: .center, color: .secondaryLabel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureBookDetailContainer()
        
//        print(book!)
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
        
        // MARK: Book Image
        bookDetailImageView.thumnail = book?.thumbnail
        bookDetailContainer.addSubview(bookDetailImageView)
        bookDetailImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bookDetailImageView.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            bookDetailImageView.topAnchor.constraint(equalTo: bookDetailContainer.topAnchor, constant: 15),
            bookDetailImageView.widthAnchor.constraint(equalToConstant: 100),  // Set width as needed
            bookDetailImageView.heightAnchor.constraint(equalToConstant: 140)  // Set height as needed
        ])
        
        // MARK: Book Title
        titleLabel.text = book?.title
        bookDetailContainer.addSubview(titleLabel)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.85
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bookDetailImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // MARK: Book Author
        authorLabel.text = book?.authors.first
        bookDetailContainer.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            authorLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            authorLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            authorLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // MARK: Book Publisher & Date
        publisherLabel.text = book?.publisher
        dateLabel.text = book?.datetime.convertToDisplayFormat()
        
        bookDetailContainer.addSubview(publisherLabel)
        bookDetailContainer.addSubview(separator)
        bookDetailContainer.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            publisherLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            separator.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            
            publisherLabel.heightAnchor.constraint(equalToConstant: 20),
            separator.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
                        
            publisherLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.3),
            publisherLabel.trailingAnchor.constraint(equalTo: separator.leadingAnchor, constant: -5),
            
            separator.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            separator.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.05),
            
            dateLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 5),
            dateLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.3),
        ])
        
        // MARK: Book Desciption
        contents.text = book?.contents
        bookDetailContainer.addSubview(contents)
        
        contents.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            contents.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 15),
            contents.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            contents.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            contents.bottomAnchor.constraint(equalTo: bookDetailContainer.bottomAnchor, constant: -15)
        ])
    }
}

