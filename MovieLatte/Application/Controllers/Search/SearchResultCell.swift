//
//  MultiSearchCell.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var ratingRatioLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dataTypeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        searchImageView.layer.cornerRadius = 20
        searchImageView.clipsToBounds = true
        
        starLabel.textColor = UIColor(red: 0.99, green: 0.80, blue: 0.00, alpha: 1.00)
    }


}
