//
//  CartTableViewCell.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
protocol cartProtocol {
    func increaseQuantity( cell: CartTableViewCell)
    func decreaseQuantity( cell: CartTableViewCell)
    func removeFromCart( cell: CartTableViewCell)
}
class CartTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var viewForQuantity: UIView!
    @IBOutlet weak var quantityLbl: UILabel!
    
    @IBOutlet weak var increaseQuantityBtn: UIButton!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var decreaseQuantityBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    //MARK:- Variables
    var cartDelegate:cartProtocol?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.createUI()
    }
    
    func createUI() {
        viewForQuantity.layer.borderWidth = 1
        viewForQuantity.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func increaseQuantityBtnClicked(_ sender: UIButton) {
        self.cartDelegate?.increaseQuantity(cell: self)
    }
    
    @IBAction func decreaseQuantityBtnClicked(_ sender: UIButton) {
        self.cartDelegate?.decreaseQuantity(cell: self)
    }
    
    @IBAction func removeItemFromCartBtnClicked(_ sender: UIButton) {
        self.cartDelegate?.removeFromCart(cell: self)
    }
}
