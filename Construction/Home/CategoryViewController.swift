//
//  CategoryViewController.swift
//  Construction
//
//  Created by apple on 22/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var constructionMaterialBtn: UIButton!
    @IBOutlet weak var plumbingBtn: UIButton!
    @IBOutlet weak var electricalBtn: UIButton!
    @IBOutlet weak var kitchenBtn: UIButton!
    @IBOutlet weak var paintingLbl: UIButton!
    @IBOutlet weak var flooringBtn: UIButton!
    
    @IBOutlet weak var viewForconstructionMaterialBtn: UIView!
        @IBOutlet weak var viewForPlumbingBtn: UIView!
    @IBOutlet weak var viewForelectricalBtn: UIView!
    @IBOutlet weak var viewForkitchenBtn: UIView!
    @IBOutlet weak var viewForpaintingLbl: UIView!
    @IBOutlet weak var viewForflooringBtn: UIView!
    //MARK:- Variables
    
    var headingString:String = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
        self.initialSetUp()
    }

    
    func initialSetUp() {
        headingLbl.text = headingString
        
        viewForconstructionMaterialBtn.layer.borderWidth = 1.5
        viewForconstructionMaterialBtn.layer.borderColor = UIColor.white.cgColor
        viewForconstructionMaterialBtn.layer.cornerRadius = 5
        viewForconstructionMaterialBtn.layer.shadowOpacity = 10.0
        viewForconstructionMaterialBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForconstructionMaterialBtn.layer.shadowRadius = 3.0
        viewForconstructionMaterialBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForPlumbingBtn.layer.borderWidth = 1.5
        viewForPlumbingBtn.layer.borderColor = UIColor.white.cgColor
        viewForPlumbingBtn.layer.cornerRadius = 5
        viewForPlumbingBtn.layer.shadowOpacity = 10.0
        viewForPlumbingBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForPlumbingBtn.layer.shadowRadius = 3.0
        viewForPlumbingBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForelectricalBtn.layer.borderWidth = 1.5
        viewForelectricalBtn.layer.borderColor = UIColor.white.cgColor
        viewForelectricalBtn.layer.cornerRadius = 5
        viewForelectricalBtn.layer.shadowOpacity = 10.0
        viewForelectricalBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForelectricalBtn.layer.shadowRadius = 3.0
        viewForelectricalBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForkitchenBtn.layer.borderWidth = 1.5
        viewForkitchenBtn.layer.borderColor = UIColor.white.cgColor
        viewForkitchenBtn.layer.cornerRadius = 5
        viewForkitchenBtn.layer.shadowOpacity = 10.0
        viewForkitchenBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForkitchenBtn.layer.shadowRadius = 3.0
        viewForkitchenBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForpaintingLbl.layer.borderWidth = 1.5
        viewForpaintingLbl.layer.borderColor = UIColor.white.cgColor
        viewForpaintingLbl.layer.cornerRadius = 5
        viewForpaintingLbl.layer.shadowOpacity = 10.0
        viewForpaintingLbl.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForpaintingLbl.layer.shadowRadius = 3.0
        viewForpaintingLbl.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForflooringBtn.layer.borderWidth = 1.5
        viewForflooringBtn.layer.borderColor = UIColor.white.cgColor
        viewForflooringBtn.layer.cornerRadius = 5
        viewForflooringBtn.layer.shadowOpacity = 10.0
        viewForflooringBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForflooringBtn.layer.shadowRadius = 3.0
        viewForflooringBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func constructionMaterialBtnClicked(_ sender: UIButton) {
        //InfoViewIdentifier
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListViewIdentifier") as! CategoryListViewController
        //infoView.headingString = "Construction Materials"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func plumbingBtnClicked(_ sender: UIButton) {
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = "Plumber"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func electricalBtnClicked(_ sender: UIButton) {
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = "Electrical"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func kitchenBtnClicked(_ sender: UIButton) {
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = "Kitchen"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func paintingBtnClicked(_ sender: UIButton) {
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = "Paint"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func flooringBtnClicked(_ sender: UIButton) {
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = "Flooring"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
}
