import UIKit
import SnapKit

class LogoPreView: UIView {
    
    var logoLabel: UILabel = {
        var label = UILabel()
        label.text = "ARYSBANK"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .white
        moveLogoUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLogoUp() {
        UIView.animate(withDuration: 1.5) {
            self.logoLabel.layoutIfNeeded()
        }
    }
    
    func setupViews(){
        self.addSubview(logoLabel)
    }
    
    func setupConstraints(){
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
}
