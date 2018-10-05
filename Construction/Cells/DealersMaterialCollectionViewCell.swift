//
//  DealersMaterialCollectionViewCell.swift
//  Construction
//
//  Created by apple on 24/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
protocol DealersMaterialCollectionViewCellProtocol {
    func addProductToCart(cell : DealersMaterialCollectionViewCell)
    func addProductToCompare(cell : DealersMaterialCollectionViewCell)
}
class DealersMaterialCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var materialImageView: UIImageView!
    @IBOutlet weak var materialNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var deliveryTimeLbl: UILabel!
    
    @IBOutlet weak var compareBtn: UIButton!
    
    @IBOutlet weak var addToCartBtn: UIButton!
    
    //MARK:- Variables
    var productDetailDelegate: DealersMaterialCollectionViewCellProtocol?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        compareBtn.layer.borderWidth = 1
        compareBtn.layer.borderColor = UIColor.blue.cgColor
        
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor.blue.cgColor
        // Initialization code
    }

    //MARK:- Button Actions
    
    
 
    
    @IBAction func compareBtnClicked(_ sender: UIButton) {
        self.productDetailDelegate?.addProductToCompare(cell: self)
    }
    
    @IBAction func addToCartBtnClicked(_ sender: UIButton) {
        self.productDetailDelegate?.addProductToCart(cell: self)
    }
}
