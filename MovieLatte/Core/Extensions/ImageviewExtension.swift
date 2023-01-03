//
//  ImageviewExtension.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
import Kingfisher

 
extension UIImageView {
    
    func setImage(imageUrl : String?) {
        if URL(string: imageUrl!) != nil && imageUrl!.count > 0 {
            let resource = ImageResource(downloadURL: URL(string: imageUrl!)!, cacheKey: imageUrl)
            self.contentMode = .scaleAspectFit
            self.kf.setImage(with: resource, placeholder: UIImage(named : "placeholder") , options: nil, progressBlock: nil, completionHandler: nil)
        }
        else{
            self.image = UIImage(named : "placeholder")
        }
    }
}
