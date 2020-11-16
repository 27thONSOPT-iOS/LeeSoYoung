//
//  ViewController.swift
//  Sopt27FirstSeminar
//
//  Created by soyounglee on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = "Sopt 27기\n첫 세미나"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstBtnClicked(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(dvc, animated: true)
//        self.present(dvc, animated: true, completion: nil)
    }
    
    
    
}

