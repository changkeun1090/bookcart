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
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
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
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            bookImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bookImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            bookImage.widthAnchor.constraint(equalToConstant: 50),
            bookImage.heightAnchor.constraint(equalToConstant: 70),
            
            infoStackView.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 30),
            infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            infoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    private func configureStackView() {
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(authorLabel)
    }
    
    func set(book: Book) {
        bookImage.thumnail = book.thumbnail
        titleLabel.text = book.title
        
        if book.authors.isEmpty {
            authorLabel.text = "작자 미상"
        } else {
            authorLabel.text = book.authors[0]
        }
        
    }
}
