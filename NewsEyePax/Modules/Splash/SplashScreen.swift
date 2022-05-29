//
//  SplashScreen.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/30/22.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLoginAndNavigate()
    }
    
    func checkLoginAndNavigate(){
        if UserDefaultsHelper.shared.isLoggedIn(){
            performSegue(withIdentifier: "dashBoard" , sender: self)
        }else{
            performSegue(withIdentifier: "login", sender: self)
        }
    }
    

}
