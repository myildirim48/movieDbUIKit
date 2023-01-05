//
//  PosterHeaderCell.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import UIKit

class PosterHeaderCell: UITableViewCell {


    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var data: DetailUIModel? {
        didSet {
            var text = ""
            if let date = data?.releaseDateText, !date.isEmpty {
                text = date
            }
            if let rating = data?.voteAverage {
                text += " | ⭐️ " + "\(rating)"
            }
            if let runtime = data?.runTimeString {
                text += " | " + runtime
            }
            dataLabel.text = text
            
            if let poster = data?.backdropPosterUrlString {
                headerImageView.setImage(imageUrl: poster)
                
            }
        }
    }

}

