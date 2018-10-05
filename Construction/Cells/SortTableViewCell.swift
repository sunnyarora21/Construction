//
//  SortTableViewCell.swift
//  Construction
//
//  Created by apple on 25/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
protocol sortProtocol {
    func sortMethodSelected(cell: SortTableViewCell)
}

class SortTableViewCell: UITableViewCell {
    //MARK:- Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    //MARK:- Variables
    
    var sortDelegate:sortProtocol?
    
    
    //MARK:- Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func sortMethodBtnClicked(_ sender: UIButton) {
        self.sortDelegate?.sortMethodSelected(cell: self)
    }
    
}
