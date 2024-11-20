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
    var separator: UILabel = {
        let separatorLabel = UILabel()
        separatorLabel.text = "|"
        separatorLabel.textAlignment = .center
        separatorLabel.textColor = .secondaryLabel
        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        return separatorLabel
    }()
    var contents = BCBodyLabel(textAlignment: .center, color: .secondaryLabel)
    
    var callToActionButton = BCButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureBookDetailContainer()
        configureBookDetail()
        configureButton()
    }
    
    private func configureBookDetailContainer() {
        
        view.addSubview(bookDetailContainer)
        bookDetailContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookDetailContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookDetailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookDetailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = .secondarySystemFill
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        bookDetailContainer.addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.heightAnchor.constraint(equalToConstant: 1),
            bottomBorder.bottomAnchor.constraint(equalTo: bookDetailContainer.bottomAnchor),
            bottomBorder.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            bottomBorder.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor)
        ])
        
    }
    
    private func configureBookDetail() {
        
        let topBottomPadding:CGFloat = 10
        
        // MARK: Book Image
        bookDetailImageView.thumnail = book?.thumbnail
        bookDetailContainer.addSubview(bookDetailImageView)
        bookDetailImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bookDetailImageView.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            bookDetailImageView.topAnchor.constraint(equalTo: bookDetailContainer.topAnchor, constant: topBottomPadding+10),
            bookDetailImageView.widthAnchor.constraint(equalToConstant: 100),  // Set width as needed
            bookDetailImageView.heightAnchor.constraint(equalToConstant: 140)  // Set height as needed
        ])
        
        // MARK: Book Title
        titleLabel.text = book?.title
        bookDetailContainer.addSubview(titleLabel)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.85
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bookDetailImageView.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // MARK: Book Author
        authorLabel.text = book?.authors.first
        bookDetailContainer.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: topBottomPadding),
            authorLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            authorLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            authorLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // MARK: Book Publisher & Date
        publisherLabel.text = book?.publisher
        dateLabel.text = book?.datetime.convertToDisplayFormat()

        bookDetailContainer.addSubview(publisherLabel)
        bookDetailContainer.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            
            publisherLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: topBottomPadding),
            publisherLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            publisherLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            publisherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: topBottomPadding),
            dateLabel.centerXAnchor.constraint(equalTo: bookDetailContainer.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: bookDetailContainer.widthAnchor, multiplier: 0.8),
            dateLabel.bottomAnchor.constraint(equalTo: bookDetailContainer.bottomAnchor, constant: -topBottomPadding-10)
        ])
    }
    
    private func configureButton() {
        callToActionButton.set(background: .systemBlue, title: "저장하기")
        view.addSubview(callToActionButton)
 
        callToActionButton.addTarget(self, action: #selector(addOrRemove), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.topAnchor.constraint(equalTo: bookDetailContainer.bottomAnchor, constant: 65),
            callToActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
            callToActionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    @objc func addOrRemove() {
        print(book!.title)
    }
}


/*
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
*/


/*
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
*/
