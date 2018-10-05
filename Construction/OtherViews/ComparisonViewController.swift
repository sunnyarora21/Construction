//
//  ComparisonViewController.swift
//  Construction
//
//  Created by apple on 25/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ComparisonViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    
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
            ],
            ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Compare"
        // Do any additional setup after loading the view.
        self.createView()
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
                deliveryTimeLbl.frame = CGRect(x: 2, y: dealerNameLbl.frame.size.height + dealerNameLbl.frame.origin.y, width: dealerView.frame.size.width - 4, height: 40)
                deliveryTimeLbl.text =  "Delivery with in \(dealerDict.value(forKey: "deliveryTime")!)"
                deliveryTimeLbl.numberOfLines = 0
                deliveryTimeLbl.textAlignment = .center
                dealerView.addSubview(deliveryTimeLbl)
                
                let priceLbl:UILabel = UILabel()
                priceLbl.frame = CGRect(x: 2, y: deliveryTimeLbl.frame.size.height + deliveryTimeLbl.frame.origin.y, width: dealerView.frame.size.width - 4, height: 35)
                priceLbl.text =  "Price: \(dealerDict.value(forKey: "Price")!)"
                priceLbl.numberOfLines = 0
                priceLbl.textAlignment = .center
                dealerView.addSubview(priceLbl)
                scrollView.contentSize.width = X
                
                let selectSupplier:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: dealerView.frame.size.width, height: dealerView.frame.size.height))
                selectSupplier.backgroundColor = UIColor.clear
               // addTOCart.setTitle("Add to Cart", for: .normal)
                //selectSupplier.setTitleColor(UIColor.blue, for: UIControlState.normal)
//                addTOCart.layer.borderWidth = 1
//                addTOCart.layer.cornerRadius = 5
//                selectSupplier.layer.borderColor = UIColor.blue.cgColor
//                selectSupplier.titleLabel?.font = addTOCart.titleLabel?.font.withSize(15)
                selectSupplier.addTarget(self, action:#selector(self.supplierSelectBtnClicked), for: .touchUpInside)
                dealerView.addSubview(selectSupplier)
                
                let increaseQuantityBtn:UIButton = UIButton(frame: CGRect(x: dealerView.frame.size.width / 2 + 20, y: priceLbl.frame.size.height + priceLbl.frame.origin.y, width: 35, height: 35))
                increaseQuantityBtn.backgroundColor = UIColor.clear
                increaseQuantityBtn.setTitle("+", for: .normal)
                increaseQuantityBtn.titleLabel?.textColor = UIColor.darkText
                increaseQuantityBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
                increaseQuantityBtn.layer.borderWidth = 1
                increaseQuantityBtn.layer.cornerRadius = 5
                increaseQuantityBtn.layer.borderColor = UIColor.blue.cgColor
                increaseQuantityBtn.titleLabel?.font = increaseQuantityBtn.titleLabel?.font.withSize(15)
               // RFQBtn.addTarget(self, action:#selector(self.addTOCompareBtnClicked), for: .touchUpInside)
                dealerView.addSubview(increaseQuantityBtn)
                
                let decreaseQuantityBtn:UIButton = UIButton(frame: CGRect(x: 35, y: priceLbl.frame.size.height + priceLbl.frame.origin.y, width: 35, height: 35))
                decreaseQuantityBtn.backgroundColor = UIColor.clear
                decreaseQuantityBtn.setTitle("-", for: .normal)
                decreaseQuantityBtn.titleLabel?.textColor = UIColor.darkText
                decreaseQuantityBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
                decreaseQuantityBtn.layer.borderWidth = 1
                decreaseQuantityBtn.layer.cornerRadius = 5
                decreaseQuantityBtn.layer.borderColor = UIColor.blue.cgColor
                decreaseQuantityBtn.titleLabel?.font = increaseQuantityBtn.titleLabel?.font.withSize(15)
                // RFQBtn.addTarget(self, action:#selector(self.addTOCompareBtnClicked), for: .touchUpInside)
                dealerView.addSubview(decreaseQuantityBtn)
                
                let quantityLbl:UILabel = UILabel()
                quantityLbl.frame = CGRect(x: decreaseQuantityBtn.frame.origin.x + decreaseQuantityBtn.frame.size.width + 35, y: decreaseQuantityBtn.frame.origin.y , width: increaseQuantityBtn.frame.origin.y - (decreaseQuantityBtn.frame.origin.y + decreaseQuantityBtn.frame.size.width) , height: 35)
                quantityLbl.text =  "1"
//                quantityLbl.layer.borderColor = UIColor.lightGray.cgColor
//                quantityLbl.layer.borderWidth = 1
                quantityLbl.numberOfLines = 0
                quantityLbl.textAlignment = .center
                dealerView.addSubview(quantityLbl)
            }
        }
    }
    
    @objc func supplierSelectBtnClicked(sender: UIButton) {
      //  Utility.showAlert(title: "Sucess!!", message: "Product is added to compare List.", viewController: self)
        if sender.backgroundColor == UIColor.clear{
            sender.backgroundColor = UIColor(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 0.5)
            selectedItems = selectedItems + 1
            
        }
        else{
            sender.backgroundColor = UIColor.clear
            selectedItems = selectedItems - 1
        }
        
    }
    
    @objc func addTOCartBtnClicked(sender: UIButton) {
        Utility.showAlert(title: "Sucess!!", message: "Product is added to cart.", viewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func requestForQuotsBtnClicked(_ sender: UIButton) {
        //RFQViewIdentifier
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "RFQViewIdentifier") as! RFQViewController
        //infoView.headingString = "Construction Materials"
        self.navigationController?.pushViewController(infoView, animated: true)
        
    }
    
    @IBAction func addToCartBtnClicked(_ sender: UIButton) {
        
    }
}
