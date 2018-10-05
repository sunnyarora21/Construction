//
//  DealerListViewController.swift
//  Construction
//
//  Created by apple on 24/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class DealerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,dealerListProtocol {
    
    //MARK:- Outlets
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var dealerNoLbl: UILabel!
    @IBOutlet weak var cmpyNameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var dealerListTableView: UITableView!
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        dealerListTableView.register(UINib(nibName: "DealerListTableViewCell", bundle: nil), forCellReuseIdentifier: "DealerListTableViewCellIdentifier")
        dealerListTableView.estimatedRowHeight = 100.0
        dealerListTableView.rowHeight = UITableViewAutomaticDimension
        dealerListTableView.tableFooterView = UIView()
        self.title = "DEALERS"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let cell:DealerListTableViewCell = tableView.dequeueReusableCell (withIdentifier: "DealerListTableViewCellIdentifier") as! DealerListTableViewCell
        cell.dealerListDelegate = self
        cell.dealerNoLbl.text = "\(indexPath.row + 1)"
        cell.dealerImgView.frame.size.height = cell.frame.size.height
        cell.dealerImgView.frame.size.width = cell.frame.size.height
        if indexPath.row == 0{
            cell.dealerNameLbl.text = "BUILDKAR"
            cell.dealerImgView.image = UIImage(named: "dealer1")
            cell.dealerAddressLbl.text = "Address: Level 4 & 5, Concorde Tower, U.B City, 1, 24/1, Vittal Mallya Rd, Ashok Nagar, Bengaluru, Karnataka 560001"
        }
        else if indexPath.row == 1{
            cell.dealerNameLbl.text = "BRICKDYNAMIC"
             cell.dealerImgView.image = UIImage(named: "dealer2")
            cell.dealerAddressLbl.text = "Location for dealer \(indexPath.row + 1)"
            cell.dealerAddressLbl.text = "dripuram Main Rd, Haridevpur, Jai Bheema Nagar, Sampangiram Nagar, Bengaluru, Karnataka 560020"
        }
        else if indexPath.row == 2{
            cell.dealerNameLbl.text = "BRICKDYNAMIC"
            cell.dealerImgView.image = UIImage(named: "dealer3")
            cell.dealerAddressLbl.text = "Location for dealer \(indexPath.row + 1)"
            cell.dealerAddressLbl.text = "Jai Bheema Nagar, Sampangiram Nagar, Bengaluru, Karnataka 560020"
        }
        else{
        
        cell.dealerNameLbl.text = "Dealer \(indexPath.row + 1)"
        cell.dealerAddressLbl.text = "Location for dealer \(indexPath.row + 1)"
            cell.dealerNameLbl.isHidden = false
        }
       // cell.dealerImgView.backgroundColor = UIColor.blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:Int = Int()
             height = 90
        return CGFloat(height)
    }
    
    
    func dealerSelected(cell: DealerListTableViewCell){
        let dealersDetailView = self.storyboard?.instantiateViewController(withIdentifier: "DealersMaterialViewIdentifier") as! DealersMaterialViewController
        dealersDetailView.dealerNameStr = "\(cell.dealerNameLbl.text!)"
        self.navigationController?.pushViewController(dealersDetailView, animated: true)
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }

}
