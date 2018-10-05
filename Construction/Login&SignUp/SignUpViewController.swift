//
//  SignUpViewController.swift
//  Waite
//
//  Created by apple on 10/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import MBProgressHUD
//import GooglePlaces

class SignUpViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate, UISearchDisplayDelegate {
    
    ///MARK:- Outlets
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var pswdTxtField: UITextField!
    @IBOutlet weak var confirmPswdTxtField: UITextField!
    @IBOutlet weak var locationTxtField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var viewForCurrentLocation: UIView!
     @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewForSearch: UIView!
    
    @IBOutlet weak var viewForSignUpBtn: UIView!
    
    //MARK:- Variables
   
  //  let GoogleMapsAPIServerKey = "AIzaSyCrPCRwiD5zjeDcV0POIYrqlZszuZ0tiLM"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // locationManager.requestAlwaysAuthorization()
        mobileTxtField.delegate = self
        
     
        // Do any additional setup after loading the view.
        self.initalSetUp()
        self.setLanguage()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }



    
    func initalSetUp() {
        nameTxtField.layer.borderWidth = 1.5
        nameTxtField.layer.borderColor = UIColor.gray.cgColor
        emailTxtField.layer.borderWidth = 1.5
        emailTxtField.layer.borderColor = UIColor.gray.cgColor
        mobileTxtField.layer.borderWidth = 1.5
        mobileTxtField.layer.borderColor = UIColor.gray.cgColor
        pswdTxtField.layer.borderWidth = 1.5
        pswdTxtField.layer.borderColor = UIColor.gray.cgColor
        confirmPswdTxtField.layer.borderWidth = 1.5
        confirmPswdTxtField.layer.borderColor = UIColor.gray.cgColor
        viewForCurrentLocation.layer.borderWidth = 1.5
        viewForCurrentLocation.layer.borderColor = UIColor.gray.cgColor
        viewForSignUpBtn.layer.borderWidth = 1.5
        viewForSignUpBtn.layer.borderColor = UIColor.gray.cgColor
        nameTxtField.layer.cornerRadius = 5
        emailTxtField.layer.cornerRadius = 5
        mobileTxtField.layer.cornerRadius = 5
        pswdTxtField.layer.cornerRadius = 5
        confirmPswdTxtField.layer.cornerRadius = 5
        viewForCurrentLocation.layer.cornerRadius = 5
        viewForSignUpBtn.layer.cornerRadius = 5
        
        viewForSignUpBtn.layer.shadowOpacity = 10.0
        viewForSignUpBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForSignUpBtn.layer.shadowRadius = 3.0
        viewForSignUpBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func setLanguage() {
    /*    signUpBtn.setTitle("register".localized, for: .normal)
        registerLbl.text = "r_register".localized
        nameTxtField.placeholder = "r_first_name".localized
        emailTxtField.placeholder = "r_email".localized
        mobileTxtField.placeholder = "r_phone".localized
        pswdTxtField.placeholder = "r_password".localized
        confirmPswdTxtField.placeholder = "r_confirm_password".localized
        locationTxtField.placeholder = "r_location".localized*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        if !nameTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter name.", viewController: self)
        }
        else if !emailTxtField.hasText{
             Utility.showAlert(title: "Alert", message: "Please enter email.", viewController: self)
        }
        else if !(emailTxtField.text?.isEmail)!{
            Utility.showAlert(title: "Alert", message: "Please enter a valid email.", viewController: self)
            
        }
        else if !mobileTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter mobile No.", viewController: self)
        }
        else if !pswdTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter password.", viewController: self)
            
        }
        else if pswdTxtField.text != confirmPswdTxtField.text{
            Utility.showAlert(title: "Alert", message: "Password doesn't match.", viewController: self)
        }
        else if !locationTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "please Enter your location.", viewController: self)
        }
        else{
          /*  MBProgressHUD.showAdded(to: self.view, animated: true)
            let parameters : NSDictionary  =
                ["name": nameTxtField.text!,
                 "email" : emailTxtField.text!,
                 "mobile" : mobileTxtField.text!,
                 "password" : pswdTxtField.text!,
                 "confirm_password" : confirmPswdTxtField.text!,
                 "location" : locationTxtField.text!,
                 "current_location" : "\(latitude),\(longitude)",
                 "device_type" : "iOS",
                 "device_id" : "23454",
                 "user_type" : "user",
                 "auth_key": "454HdffUYLKKsrsJIU$",
                 ]
            
            print(parameters)
            print("\(GlobalConstants.baseURL)add_user")
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            Alamofire.request("\(GlobalConstants.baseURL)add_user", method: .post, parameters: parameters as? Parameters, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response:DataResponse<Any>) in
                
                switch(response.result) {
                    
                case .success(_):
                    
                    if response.result.value != nil{
                        
                        var dict:NSDictionary = NSDictionary()
                        dict = (response.result.value! as? NSDictionary)!
                        
                        print(dict)
                        
                        if dict.value(forKey: "status") is Int{
                            if dict.value(forKey: "status") as! Int == 1{*/
                                let alertController = UIAlertController(title: "Sucess", message: "Register succesful.", preferredStyle: .alert)
                                
                                // Initialize Actions
                                let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
                                    self.navigationController?.popViewController(animated: true)
                                }
                                
                                
                                
                                // Add Actions
                                alertController.addAction(yesAction)
                                
                                // Present Alert Controller
                                self.present(alertController, animated: true, completion: nil)

                                
                     /*       }
                            else{
                                Utility.showAlert(title: "Alert", message: "\(dict.value(forKey: "msg")!)", viewController: self)
                            }
                        }
                        else if dict.value(forKey: "status") is String{
                            
                            if dict.value(forKey: "status") as! String == "1"{
                                //                       / self.performSegue(withIdentifier: "HomeViewIdentifier", sender: self)
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
    @IBAction func selectGooglePlaceBtnClicked(_ sender: UIButton) {
      self.viewForSearch.isHidden = false
    }
    
    
    
    
    @IBAction func currentLocationBtnClicked(_ sender: UIButton) {
       
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 10
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func showSelectedAddress(detailedAddressString: String, latitude: String, longitude: String)  {
        self.locationTxtField.text = detailedAddressString
//        self.longitude =  longitude
//        self.latitude = latitude
////        print(self.locationTxtField.text!)
//        print(self.longitude)
//        print(self.latitude)
        self.viewForSearch.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func closeSearchBarBtnClicked(_ sender: UIButton) {
        self.viewForSearch.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
}
