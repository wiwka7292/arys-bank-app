//
//  SettingsVC.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class AppSettingsVC: UIViewController {
    
    var appSettingsView: AppSettingsView { self.view as! AppSettingsView}
    var appSettingsApi = AppSettingsAPI()
    override func loadView() {
        view = AppSettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetailsOfSetting()
        
    }
    
    func fetchDetailsOfSetting(){
        Task {
            do{
                let detailsOfSetting = try await appSettingsApi.fetchDetails()
                appSettingsView.updateSetting(detailsOfSetting: detailsOfSetting)
            }catch{
                print(error)
            }
        }
    }

    
}
