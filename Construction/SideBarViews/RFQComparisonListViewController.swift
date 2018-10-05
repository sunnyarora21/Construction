//
//  RFQComparisonListViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class RFQComparisonListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "RFQ Comparision List"
        // Do any additional setup after loading the view.
        self.initailSetUp()
    }
    
    func initailSetUp() {
        self.buttonOne.layer.borderWidth = 1
        self.button2.layer.borderWidth = 1
        self.button3.layer.borderWidth = 1
        self.button4.layer.borderWidth = 1
        self.button5.layer.borderWidth = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOneClicked(_ sender: UIButton) {
        if buttonOne.currentImage == UIImage(named: "check"){
            self.buttonOne.setImage(UIImage(named: "empty"), for: .normal)
        }
        else{
            self.buttonOne.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    @IBAction func button2Clicked(_ sender: UIButton) {
        if button2.currentImage == UIImage(named: "check"){
            self.button2.setImage(UIImage(named: "empty"), for: .normal)
        }
        else{
            self.button2.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    @IBAction func button3Clicked(_ sender: UIButton) {
        if button3.currentImage == UIImage(named: "check"){
            self.button3.setImage(UIImage(named: "empty"), for: .normal)
        }
        else{
            self.button3.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    @IBAction func button4Clicked(_ sender: UIButton) {
        if button4.currentImage == UIImage(named: "check"){
            self.button4.setImage(UIImage(named: "empty"), for: .normal)
        }
        else{
            self.button4.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    @IBAction func button5Clicked(_ sender: UIButton) {
        if button5.currentImage == UIImage(named: "check"){
            self.button5.setImage(UIImage(named: "empty"), for: .normal)
        }
        else{
            self.button5.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    
    @IBAction func addToCartBtnClicked(_ sender: UIButton) {
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "CartViewIdentifier") as! CartViewController
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
    
}
