//
//  EntryViewController.swift
//  ToDoList
//
//  Created by Konpyūtā on 11.11.2021.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var textField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        return true
    }
    
    @objc func saveTask() {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
    }
}
