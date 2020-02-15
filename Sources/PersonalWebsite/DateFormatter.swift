//
//  DateFormatter.swift
//  
//
//  Created by Maciej Kowalski on 11/02/2020.
//

import Foundation

extension DateFormatter {
    static var article: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
