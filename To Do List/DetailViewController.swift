//
//  DetailViewController.swift
//  To Do List
//
//  Created by Bryan Kim on 2/15/18.
//  Copyright © 2018 Bryan Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var toDoField: UITextField!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoNoteView: UITextView!
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
        
    }
    
    func enableDisableSaveButton(){
            if toDoField.text!.count > 0 {
                saveBarButton.isEnabled = true
            } else {
                saveBarButton.isEnabled = false
            }
            
        }
    

    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
        
        // OR
        /* if let num = toDoField.text?.count {
         if num > 0 {
            saveBarButton.isEnabled = true
         } else {
         saveBarButton.isEnabled = false
         }
         }
        */
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
    // get out of present modally
            dismiss(animated: true, completion: nil)
        } else {
        // getting out of show segue
            navigationController?.popViewController(animated: true)
        }
    }
    

   
}
