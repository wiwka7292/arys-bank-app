//
//  PinCodeView.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import UIKit

class PinCodeView: UIView {
    
    var pinCodeNumPad = PinCodeNumPad()
    
    var button: UIButton = {
        var button = UIButton()
        button.setTitle("button", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(PinCodeVC.nextView), for: .touchUpInside)
        return button
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
            
    }
    
    func setupViews(){
        self.addSubview(pinCodeNumPad)
        self.addSubview(button)
    }
    
    func setupConstraints(){
        pinCodeNumPad.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).inset(300)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).inset(150)
        }
    }
}
