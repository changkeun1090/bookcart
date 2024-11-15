//
//  Date+Ext.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/15/24.
//

import Foundation

extension Date {
    
    // Date -> String
    func convertToMonthYearFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 M월"
        return dateFormatter.string(from: self)
        
    }
}
