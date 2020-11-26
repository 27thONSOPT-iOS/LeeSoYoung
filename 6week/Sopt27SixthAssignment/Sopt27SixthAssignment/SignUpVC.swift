//
//  SignUpVCViewController.swift
//  Sopt27SixthAssignment
//
//  Created by soyounglee on 2020/11/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default) { (action) in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        guard let emailText = emailTF.text,
              let passwordText = passwordTF.text,
              let usernameText = usernameTF.text else {
            return
        }
        
        
        SignUpService.shared.signUp(email: emailText,
                                    password: passwordText,
                                    userName: usernameText) { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                print(data)
                
                if let signUpData = data as? SignInData {
                    print("success")
                    self.simpleAlert(title: "회원가입 성공", message:
                                        
                                        "\(signUpData.userName)님 회원가입 성공!")
                    
                    UserDefaults.standard.set(signUpData.userName, forKey: "userName")
                }
            case .requestErr(let msg):
                
                if let message = msg as? String {
                    self.simpleAlert(title: "회원가입 실패", message: message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
        
        
        
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
