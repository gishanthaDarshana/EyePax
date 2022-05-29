//
//  FilterController.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/30/22.
//

import UIKit


protocol FilterationDelegate  : AnyObject{
    func filterNews(filter : String)
}


class FilterController: UIViewController {

    weak var filterDelegate : FilterationDelegate?
    private var filterationString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeFilter(_ sender: UIButton) {
        print("\(sender.titleLabel!.text!.prefix(2))")
        filterationString = sender.titleLabel!.text!.prefix(2).lowercased()
        self.dismiss(animated: true) { [weak self] in
            self?.filterDelegate?.filterNews(filter: self?.filterationString ?? "")
        }
    }
    

}
