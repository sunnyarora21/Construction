//
//  InfoViewController.swift
//  Construction
//
//  Created by apple on 22/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    //MARK:- Outlets

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var byDealersBtn: UIButton!
    @IBOutlet weak var byMaterialBtn: UIButton!
   
    @IBOutlet weak var viewForDealerBtn: UIView!
    @IBOutlet weak var viewForMaterialBtn: UIView!
    
    
    
    //MARK:- Variables
    
    var headingString:String = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
    }
    
    func initialSetUp() {
        self.title = headingString.uppercased()
        
        viewForDealerBtn.layer.borderWidth = 1.5
        viewForDealerBtn.layer.borderColor = UIColor.black.cgColor
        viewForDealerBtn.layer.cornerRadius = 5
        viewForDealerBtn.layer.shadowOpacity = 10.0
        viewForDealerBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForDealerBtn.layer.shadowRadius = 3.0
        viewForDealerBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForMaterialBtn.layer.borderWidth = 1.5
        viewForMaterialBtn.layer.borderColor = UIColor.black.cgColor
        viewForMaterialBtn.layer.cornerRadius = 5
        viewForMaterialBtn.layer.shadowOpacity = 10.0
        viewForMaterialBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForMaterialBtn.layer.shadowRadius = 3.0
        viewForMaterialBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bydealerBtnClicked(_ sender: UIButton) {
        //DealerListViewIdentifier
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "DealerListViewIdentifier") as! DealerListViewController
        //infoView.headingString = "Plumber"
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
    
    @IBAction func byMaterialBtnClicked(_ sender: UIButton) {
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "MaterialListsViewIdentifier") as! MaterialListsViewController
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
    
}
