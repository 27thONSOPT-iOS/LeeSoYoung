//
//  DataFirstViewController.swift
//  Sopt27FirstSeminar
//
//  Created by soyounglee on 2020/10/10.
//

import UIKit

class DataFirstViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var updateStateLabel: UILabel!
    @IBOutlet weak var updateIntervalLabel: UILabel!
    
    @IBOutlet weak var updateStateSwitch: UISwitch!
    @IBOutlet weak var updateIntervalStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func valueChangedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.updateStateLabel.text = "자동 갱신"
        }
        else {
            self.updateStateLabel.text = "수동 갱신"
        }
    }
    
    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        
        updateIntervalLabel.text = "\(Int(sender.value))분 마다"
    }
    
    @IBAction func touchUpSubmit(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "DataSecondViewController") as? DataSecondViewController else {
            return
        }
        
        dvc.email = self.emailTextField.text
        dvc.isAutoUpdate = self.updateStateSwitch.isOn
        dvc.updateInterval = Int(self.updateIntervalStepper.value)
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
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
