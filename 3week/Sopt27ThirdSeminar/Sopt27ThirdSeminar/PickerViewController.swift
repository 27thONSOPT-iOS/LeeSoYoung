//
//  PickerViewController.swift
//  Sopt27ThirdSeminar
//
//  Created by soyounglee on 2020/10/31.
//

import UIKit

class PickerViewController: UIViewController {
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var parts: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPartData()
        initLayout()
        partPickerView.dataSource = self
        partPickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setPartData() {
        parts.append(contentsOf: [
            Part(imageName: "plan", partName: "Plan"),
            Part(imageName: "design", partName: "Design"),
            Part(imageName: "server", partName: "Server"),
            Part(imageName: "ios", partName: "iOS"),
            Part(imageName: "android", partName: "Android"),
            Part(imageName: "web", partName: "Web")
        ])
    }
    
    func initLayout() {
        let initPart = parts[0]
        partImageView.image = initPart.makeImage()
        partNameLabel.text = initPart.partName
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

extension PickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parts[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectPart = parts[row]
        
        self.partImageView.image = selectPart.makeImage()
        self.partNameLabel.text = selectPart.partName
    }
}

extension PickerViewController: UIPickerViewDataSource {
    
    // 피커뷰의 컴포넌트 숫자를 지정해주는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parts.count
    }
    
    
    
    
    
}


