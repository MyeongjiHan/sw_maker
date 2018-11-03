//
//  TransportationViewController.swift
//  yourThing
//
//  Created by CAU on 01/11/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class TransportationViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var selectedPlace = ""
    var selectedCate = ""

    @IBOutlet weak var lostPlaceHol: UITextField!
    @IBOutlet weak var cateHold: UITextField!
    
    let placePicker = UIPickerView()
    let places = ["버스":"b1","마을버스":"b2","법인택시":"t1","개인택시":"t2","지하철(1~4호선)":"s1","지하철(5~8호선)":"s2","코레일":"s3","지하철(9호선)":"s4"]
    let catePicker = UIPickerView()
    let categories = ["지갑", "쇼핑백", "서류봉투", "가방", "베낭", "핸드폰", "옷", "책", "파일", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelClicked))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        lostPlaceHol.inputView = placePicker
        cateHold.inputView = catePicker
        lostPlaceHol.inputAccessoryView = toolBar
        cateHold.inputAccessoryView = toolBar
        placePicker.delegate = self
        catePicker.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == placePicker {
            return places.count
        } else {
            return categories.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == placePicker {
            let a = Array(places.keys)
            let a2 = a[row]
            return a2
        }else {
            return categories[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == placePicker {
            let b = Array(places.values)[row]
            lostPlaceHol.text = b
            
        } else {
            cateHold.text = categories[row]
        }
        
    }
    @objc func doneClicked() {
        selectedPlace = lostPlaceHol.text!
        selectedCate = cateHold.text!
        print("selectedCate는 \(selectedCate)")
        
        self.view.endEditing(true)
    }
    @objc func cancelClicked() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ListTableViewController {
            if let encodedCate = selectedCate.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                print("encode된 분류는\(encodedCate)")
                nextVC.urlPath = "\(encodedCate)/\(selectedPlace)/"}
        }
    }

    
}
