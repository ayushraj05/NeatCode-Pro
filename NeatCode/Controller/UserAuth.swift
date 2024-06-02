//
//  UserAuth.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import UIKit

protocol UserAuthDelegate{
    func searchUsername(username: String)
}

class UserAuth: UIViewController {

    @IBOutlet weak var UserNameEntered: UITextField!
    var delegate : UserAuthDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   

}

//MARK: - UITextFieldDelegate

extension UserAuth: UITextFieldDelegate{
    
    @IBAction func FetchDataGotPressed(_ sender: UIButton) {
        UserNameEntered.endEditing(true) // forcefully stoping the edditing in the textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserNameEntered.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let userName =  UserNameEntered.text  {
            // will send the username to the viewController to fech the data :)
            self.delegate?.searchUsername(username: userName)
        }
        
        UserNameEntered.text = ""
    }

}
