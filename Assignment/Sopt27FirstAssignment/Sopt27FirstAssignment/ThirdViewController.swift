//
//  ThirdViewController.swift
//  Sopt27FirstAssignment
//
//  Created by soyounglee on 2020/10/11.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var signUpPartTF: UITextField!
    @IBOutlet weak var signUpBirthplaceTF: UITextField!
    @IBOutlet weak var signUpnameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = " Sign Up "
        self.navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        print("Btn signUpClicked")
        
        navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
