//
//  Decimal+Extension.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/06/05.
//

import Foundation

struct Number {
    static let formatter = NumberFormatter()
}
extension String {
    var converted: String? {
        return fractionDigits()
    }
    var dubleValue: Double? {
        return Number.formatter.number(from: self)?.doubleValue
    }
    var floatValue: Float? {
        return Number.formatter.number(from: self)?.floatValue
    }
    func fractionDigits(min: Int = 2, max: Int = 2) -> String? {
        Number.formatter.decimalSeparator = "."
        if let result = Number.formatter.number(from: self) {
            Number.formatter.minimumFractionDigits = min
            Number.formatter.maximumFractionDigits = max
            return Number.formatter.string(from: result)
        } else {
            Number.formatter.decimalSeparator = ","
            if let result = Number.formatter.number(from: self) {
                Number.formatter.minimumFractionDigits = min
                Number.formatter.maximumFractionDigits = max
                return Number.formatter.string(from: result)
            }
        }
        return nil
    }
}
