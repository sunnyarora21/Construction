//
//  CartViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, cartProtocol {
    
    //MARK:- Outlets
    
    
    @IBOutlet weak var cartTableView: UITableView!
    
    //MARK:- Vaiables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cart"
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCellIdentifier")
        // Do any additional setup after loading the view.
        self.initialSetUp()
    }
    
    func initialSetUp() {
//        mainView.layer.shadowOpacity = 10.0
//        mainView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        mainView.layer.shadowRadius = 3.0
//        mainView.layer.shadowColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let cell:CartTableViewCell = tableView.dequeueReusableCell (withIdentifier: "CartTableViewCellIdentifier") as! CartTableViewCell
        cell.cartDelegate = self
        return cell
        
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 145
            
        }

    func increaseQuantity( cell: CartTableViewCell){
        var quantityInt:Int? = Int(cell.quantityLbl.text!)
        quantityInt = quantityInt! + 1
        cell.quantityLbl.text = "\(quantityInt!)"
//        let priceQuantity:Int? = Int(cell.priceLbl.text!)
//        
//        var totalPriceFloat:Double = Double()
//        totalPriceFloat = Double(quantityInt! * priceQuantity!)
//        print(totalPriceFloat)
//        cell.totalPriceLbl.text = "$ \(totalPriceFloat)"
    }
    
    func decreaseQuantity( cell: CartTableViewCell){
        var quantityInt:Int? = Int(cell.quantityLbl.text!)
        quantityInt = quantityInt! - 1
        cell.quantityLbl.text = "\(quantityInt!)"
//        let priceQuantity:Int? = Int(cell.priceLbl.text!)
//
//        var totalPriceFloat:Double = Double()
//        totalPriceFloat = Double(quantityInt! * priceQuantity!)
//        print(totalPriceFloat)
       // cell.totalPriceLbl.text = "$ \(totalPriceFloat)"
    }
    
    func removeFromCart( cell: CartTableViewCell){
        cell.isHidden = true
        
    }
    //CheckOutViewIdentifier
    @IBAction func checkOutBtnClicked(_ sender: UIButton) {
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "CheckOutViewIdentifier") as! CheckOutViewController
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
}
