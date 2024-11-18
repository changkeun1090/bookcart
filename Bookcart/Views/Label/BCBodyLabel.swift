//
//  BCBodyLabel.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/11/24.
//

import UIKit

class BCBodyLabel: UILabel {

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
    
    convenience init(textAlignment: NSTextAlignment = .natural, color: UIColor) {
        self.init(frame: .zero)
        self.textColor = color
        self.textAlignment = textAlignment
    }

    private func configure() {
        textColor = .label
        
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true // system 설정에 따라 Font size 변화
        
        lineBreakMode = .byTruncatingTail
        self.numberOfLines = 1
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

/*
adjustsFontSizeToFitWidth = true // text길어지면 size 줄어든다.
minimumScaleFactor = 0.75 // 최대로 줄어들 수 있는 크기 설정
 */
