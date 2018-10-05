//
//  DealersMaterialViewController.swift
//  Construction
//
//  Created by apple on 24/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class DealersMaterialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate, sortProtocol, DealersMaterialCollectionViewCellProtocol {
    
    //MARK:- Outlets
    @IBOutlet weak var headerNameLbl: UILabel!
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var viewForSort: UIView!
    @IBOutlet weak var sortLbl: UILabel!
    @IBOutlet weak var sortTableView: UITableView!
    //MARK:- Variables
    var sortArray:NSArray = ["Popularity", "Brand/Manufacturer", "Price low to high", "Price high to low"]
    
    var dealerNameStr:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
       // headerNameLbl.text = "\(dealerNameStr) Construction Materials"
        self.title = "\(dealerNameStr) Construction Materials"
        sortTableView.register(UINib(nibName:"SortTableViewCell", bundle: nil), forCellReuseIdentifier: "SortTableViewCellIdentifier")

        self.initalView()
    }

    func initalView() {
        viewForSort.layer.cornerRadius = 5
        viewForSort.layer.borderWidth = 1
        viewForSort.layer.borderColor = UIColor.black.cgColor
        
        sortTableView.layer.cornerRadius = 5
        sortTableView.layer.borderWidth = 0.5
        sortTableView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button Actions
  
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- CollectionView Methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // 1
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealersMaterialCollectionViewCellIdentifier", for: indexPath as IndexPath) as! DealersMaterialCollectionViewCell
        cell.productDetailDelegate = self
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        if indexPath.row  == 0{
            cell.materialImageView.image = UIImage(named: "cement1")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 50 for each Bag"
        }
        else if indexPath.row == 1{
            cell.materialImageView.image = UIImage(named: "cement2")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 500 for each 10 bags"
        }
        else if indexPath.row == 2{
            cell.materialImageView.image = UIImage(named: "cement3")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "1.5 Day delivery"
            cell.priceLbl.text = "$ 47 for each bag"
        }
        else if indexPath.row == 3{
            cell.materialImageView.image = UIImage(named: "cement4")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 49 for each 50 KG Bag"
        }
        else if indexPath.row == 4{
            cell.materialImageView.image = UIImage(named: "cement5")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "2 Day delivery"
            cell.priceLbl.text = "$ 48.5 for each Bag"
        }
        else if indexPath.row == 5{
            cell.materialImageView.image = UIImage(named: "cement6")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 5000 for each 1000 Bags"
        }
        else if indexPath.row == 5{
            cell.materialImageView.image = UIImage(named: "Cement")
            cell.materialNameLbl.text = "Cement"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 10 for each bag"
        }
            
        else{
            cell.materialImageView.image = UIImage(named: "brick")
            cell.materialNameLbl.text = "BRICKS"
            cell.deliveryTimeLbl.text = "Same Day delivery"
            cell.priceLbl.text = "$ 500 for each 1000"
        }
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0 - 1
        let yourHeight = collectionView.bounds.height/3.0 - 1
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func addProductToCart(cell : DealersMaterialCollectionViewCell){
        Utility.showAlert(title: "Sucess!!", message: "Product is added to cart", viewController: self)
    }
    
    func addProductToCompare(cell : DealersMaterialCollectionViewCell){
        Utility.showAlert(title: "Sucess!!", message: "Product is added to compare list", viewController: self)
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
    @IBAction func sortBtnClicked(_ sender: UIButton) {
        self.sortTableView.isHidden = false
    }
}
