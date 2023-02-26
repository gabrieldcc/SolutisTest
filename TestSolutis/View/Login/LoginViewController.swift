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
    var isValidUser = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //MARK: - Lifecycle view
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogoImage()
        setLoginButton()
        errorLabel.text = ""
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
    
    fileprivate func showErrorLabel() {
        if isValidUser {
            errorLabel.text = ""
        } else {
            errorLabel.text = "Email ou senha inválidos"
        }
    }
    
    //MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        guard let user = userTextField.text,
              let password = passwordTextField.text else { return }
    
        isValidUser = loginViewModel.isValid(user: user, password: password)
        showErrorLabel()
        
        if isValidUser {
            //success
        } else {
            //failure
        }
    }
}

