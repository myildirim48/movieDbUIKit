//
//  UITableViewCell+Extensions.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    // Type Level
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    func showAnimation(){
        alpha = 0.0
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
}
