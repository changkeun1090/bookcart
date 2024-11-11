//
//  SearchCell.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/11/24.
//

import UIKit

class SearchCell: UITableViewCell {
    
    static let reuseId = "SearchCell"
    
    private var bookImage = BCBookImageView(frame: .zero)
    private var titleLabel = BCTitleLabel(frame: .zero)
    private var authorLabel = BCBodyLabel(frame: .zero)
    private var publisherLabel = BCBodyLabel(frame: .zero)
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(bookImage)
        addSubview(infoStackView)
        
        configureStackView()
        
        NSLayoutConstraint.activate([
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bookImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bookImage.widthAnchor.constraint(equalToConstant: 40),
            bookImage.heightAnchor.constraint(equalToConstant: 40),
            
            infoStackView.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            infoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    private func configureStackView() {
        infoStackView.addSubview(titleLabel)
        infoStackView.addSubview(authorLabel)
        infoStackView.addSubview(publisherLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: infoStackView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor, constant: 0),
            authorLabel.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 0),
            authorLabel.heightAnchor.constraint(equalToConstant: 20),
            
            publisherLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            publisherLabel.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor, constant: 0),
            publisherLabel.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 0),
            publisherLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func set(book: Book) {
        bookImage.thumnail = book.thumbnail
        titleLabel.text = book.title
        
        if book.authors.isEmpty {
            authorLabel.text = ""
        } else {
            authorLabel.text = book.authors[0]
        }
        
    }
}
