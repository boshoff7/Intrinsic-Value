//
//  String+Extensions.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/06/05.
//

import Foundation

extension String {
    
    var addDollarSign: String {
        return "$ \(self)"
    }
    
    var doubleValue: Double {
        return Double(self)!
    }
}
