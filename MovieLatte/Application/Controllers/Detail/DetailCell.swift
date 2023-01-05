//
//  DetailCell.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var homepageLinkLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet weak var orginaltitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var taglieLabel: UILabel!
    
    var detail : DetailUIModel! {
        didSet {
            homepageLinkLabel.makeLink(title: "Homepage : ", for: detail.homepage)
            homepageLinkLabel.setOnClickListener(userInfo: [:]) { [weak self] respo in
                guard let self = self, let url = URL(string: self.detail.homepage ?? "") else { return }
                CustomeBroweser(controller: UIWindow.key?.rootViewController).open(openURL: url)
            }
            orginaltitleLabel.animatedTextWithTitle(title: "Original title : ", for: detail.originalTitle)
            overviewLabel.animatedTextWithTitle(title: "Overview : ", for: detail.overview)
            taglieLabel.text = detail.tagline
            genreTitle.animatedTextWithTitle(title: "Genre :", for: (detail.genres ?? []).map{$0.name ?? "" }.joined(separator: ", "))
            
            let totalString = NSMutableAttributedString()
            let headerAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
            let subtitleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
            
            let dict = Dictionary(grouping: (detail.credits?.crew ?? []), by: \.department)
            _ = dict.map { repos in
                let header = NSMutableAttributedString(attributedString: NSAttributedString(string: (repos.key ?? "") + ": ", attributes: headerAttribute))
                header.append(NSAttributedString(string: repos.value.map { $0.name ?? "" }.joined(separator: ", "), attributes: subtitleAttribute))
                totalString.append(header)
                if dict.map({ $0.key ?? "" }).last ?? "" != repos.key {
                    totalString.append(NSMutableAttributedString(string: "\n\n"))
                }
            }
            
            crewLabel.isUserInteractionEnabled = true
            crewLabel.attributedText = totalString
            crewLabel.numberOfLines = dict.count.hashValue
        }
        
    }
    
}
