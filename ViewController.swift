//
//  ViewController.swift
//  CareQuest1
//
//  Created by Dhiya Michelle on 19/10/24.
//

import UIKit

class ViewController: UIViewController {
    // Outlets for the text fields
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var phoneTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!

        var contacts: [(name: String, phone: String, email: String)] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        // Action for the Save button
        @IBAction func saveContact(_ sender: UIButton) {
            // Retrieve the input values
            let name = nameTextField.text ?? ""
            let phone = phoneTextField.text ?? ""
            let email = emailTextField.text ?? ""
            
            // Make sure none of the fields are empty
            if name.isEmpty || phone.isEmpty || email.isEmpty {
                showAlert(message: "Please fill in all fields.")
            } else {
                // Save the contact
                let newContact = (name: name, phone: phone, email: email)
                contacts.append(newContact)
                
                // Show success message
                showAlert(message: "Contact saved successfully!")
                
                // Optionally, clear the text fields
                nameTextField.text = ""
                phoneTextField.text = ""
                emailTextField.text = ""
            }
        }

        // Function to show alerts
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }


