//
//  DashBoardTabController.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import UIKit

class DashBoardTabController: UIViewController {

    @IBOutlet weak var tabBarView: View!
    @IBOutlet var tabButtons: [UIButton]!
    
    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    var footerHeight: CGFloat = 50
    
    var viewControllers = [UIViewController]()
    
    
    static let homeVC = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Home")
    static let favoriteVC = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Favorite")
    static let profileVC = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Profile")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers.append(DashBoardTabController.homeVC)
        viewControllers.append(DashBoardTabController.favoriteVC)
        viewControllers.append(DashBoardTabController.profileVC)
                
        tabButtons[selectedIndex].isSelected = true
        tabChanged(sender: tabButtons[selectedIndex])
    }
    

    
    @IBAction func tabChanged(sender:UIButton) {
        previousIndex = selectedIndex
        selectedIndex = sender.tag
                
        tabButtons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
                
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
                
        sender.isSelected = true
                
        let vc = viewControllers[selectedIndex]
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
                
        self.view.bringSubviewToFront(tabBarView)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


