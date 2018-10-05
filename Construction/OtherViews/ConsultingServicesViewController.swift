//
//  ConsultingServicesViewController.swift
//  Construction
//
//  Created by apple on 25/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ConsultingServicesViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var viewForStructuralEng: UIView!
    @IBOutlet weak var viewForArchitecturalService: UIView!
    @IBOutlet weak var viewForMEP: UIView!
    @IBOutlet weak var viewForHVAC: UIView!
    @IBOutlet weak var viewForInteriorDesign: UIView!
    
    @IBOutlet weak var StructuralEngBtn: UIView!
    @IBOutlet weak var architecturalServiceBtn: UIButton!
    @IBOutlet weak var MEPBtn: UIButton!
    @IBOutlet weak var hvacBtn: UIView!
    @IBOutlet weak var interiorDesignBtn: UIButton!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "CONSULTING SERVICE"
        // Do any additional setup after loading the view.
        self.intialSetup()
    }

    
    func intialSetup()  {
        viewForStructuralEng.layer.borderWidth = 1.5
        viewForStructuralEng.layer.borderColor = UIColor.black.cgColor
        viewForStructuralEng.layer.cornerRadius = 5
        viewForStructuralEng.layer.shadowOpacity = 10.0
        viewForStructuralEng.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForStructuralEng.layer.shadowRadius = 3.0
        viewForStructuralEng.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForArchitecturalService.layer.borderWidth = 1.5
        viewForArchitecturalService.layer.borderColor = UIColor.black.cgColor
        viewForArchitecturalService.layer.cornerRadius = 5
        viewForArchitecturalService.layer.shadowOpacity = 10.0
        viewForArchitecturalService.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForArchitecturalService.layer.shadowRadius = 3.0
        viewForArchitecturalService.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForMEP.layer.borderWidth = 1.5
        viewForMEP.layer.borderColor = UIColor.black.cgColor
        viewForMEP.layer.cornerRadius = 5
        viewForMEP.layer.shadowOpacity = 10.0
        viewForMEP.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForMEP.layer.shadowRadius = 3.0
        viewForMEP.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForHVAC.layer.borderWidth = 1.5
        viewForHVAC.layer.borderColor = UIColor.black.cgColor
        viewForHVAC.layer.cornerRadius = 5
        viewForHVAC.layer.shadowOpacity = 10.0
        viewForHVAC.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForHVAC.layer.shadowRadius = 3.0
        viewForHVAC.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForInteriorDesign.layer.borderWidth = 1.5
        viewForInteriorDesign.layer.borderColor = UIColor.black.cgColor
        viewForInteriorDesign.layer.cornerRadius = 5
        viewForInteriorDesign.layer.shadowOpacity = 10.0
        viewForInteriorDesign.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForInteriorDesign.layer.shadowRadius = 3.0
        viewForInteriorDesign.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func StructuralEngBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func architecturalServiceBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func MEPBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func hvacBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func InteriorDesignBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
