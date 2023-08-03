//
//  PinCodeView.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import UIKit
import SnapKit

class PinCodeVC: UIViewController{
    
    var pinCodeView: PinCodeView { view.self as! PinCodeView }
    
    override func loadView() {
        view = PinCodeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func nextView(){
        self.navigationController?.setViewControllers([MainMenuVC()], animated: false)
    }
}
