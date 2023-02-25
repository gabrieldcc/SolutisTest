//
//  ViewController.swift
//  TestSolutis
//
//  Created by Gabriel de Castro Chaves on 25/02/23.
//

import UIKit

final class LoginViewController: UIViewController {
    //MARK: - Attributes
    let loginViewModel = LoginViewModel()
    
    //MARK: - IBOutlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Lifecycle view
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogoImage()
        setLoginButton()
    }
    
    //MARK: - Funcs
    fileprivate func setLogoImage() {
        let url =
        "https://solutis.com.br/wp-content/uploads/2018/04/logo_solutis_401-2.png"
        logoImage.loadFrom(URLAddress: url)
    }
    
    fileprivate func setLoginButton() {
        loginButton.layer.cornerRadius = 20
        logoImage.layer.masksToBounds = true
    }
    
    //MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        guard let user = userTextField.text else { return }
        print(loginViewModel.isValidUser(login: user))
    }
    
}

