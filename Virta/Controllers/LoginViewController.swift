//
//  ViewController.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

extension UITextField {
    func setBottomBorder() {
        self.layer.shadowColor = UIColorFromRGB(rgbValue: 0xbcbbc1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let viewModel = LoginViewModel()
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        viewModel.loginButton = true
        viewModel.login(email: emailField.text!, password: passwordField.text!) { loginResult in
            if loginResult == true {
                print("logged in")
                DispatchQueue.main.async {
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let navigationController = storyBoard.instantiateViewController(withIdentifier: "StationsListNavControllerIdentifier") as! UINavigationController

                    navigationController.modalPresentationStyle = .fullScreen
                    navigationController.modalTransitionStyle = .crossDissolve
                    
                    let viewController = storyBoard.instantiateViewController(withIdentifier: "StationsListViewController") as! StationsListTableViewController
                    
                    viewController.modalPresentationStyle = .fullScreen
                    viewController.modalTransitionStyle = .crossDissolve
                    
                    navigationController.pushViewController(viewController, animated: false)
                    
                    self.present(navigationController, animated:true, completion:nil)
                }
            } else {
                self.displayMassage(userMassage: "Invalid credentials")
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let emailImage = UIImage (named: "icPerson") else {return}
        guard let passwordImage = UIImage (named: "icLock") else {return}
        addLeftImageTo(textField: emailField, andImage: emailImage)
        addLeftImageTo(textField: passwordField, andImage: passwordImage)
        emailField.setBottomBorder()
        passwordField.setBottomBorder()
        
    }
    
    // MARK: - Hide Keyboard
    
    func hideKeyboard() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return Pressed")
        hideKeyboard()
        return true
    }
    
    // MARK: - Image to UITextField
    
    func addLeftImageTo(textField: UITextField, andImage img: UIImage) {
        let leftImgeView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: 29, height: 29))
        leftImgeView.image = img
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 29))
        view.addSubview(leftImgeView)
        
        textField.leftView = view
        textField.leftViewMode = .always
        
    }
    
    // MARK: - Display Message
    
    func displayMassage(userMassage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: userMassage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
                //Will working when OK tapped
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

