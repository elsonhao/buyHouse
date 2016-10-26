//
//  ViewController.swift
//  buyHouse
//
//  Created by 黃毓皓 on 2016/10/25.
//  Copyright © 2016年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var mytimer = Timer()
    var addTime:Float = 0.0
    
    var chooseCareer = "無"
    var careerOption = ["律師","醫生","鄉民","ios工程師"]
    @IBOutlet weak var career: UIPickerView!
    @IBOutlet weak var trueOrfalse: UISegmentedControl!
    @IBOutlet weak var knowPeterpan: UISwitch!
    @IBOutlet weak var income: UISlider!
    @IBOutlet weak var analysising: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var result: UISegmentedControl!
    @IBOutlet weak var moneyShow: UILabel!
    
    
    @IBAction func incomeChange(_ sender: AnyObject) {
        moneyShow.text = String(Int(income.value)) + "萬元"
        
    }
    
    
    func progressAdd() {
        addTime += 0.2
        progress.progress = addTime
        if addTime >= 1{
            result.isHidden = false
            
            mytimer.invalidate()
        }
        
    }
    
    @IBAction func analysis(_ sender: UIButton) {
        result.isHidden = true
        progress.progress = 0
        addTime = 0
        progress.isHidden = false
        analysising.isHidden = false
        
        if trueOrfalse.selectedSegmentIndex == 0 && knowPeterpan.isOn == true && chooseCareer == "ios工程師" && income.value > 3 {
            
            
            mytimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.progressAdd), userInfo: nil, repeats: true)
            result.selectedSegmentIndex = 0
        }else{
            mytimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.progressAdd), userInfo: nil, repeats: true)
            result.selectedSegmentIndex = 1
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.progress = 0
        result.isHidden = true
        analysising.isHidden = true
        progress.isHidden = true
        knowPeterpan.isOn = false
        trueOrfalse.selectedSegmentIndex = 1
        income.maximumValue = 20
        income.setValue(10, animated: false)
      moneyShow.text = String(Int(income.value)) + "萬元"
        career.delegate = self
        career.dataSource = self
      
    }
    
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return careerOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return careerOption[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseCareer = careerOption[row]
    }
    
    
    
    
    

}

