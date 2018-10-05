//
//  MyRFQTableViewCell.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
protocol myRFQProtocol {
    func showDetail(cell: MyRFQTableViewCell)
}

class MyRFQTableViewCell: UITableViewCell {

    
    //MARK:- Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var RFQIDLbl: UILabel!
    @IBOutlet weak var dealerOneImg: UIImageView!
    @IBOutlet weak var dealerTwoImg: UIImageView!
    @IBOutlet weak var dealerThreeImg: UIImageView!
    
    //MARK:- Varibles
    var myRFQDelegate:myRFQProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.shadowOpacity = 10.0
        mainView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        mainView.layer.shadowRadius = 3.0
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showRFQIDDetailBtnClicked(_ sender: UIButton) {
        self.myRFQDelegate?.showDetail(cell: self)
    }
}
