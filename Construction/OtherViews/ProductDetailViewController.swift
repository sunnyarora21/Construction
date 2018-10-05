//
//  ProductDetailViewController.swift
//  Construction
//
//  Created by apple on 25/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var topScrollzview: UIScrollView!
    
    @IBOutlet weak var viewForPricendName: UIView!
    @IBOutlet weak var viewForDescription: UIView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var addTofavouriteBtn: UIButton!
    @IBOutlet weak var addToCompareBtn: UIButton!
    @IBOutlet weak var viewForRelatedProducts: UIView!
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.intialSetup()
    }

    func intialSetup()  {
        addToCartBtn.layer.borderWidth = 1.5
        addToCartBtn.layer.borderColor = UIColor.white.cgColor
        addToCartBtn.layer.cornerRadius = 5
        addToCartBtn.layer.shadowOpacity = 10.0
        addToCartBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        addToCartBtn.layer.shadowRadius = 3.0
        addToCartBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        addTofavouriteBtn.layer.borderWidth = 1.5
        addTofavouriteBtn.layer.borderColor = UIColor.white.cgColor
        addTofavouriteBtn.layer.cornerRadius = 5
        addTofavouriteBtn.layer.shadowOpacity = 10.0
        addTofavouriteBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        addTofavouriteBtn.layer.shadowRadius = 3.0
        addTofavouriteBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
