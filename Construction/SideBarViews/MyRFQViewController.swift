//
//  MyRFQViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MyRFQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, myRFQProtocol {
    
    //MARK:- Outlets
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var rfqTableView: UITableView!
    
    
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My RFQ"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if revealViewController() != nil {
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rightViewRevealWidth = 150
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        rfqTableView.register(UINib(nibName: "MyRFQTableViewCell", bundle: nil), forCellReuseIdentifier: "MyRFQTableViewCellIdentifier")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let cell:MyRFQTableViewCell = tableView.dequeueReusableCell (withIdentifier: "MyRFQTableViewCellIdentifier") as! MyRFQTableViewCell
        cell.myRFQDelegate = self
//        cell.dealerNoLbl.text = "\(indexPath.row + 1)"
        if indexPath.row == 0{
            cell.RFQIDLbl.text = "ABC01"
            cell.dealerOneImg.image = UIImage(named: "newCross")
            cell.dealerTwoImg.image = UIImage(named: "check")
            cell.dealerThreeImg.image = UIImage(named: "check")
        }
        else if indexPath.row == 1{
             cell.RFQIDLbl.text = "ABC02"
             cell.dealerTwoImg.image = UIImage(named: "newCross")
            cell.dealerOneImg.image = UIImage(named: "check")
            cell.dealerThreeImg.image = UIImage(named: "check")
        }
        else{
             cell.RFQIDLbl.text = "ABC03"
            cell.dealerThreeImg.image = UIImage(named: "newCross")
            cell.dealerTwoImg.image = UIImage(named: "check")
            cell.dealerOneImg.image = UIImage(named: "check")
           
        }
         return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
             return 70
        }
    func showDetail(cell: MyRFQTableViewCell){
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "RFQComparisonViewIdentifier") as! RFQComparisonListViewController
        
        self.navigationController?.pushViewController(dealerListView, animated: true)
 }
}
