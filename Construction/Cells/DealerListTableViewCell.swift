//
//  DealerListTableViewCell.swift
//  Construction
//
//  Created by apple on 24/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
protocol dealerListProtocol {
    func dealerSelected(cell: DealerListTableViewCell)
}
class DealerListTableViewCell: UITableViewCell {
    
    
    //MARK:- Outlets
    @IBOutlet weak var dealerNoLbl: UILabel!
    @IBOutlet weak var dealerNameLbl: UILabel!
    @IBOutlet weak var dealerAddressLbl: UILabel!
    
    @IBOutlet weak var dealerImgView: UIImageView!
    
    //MARKK:- Variables
    var dealerListDelegate: dealerListProtocol?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dealerImgView.contentMode = UIViewContentMode.scaleToFill
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dealerSelectBtnClicked(_ sender: UIButton) {
        self.dealerListDelegate?.dealerSelected(cell: self)
    }
    
}
