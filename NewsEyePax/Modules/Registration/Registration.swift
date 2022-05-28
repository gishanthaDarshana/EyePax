//
//  Registration.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import UIKit
import SnackBar_swift
class Registration: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailText: FormTextField!
    @IBOutlet weak var userNameText: FormTextField!
    @IBOutlet weak var passwordText: FormTextField!
    
    var viewModel = RegistrationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.registrationDelegate = self
    }
    
    @IBAction func registerClick(_ sender: Any) {
        self.view.endEditing(true)
        let user = NewUser(userName: userNameText.text ?? "", passWord: passwordText.text ?? "", email: emailText.text ?? "")
        viewModel.registerUser(user: user)
    }
    
    @IBAction func onBackPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension Registration : RegistrationDelegate{
    func onRegistrationError(error: String) {
        SnackBar.make(in: self.view, message: error, duration: .lengthLong).show()
    }
    
    func onRegistrationComplete(stats: Bool) {
        //navigate to dashboard
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: .navigateToDashBoard, object: nil)
        }
    }
}
