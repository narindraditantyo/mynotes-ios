//
//  AddEditViewController.swift
//  mynotes
//
//  Created by Narindra Aditantyo on 09/11/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputCategory: UITextField!
    @IBOutlet weak var inputDesc: UITextView!
    
    var category: String?
    var note: Notes?
    var categoryIndex: Int?
    var noteIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add/Edit Note"
                
        inputDesc.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor
        inputDesc.layer.borderWidth = 0.5
        inputDesc.layer.cornerRadius = 5
        
        if let data = note {
            inputTitle.text = data.title
            inputCategory.text = category
            inputDesc.text = data.desc
        } else {
            inputTitle.text = ""
            inputCategory.text = ""
            inputDesc.text = ""
        }
    }
    
    @IBAction func saveNote(_ sender: Any) {
        if inputTitle.text!.count != 0 && inputCategory.text!.count != 0 && inputDesc.text.count >= 20 {
            if categoryIndex != nil && noteIndex != nil {
                arrCategories[categoryIndex!] = inputCategory.text!
                arrNotes[categoryIndex!][noteIndex!] = Notes(title: inputTitle.text!, desc: inputDesc.text!)
            } else {
                for (index, _) in arrCategories.enumerated() {
                    if arrCategories[index].lowercased() == inputCategory.text?.lowercased() {
                        categoryIndex = index
                    }
                }
                
                if categoryIndex == nil {
                    arrCategories.append(inputCategory.text!.capitalized)
                    arrNotes.append([Notes]())
                    arrNotes[arrCategories.count-1].append(Notes(title: inputTitle.text!, desc: inputDesc.text!))
                } else {
                    arrNotes[categoryIndex!].append(Notes(title: inputTitle.text!, desc: inputDesc.text!))
                }
            }
            
            self.navigationController?.popViewController(animated: true)
        } else {
            var errorMessage: String = "Can't save note because:"
            
            if inputTitle.text!.count == 0 {
                errorMessage += "\n\u{2022} Title can't be empty"
            }
            if inputCategory.text!.count == 0 {
                errorMessage += "\n\u{2022} Category can't be empty"
            }
            if inputDesc.text.count < 20 {
                errorMessage += "\n\u{2022} Description is less than 20 characters"
            }
            
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

}
