//
//  Data.swift
//  Sopt27ThirdSeminar
//
//  Created by soyounglee on 2020/10/31.
//

import UIKit

struct Music {
    let title: String
    let singer: String
    let albumImageName: String
    
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
}



