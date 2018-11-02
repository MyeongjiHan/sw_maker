//
//  PortalViewController.swift
//  yourThing
//
//  Created by CAU on 01/11/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class PortalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var lostPlace: UITextField!
    @IBOutlet weak var lostCategory: UITextField!
    
    let categoriesPicker = UIPickerView()
    
    let categories = ["분실물 종류를 선택해주세요.","가방","귀금속","쇼핑백","의류","자동차","전자기기","휴대폰","지갑","증명서","카드","현금","도서용품","사무용품","산업용품","스포츠용품","컴퓨터","기타물품"]
    
    var userLostPlace = ""
    var userLostCategory = ""
    
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
        
        lostCategory.inputView = categoriesPicker
        lostCategory.inputAccessoryView = toolBar
        categoriesPicker.delegate = self
        
        if let place = lostPlace.text {
            userLostPlace = place
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lostCategory.text = categories[row]
    }
    
    @objc func doneClicked() {
        userLostCategory = lostCategory.text!
        self.view.endEditing(true)
    }
    
    @objc func cancelClicked() {
        self.view.endEditing(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ResultTableViewController
        
        nextView.userLostCategory = userLostCategory
        
        if let place = lostPlace.text {
            nextView.userLostPlace = place
        }
    
    }
    

}
