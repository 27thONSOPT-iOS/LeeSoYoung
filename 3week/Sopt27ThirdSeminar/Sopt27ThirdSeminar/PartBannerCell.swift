//
//  PartBannerCell.swift
//  Sopt27ThirdSeminar
//
//  Created by soyounglee on 2020/10/31.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    
    @IBOutlet weak var partImageView: UIImageView!
    
    static let identifier = "PartBannerCell"
    
    func setImage(imageName: String) {
        partImageView.image = UIImage(named: imageName)
    }
}
