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
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontForContentSizeCategory = true // system 설정에 따라 Font size 변화
        
        lineBreakMode = .byTruncatingTail
        self.numberOfLines = 1
    }
}
