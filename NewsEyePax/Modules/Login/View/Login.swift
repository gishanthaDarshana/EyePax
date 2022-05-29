//
//  ViewController.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import UIKit
import SnackBar_swift
class Login: UIViewController {

    @IBOutlet weak var emailText: FormTextField!
    @IBOutlet weak var passwordText: FormTextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: RoundedUIButton!
    
    var loginViewModel = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.loginDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.navigateToDashBoard(notification:)), name:.navigateToDashBoard, object: nil)
    }

    @IBAction func onLoginPress(_ sender: Any) {
        self.view.endEditing(true)
        loginViewModel.authenticateUser(userName: emailText.text ?? "", password:  passwordText.text ?? "")
    }
    
    @IBAction func onSignUpPress(_ sender: Any) {
        //Handled in storyboard itself
    }
    
}

extension Login : AuthenticateDelegate{
    func onAuthenticateSuccess(success: Bool) {
        if success{
            UserDefaultsHelper.shared.saveLogInflag(save: success)
            navigate()
        }else{
            NewsSnackBar.make(in: self.view, message: "Authentication Error!", duration: .lengthLong).show()
        }
    }
    
    func onAuthenticationError(error: String) {
        NewsSnackBar.make(in: self.view, message: error, duration: .lengthLong).show()
    }
}

extension Login {
    @objc func navigateToDashBoard(notification: Notification){
       navigate()
    }
    
    func navigate(){
        performSegue(withIdentifier: "login_to_dashBoard", sender: self)
    }
}

