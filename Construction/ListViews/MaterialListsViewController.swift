//
//  MaterialListsViewController.swift
//  Construction
//
//  Created by apple on 24/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MaterialListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, sortProtocol {
    
    //MARK:- Outlets
    
    @IBOutlet weak var headerTitileLbl: UILabel!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var viewForSort: UIView!
    @IBOutlet weak var sortLbl: UILabel!
    @IBOutlet weak var sortTableView: UITableView!
    
 
    
    //MARK:- Variables
    var selectedItems:Int = Int()
    
    var mainArray:NSArray = [
        [
            "Materialname" : "cement1",
            "MaterialPrice" : "",
            "dealerAvailableArray" : [
                ["nameofDealer": "BUILDKAR",
                 "Price": "$ 50 / Bag",
                 "deliveryTime" : "24 Hours",],
                ["nameofDealer": "BRICKDYNAMICS",
                 "Price": "$ 490 / 10 Bags",
                 "deliveryTime" : "less then 24 Hours",],
                ["nameofDealer": "Dealer 4",
                 "Price": "$ 4800 / 100Bags",
                 "deliveryTime" : "12 Hours",],
                ["nameofDealer": "Dealer 2",
                 "Price": "$ 47000 / 1000 Bags",
                 "deliveryTime" : "12 Hour",],
                ["nameofDealer": "Dealer 1",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 3",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "6 Hours",],
                ["nameofDealer": "Dealer 10",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 5",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 9",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",]
            ],
        ],
        [
            "Materialname" : "cement2",
            "MaterialPrice" : "",
            "dealerAvailableArray" : [
                ["nameofDealer": "BUILDKAR",
                 "Price": "$ 100 / 1000",
                 "deliveryTime" : "24 Hours",],
                ["nameofDealer": "BRICKDYNAMICS",
                 "Price": "$ 99 / 1000",
                 "deliveryTime" : "2 days",],
                ["nameofDealer": "Dealer 5",
                 "Price": "$ 105 / 1000",
                 "deliveryTime" : "12 Hours",],
                ["nameofDealer": "Dealer 3",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 1",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 2",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "6 Hours",],
            ],
            ],
        [
            "Materialname" : "cement3",
            "MaterialPrice" : "",
            "dealerAvailableArray" : [
                ["nameofDealer": "BUILDKAR",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "24 Hours",],
                ["nameofDealer": "BRICKDYNAMICS",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "less then 24 Hours",],
                ["nameofDealer": "Dealer 1",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "12 Hours",],
                ["nameofDealer": "Dealer 2",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 3",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 4",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "6 Hours",],
                ["nameofDealer": "Dealer 9",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 5",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 0",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "2 day Day",]
            ],
            ],
        [
            "Materialname" : "cement4",
            "MaterialPrice" : "",
            "dealerAvailableArray" : [
                ["nameofDealer": "BUILDKAR",
                 "Price": "$ 45 / 100 feet",
                 "deliveryTime" : "24 Hours",],
                ["nameofDealer": "BRICKDYNAMICS",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "less then 24 Hours",],
                ["nameofDealer": "Dealer 11",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "12 Hours",],
                ["nameofDealer": "Dealer 50",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 22",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "Same Day",],
                ["nameofDealer": "Dealer 11",
                 "Price": "$ 2 / KG",
                 "deliveryTime" : "6 Hours",],
                ["nameofDealer": "Dealer 10",
                 "Price": "$ 1.5 / KG",
                 "deliveryTime" : "Same Day",]
                
            ],
            ]
        
    ]
    
    var sortArray:NSArray = ["Popularity", "Brand/Manufacturer", "Price low to high", "Price high to low"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItems = 0
        print(mainArray)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "MATERIALS BY SUPPLIERS"
        sortTableView.register(UINib(nibName:"SortTableViewCell", bundle: nil), forCellReuseIdentifier: "SortTableViewCellIdentifier")
        self.createView()
        self.initalView()
        // Do any additional setup after loading the view.
    }
    
    func initalView() {
        viewForSort.layer.cornerRadius = 5
        viewForSort.layer.borderWidth = 1
        viewForSort.layer.borderColor = UIColor.black.cgColor
        
        sortTableView.layer.cornerRadius = 5
        sortTableView.layer.borderWidth = 0.5
        sortTableView.layer.borderColor = UIColor.black.cgColor
    }
    
    
    func createView() {
        var y : Int = Int()
        y = 5
        for i in 0...mainArray.count - 1 {
            let dict:NSDictionary = mainArray.object(at: i)as! NSDictionary
            print(dict)
            let scrollView:UIScrollView = UIScrollView()
            scrollView.frame = CGRect(x: 121, y: y, width: Int(mainScrollView.frame.size.width - 120), height: 150)
            //scrollView.backgroundColor = UIColor.lightGray
            mainScrollView.addSubview(scrollView)
            let materialImg:UIImageView = UIImageView()
            materialImg.frame = CGRect(x: 0, y: y, width: 120, height: 150)
            materialImg.image = UIImage(named: "\(dict.value(forKey: "Materialname")!)")
           // materialImg.contentMode = .scaleAspectFit
            mainScrollView.addSubview(materialImg)
            y = y + 160
            mainScrollView.contentSize.height = CGFloat(y)
            
            let dealerArray:NSArray = dict.value(forKey: "dealerAvailableArray")as! NSArray
            print(dealerArray)
            
            var X:CGFloat = CGFloat()
            X = 0
            
            for j in 0...dealerArray.count - 1 {
            
                let dealerDict:NSDictionary = dealerArray.object(at: j)as! NSDictionary
                print(dealerArray)
                let dealerView:UIView = UIView()
                dealerView.frame = CGRect(x: X, y: 0, width: 170, height: scrollView.frame.size.height)
                //dealerView.backgroundColor = UIColor.gray
                dealerView.layer.borderColor = UIColor.lightGray.cgColor
                dealerView.layer.borderWidth = 1
                scrollView.addSubview(dealerView)
                X = X + 175
                let dealerNameLbl:UILabel = UILabel()
                dealerNameLbl.frame = CGRect(x: 2, y: 0, width: dealerView.frame.size.width - 4, height: 30)
                dealerNameLbl.text = dealerDict.value(forKey: "nameofDealer") as? String
                dealerNameLbl.numberOfLines = 0
                dealerNameLbl.textAlignment = .center
                dealerNameLbl.font = dealerNameLbl.font.withSize(16)
                dealerView.addSubview(dealerNameLbl)
                
                let deliveryTimeLbl:UILabel = UILabel()
                deliveryTimeLbl.frame = CGRect(x: 2, y: dealerNameLbl.frame.size.height + dealerNameLbl.frame.origin.y, width: dealerView.frame.size.width - 4, height: 45)
                deliveryTimeLbl.text =  "Delivery with in \(dealerDict.value(forKey: "deliveryTime")!)"
                deliveryTimeLbl.numberOfLines = 0
                deliveryTimeLbl.textColor = UIColor.gray
                deliveryTimeLbl.font = deliveryTimeLbl.font.withSize(15)
                deliveryTimeLbl.textAlignment = .center
                dealerView.addSubview(deliveryTimeLbl)
                
                let priceLbl:UILabel = UILabel()
                priceLbl.frame = CGRect(x: 2, y: deliveryTimeLbl.frame.size.height + deliveryTimeLbl.frame.origin.y, width: dealerView.frame.size.width - 4, height: 30)
                priceLbl.text =  "Price: \(dealerDict.value(forKey: "Price")!)"
                priceLbl.numberOfLines = 0
                priceLbl.font = priceLbl.font.withSize(16)
                priceLbl.textAlignment = .center
                dealerView.addSubview(priceLbl)
                scrollView.contentSize.width = X
                
               
                let comareBtn:UIButton = UIButton(frame: CGRect(x: 1, y: priceLbl.frame.size.height + priceLbl.frame.origin.y , width: dealerView.frame.size.width / 2 - 2, height: 35))
                comareBtn.backgroundColor = UIColor.clear
                comareBtn.setTitle("Compare", for: .normal)
                comareBtn.titleLabel?.textColor = UIColor.darkText
                comareBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
                comareBtn.layer.borderWidth = 1
                comareBtn.layer.cornerRadius = 5
                comareBtn.layer.borderColor = UIColor.blue.cgColor
                comareBtn.titleLabel?.font = comareBtn.titleLabel?.font.withSize(15)
                comareBtn.addTarget(self, action:#selector(self.addTOCompareBtnClicked), for: .touchUpInside)
                dealerView.addSubview(comareBtn)
                
                
                let addTOCart:UIButton = UIButton(frame: CGRect(x: dealerView.frame.size.width / 2 , y: priceLbl.frame.size.height + priceLbl.frame.origin.y, width: dealerView.frame.size.width / 2 - 2, height: 35))
                addTOCart.backgroundColor = UIColor.clear
                addTOCart.setTitle("Add to Cart", for: .normal)
                addTOCart.setTitleColor(UIColor.blue, for: UIControlState.normal)
                addTOCart.layer.borderWidth = 1
                addTOCart.layer.cornerRadius = 5
                addTOCart.layer.borderColor = UIColor.blue.cgColor
                 addTOCart.titleLabel?.font = addTOCart.titleLabel?.font.withSize(15)
                addTOCart.addTarget(self, action:#selector(self.addTOCartBtnClicked), for: .touchUpInside)
                dealerView.addSubview(addTOCart)
                
            }
        }
    }
    
      @objc func addTOCompareBtnClicked(sender: UIButton) {
       // Utility.showAlert(title: "Sucess!!", message: "Product is added to compare List.", viewController: self)
        if sender.backgroundColor == UIColor.clear{
            sender.backgroundColor = UIColor.lightGray
            selectedItems = selectedItems + 1
        }
        else{
            sender.backgroundColor = UIColor.clear
            selectedItems = selectedItems - 1
        }
        
    }
    
    @objc func addTOCartBtnClicked(sender: UIButton) {
         Utility.showAlert(title: "Sucess!!", message: "Product is added to cart.", viewController: self)
        if sender.backgroundColor == UIColor.clear{
            sender.backgroundColor = UIColor.lightGray
            //selectedItems = selectedItems + 1
        }
        else{
            sender.backgroundColor = UIColor.clear
           // selectedItems = selectedItems - 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sortArray.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let cell:SortTableViewCell = tableView.dequeueReusableCell (withIdentifier: "SortTableViewCellIdentifier") as! SortTableViewCell
        cell.sortDelegate = self
        cell.nameLbl.text = sortArray.object(at: indexPath.row) as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // var height:Int = Int()
        return 40
    }
    
    func sortMethodSelected(cell: SortTableViewCell){
        sortLbl.text = cell.nameLbl.text
        sortTableView.isHidden = true
    }
    
    //MARK:- Outlets
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func sortBtnClicked(_ sender: UIButton) {
        self.sortTableView.isHidden = false
    }
   
    
    @IBAction func compareBtnClicked(_ sender: UIButton) {
        //ComparisonViewIdentifier
        
        if selectedItems > 0{
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "ComparisonViewIdentifier") as! ComparisonViewController
        //infoView.headingString = "Construction Materials"
        self.navigationController?.pushViewController(infoView, animated: true)
        }
        else{
            Utility.showAlert(title: "Alert", message: "Please select material  to compare.", viewController: self)
        }
    }
    
    
}
