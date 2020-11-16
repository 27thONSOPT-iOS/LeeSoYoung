//
//  Part.swift
//  Sopt27ThirdSeminar
//
//  Created by soyounglee on 2020/10/31.
//

import UIKit

struct Part {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
