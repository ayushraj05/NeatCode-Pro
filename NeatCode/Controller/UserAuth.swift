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

    
    @IBOutlet weak var UserNamegotEntered: UITextField!
    var delegate : UserAuthDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserNamegotEntered.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "UserProfile" {
                if let destinationVC = segue.destination as? ViewController {
                    destinationVC.userAuthDelegate = self
                }
            }
        }

}

//MARK: - UITextFieldDelegate

extension UserAuth: UITextFieldDelegate{
    
    @IBAction func FetchDataGotPressed(_ sender: UIButton) {
        UserNamegotEntered.endEditing(true) // forcefully stoping the edditing in the textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserNamegotEntered.endEditing(true)
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
        
        if let userName =  UserNamegotEntered.text  {
            // will send the username to the viewController to fech the data :)
            self.delegate?.searchUsername(username: userName)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "UserProfile", sender: self)
            }
        }
        
        UserNamegotEntered.text = ""
    }
    
    

}

extension UserAuth: UserAuthDelegate {
    func searchUsername(username: String) {
        // Implementation if needed
    }
}



