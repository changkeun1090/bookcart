//
//  BCTitleLabel.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/11/24.
//

import UIKit

class BCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }

    private func configure() {
        textColor = .secondaryLabel
        
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true // system 설정에 따라 Font size 변화
        
        adjustsFontSizeToFitWidth = true // text길어지면 size 줄어든다.
        minimumScaleFactor = 0.75 // 최대로 줄어들 수 있는 크기 설정
        
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
