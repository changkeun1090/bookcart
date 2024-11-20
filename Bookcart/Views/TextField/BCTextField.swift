//
//  BCTextField.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/6/24.
//

import UIKit

class BCTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
//        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        // text길어지면 font-size가 작아지도록 한다.
        minimumFontSize = 12
        // 아무맂 작아져도 12미만으로 작아지지 않도록 한다.
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .go
        clearButtonMode = .whileEditing
        // text 입력시 지울 수 있는 (x) 마크가 생김
        placeholder = "제목, 저자, 출판사 등"
        
        setLeftView()
    }
    
    private func setLeftView() {
        // Create an image view with the search icon
        let iconImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        iconImageView.tintColor = .systemGray
        
        // Wrap the icon in a UIView with padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
        iconImageView.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        paddingView.addSubview(iconImageView)
        
        // Set the paddingView as the left view
        leftView = paddingView
        leftViewMode = .always
    }
}
