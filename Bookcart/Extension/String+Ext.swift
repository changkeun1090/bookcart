//
//  String+Ext.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/15/24.
//

import Foundation

//: https://www.nsdateformatter.com/

extension String {
    
    // String -> Date
    func convertToDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
    
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else {return "N/A"}
        
        return date.convertToMonthYearFormat()
    }
 
}
