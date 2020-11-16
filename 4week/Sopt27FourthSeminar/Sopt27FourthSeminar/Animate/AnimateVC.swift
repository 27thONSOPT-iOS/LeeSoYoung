//
//  AnimateVC.swift
//  Sopt27FourthSeminar
//
//  Created by soyounglee on 2020/11/07.
//

import UIKit

class AnimateVC: UIViewController {
    @IBOutlet weak var flowerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startBtn(_ sender: Any) {
        
        let newPosition = CGRect(x: 100, y: 100, width: 300, height: 200)
        UIView.animate(withDuration: 3.0, animations: {
            self.flowerImage.frame = newPosition
        }) { finished in
            UIView.animate(withDuration: 2.0) {
                self.initPosition()
            }
        }
    }
    
    @IBAction func secondBtn(_ sender: Any) {
        
        //CGAffineTransform : 오토레이아웃이 적용되어 있으면 애니메이션 지정이 잘 되지 않기때문에 사용.
        let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let rotate = CGAffineTransform(rotationAngle: .pi / 4)
        let move = CGAffineTransform(translationX: 200, y: 200)
        let combine = scale.concatenating(move).concatenating(rotate)
        UIView.animate(withDuration: 1.0, animations: {
            self.flowerImage.transform = combine
        }) { finished in
            UIView.animate(withDuration: 1.0) {
                // 속성 해제 : 제자리로 돌아간다.
                self.flowerImage.transform = .identity
            }
        }
    }
    
    func initPosition() {
        flowerImage.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
    }
}
