//
//  PosterHeaderCell.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import UIKit

class PosterHeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var textDatalabel: UILabel!
    @IBOutlet weak var gradientContainer: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var containerview: UIView!
    
    var gradientLayer : CAGradientLayer?
    var completionColor: ((_ data: UIColor,_ image: UIImage)->())?
    
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
            textDatalabel.text = text
            
            if let poster = data?.backdropPosterUrlString {
                posterImageView.setImage(imageUrl: poster)
            }
        }
    }

    override func layoutSubviews() {
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer?.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.9).cgColor]
            gradientLayer?.frame.size = gradientContainer.frame.size
            gradientContainer?.layer.insertSublayer(gradientLayer! , at: 0)
        }
    }
}

extension CAGradientLayer {
    enum Point {
        case topLeft
        case centerLeft
        case bottomLeft
        case topCenter
        case center
        case bottomCenter
        case topRight
        case centerRight
        case bottomRight
        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .centerLeft:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeft:
                return CGPoint(x: 0, y: 1.0)
            case .topCenter:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottomCenter:
                return CGPoint(x: 0.5, y: 1.0)
            case .topRight:
                return CGPoint(x: 1.0, y: 0.0)
            case .centerRight:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomRight:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    convenience init(start: Point, end: Point, colors: [CGColor], type: CAGradientLayerType) {
        self.init()
        self.startPoint = start.point
        self.endPoint = end.point
        self.colors = colors
        self.locations = (0..<colors.count).map(NSNumber.init)
        self.type = type
    }
}

