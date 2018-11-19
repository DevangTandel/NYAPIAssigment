//
//  Formatters.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import Foundation

struct Formatters {
    //TODO: Move objective c and swift formatters to one place
    static let dayMonthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let iso8601Formatter = ISO8601DateFormatter()
}
