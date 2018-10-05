//
//  LoginViewController.swift
//  Waite
//
//  Created by apple on 10/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class LoginViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var customerLoginLbl: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var forgotPswdBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var arabLangBtn: UIButton!
    @IBOutlet weak var engliashLngBtn: UIButton!
    
    @IBOutlet weak var viewForLoginBtn: UIButton!
    @IBOutlet weak var viewForLanguageSelection: UIView!
    //MARK:- Variables
    var languageBundle : Bundle?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.title = "Products & Services"
        if UserDefaults.standard.value(forKey: "Login") != nil{
            if UserDefaults.standard.value(forKey: "Login")as! Bool == true{
//                let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewIdentifier") as! HomeViewController
//                self.navigationController?.pushViewController(homeView, animated: true)
            }
        }
        // Do any additional setup after loading the view.
        self.intialSetup()
        self.setLanguage()
    }

    
    func intialSetup()  {
        emailTxtField.layer.borderWidth = 1.5
        emailTxtField.layer.borderColor = UIColor.gray.cgColor
        passwordTxtField.layer.borderColor = UIColor.gray.cgColor
        passwordTxtField.layer.borderWidth = 1.5
        viewForLoginBtn.layer.borderColor = UIColor.gray.cgColor
        viewForLoginBtn.layer.borderWidth = 1.5
        emailTxtField.layer.cornerRadius = 5
        passwordTxtField.layer.cornerRadius = 5
        viewForLoginBtn.layer.cornerRadius = 5
        viewForLanguageSelection.layer.borderColor = UIColor.gray.cgColor
        viewForLanguageSelection.layer.borderWidth = 1.5
        viewForLanguageSelection.layer.cornerRadius = 5
        viewForLoginBtn.clipsToBounds = true
        engliashLngBtn.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 210.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        engliashLngBtn.setTitleColor(.black, for: .normal)
        
        
        viewForLoginBtn.layer.shadowOpacity = 10.0
        viewForLoginBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForLoginBtn.layer.shadowRadius = 3.0
        viewForLoginBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForLanguageSelection.layer.shadowOpacity = 10.0
        viewForLanguageSelection.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForLanguageSelection.layer.shadowRadius = 3.0
        viewForLanguageSelection.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        
  /*      if Language.language == Language.english{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            engliashLngBtn.layer.backgroundColor = UIColor.gray.cgColor
            engliashLngBtn.setTitleColor(.darkGray, for: .normal)
            arabLangBtn.layer.backgroundColor = UIColor.clear.cgColor
            arabLangBtn.setTitleColor(.gray, for: .normal)
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            arabLangBtn.layer.backgroundColor = UIColor.gray.cgColor
            arabLangBtn.setTitleColor(.darkGray, for: .normal)
            engliashLngBtn.layer.backgroundColor = UIColor.clear.cgColor
            engliashLngBtn.setTitleColor(.gray, for: .normal)
        }*/
        self.roundCorners(view: engliashLngBtn, corners: [.bottomRight, .topRight], radius: 5.0)

        self.roundCorners(view: arabLangBtn, corners: [.bottomLeft, .topLeft], radius: 5.0)

    }
    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotPswdBtnClicked(_ sender: UIButton) {
        //ForgotViewIdentifier
        let forgotView = self.storyboard?.instantiateViewController(withIdentifier: "ForgotViewIdentifier") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(forgotView, animated: true)
        
    }
    func setLanguage() {
//        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewIdentifier") as! SWRevealViewController
//
//        self.navigationController?.pushViewController(dealerListView, animated: true)
//        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewIdentifier") as! HomeViewController
//        self.navigationController?.pushViewController(homeView, animated: true)
//        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewIdentifier") as! HomeViewController
//        self.navigationController?.pushViewController(homeView, animated: true)
        
//        let forgotView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewIdentifier") as! HomeViewController
//        self.navigationController?.pushViewController(forgotView, animated: true)
     /*   loginBtn.setTitle("login".localized, for: .normal)
        
        let signUpStr:String = "\("sign_up".localized)\("dont_account".localized)"
        
        signUpBtn.setTitle(signUpStr, for: .normal)
        forgotPswdBtn.setTitle("forgot_password".localized, for: .normal)
        emailTxtField.placeholder = "r_email".localized
        passwordTxtField.placeholder = "r_password".localized
        //customerLoginLbl.text = "Welcome".localized
        customerLoginLbl.text = "Login_welcome".localized */
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        if !emailTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter email.", viewController: self)
            
        }
        else if !(emailTxtField.text?.isEmail)!{
            Utility.showAlert(title: "Alert", message: "Please enter a valid email.", viewController: self)
        }
        else if !passwordTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter password.", viewController: self)
        }
        else{
            
          /*  MBProgressHUD.showAdded(to: self.view, animated: true)
            let parameters : NSDictionary  =
                ["email": emailTxtField.text!,
                 "password" : passwordTxtField.text!,
                  "device_type" : "iOS",
                   "device_id" : "23454",
                   "user_type" : "user",
                   "auth_key": "454HdffUYLKKsrsJIU$",
                 ]
            
            print(parameters)
            print("\(GlobalConstants.baseURL)user_login")
            MBProgressHUD.showAdded(to: self.view, animated: true)
            Alamofire.request("\(GlobalConstants.baseURL)user_login", method: .post, parameters: parameters as? Parameters, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        var dict:NSDictionary = NSDictionary()
                        dict = (response.result.value! as? NSDictionary)!
                        print(dict)
                        if dict.value(forKey: "status") is Int{
                            if dict.value(forKey: "status") as! Int == 1{
                                let userDetailDict:NSDictionary = dict.value(forKey: "userdata")as! NSDictionary
                                print(userDetailDict)
                                UserDefaults.standard.setValue(userDetailDict, forKey: "UserDetails")
                                UserDefaults.standard.set(true, forKey: "Login")*/
            let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewIdentifier") as! SWRevealViewController
            
            self.navigationController?.pushViewController(dealerListView, animated: true)
                      /*      }
                            else{
                                Utility.showAlert(title: "Alert", message: "\(dict.value(forKey: "msg")!)", viewController: self)
                            }
                        }
                        else if dict.value(forKey: "status") is String{
                            if dict.value(forKey: "status") as! String == "1"{
                            }
                            else{
                                Utility.showAlert(title: "Alert", message: "\(dict.value(forKey: "msg")!)", viewController: self)
                            }
                        }
                    }
                    MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                    break
                case .failure(_):
                    MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                    Utility.showAlert(title: "Alert", message: "Something went wrong. Please try again later.", viewController: self)
                    break
                }
            }*/
        }
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        let signUpView = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewIdentifier") as! SignUpViewController
        self.navigationController?.pushViewController(signUpView, animated: true)

    }
    
    @IBAction func arabLangBtnClicked(_ sender: UIButton) {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        arabLangBtn.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 210.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        arabLangBtn.setTitleColor(.black, for: .normal)
      //  Language.language = Language.arabic
        engliashLngBtn.layer.backgroundColor = UIColor.white.cgColor
        engliashLngBtn.setTitleColor(.gray, for: .normal)
      //  Localize.setCurrentLanguage("fr")
    }
    
    @IBAction func englishLangBtnClicked(_ sender: UIButton) {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        engliashLngBtn.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 210.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        engliashLngBtn.setTitleColor(.black, for: .normal)
      //  Language.language = Language.english
       // Localize.setCurrentLanguage("en")
        arabLangBtn.layer.backgroundColor = UIColor.white.cgColor
        arabLangBtn.setTitleColor(.gray, for: .normal)
    }
   
}
extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
