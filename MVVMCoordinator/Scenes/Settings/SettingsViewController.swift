//
//  SettingsViewController.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 19.09.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    var logoutBtn : UIButton = {
        var button = UIButton()
        button.setTitle("LOG OUT", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Settings"
        // Do any additional setup after loading the view.
        
        view.addSubview(logoutBtn)
        logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutBtn.widthAnchor.constraint(equalToConstant: 200),
            logoutBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        logoutBtn.addTarget(self, action: #selector(didTapLogOutButton(_:)), for: .touchUpInside)

    }
    
    @objc private func didTapLogOutButton(_ sender :Any){
        coordinator?.logout()
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
