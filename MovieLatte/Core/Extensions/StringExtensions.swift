//
//  Extensions.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation

extension StringProtocol{
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}

