//
//  DeliveryListTableViewCell.swift
//  Construction
//
//  Created by apple on 28/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class DeliveryListTableViewCell: UITableViewCell {

    
    //MARK:- Outlets
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var selectImg: UIImageView!
    
    //MARK:- Variables
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.shadowOpacity = 10.0
        baseView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        baseView.layer.shadowRadius = 3.0
        baseView.layer.shadowColor = UIColor.lightGray.cgColor

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addressSelectBtnClicked(_ sender: UIButton) {
    }
    
}
