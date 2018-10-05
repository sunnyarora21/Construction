//
//  CategoryListViewController.swift
//  Construction
//
//  Created by apple on 25/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    
    //MARK:- Variables
    var categoriesArray:NSArray = ["Cement/jelly/Sand","Steel & TMT","Bricks & Blocks","Plumbing","Bathroom","Electrical","Tiles & Adhesives","Paints","Hand & Power Tools","Plywood & Boards","Doors & Windows","Kitchen Fittings","Hardware And Safety","Outdoor Tent & Waterproof Fabric","Waterproofing And Solution"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.title = "CONSTRUCTION MATERIAL CATEGORIES"
        
        // Do any additional setup after loading the view.
        self.createUI()
    }
    
    func createUI() {
        var y:CGFloat = CGFloat()
        y = 10
        for i in 0...categoriesArray.count - 1 {
            let viewForCategory:UIView = UIView()
            viewForCategory.frame = CGRect(x: 20, y: y, width: mainScrollView.frame.size.width - 40, height: 50)
            viewForCategory.backgroundColor = UIColor(red: 255.0/255.0, green: 216.0/255.0, blue: 6.0/255.0, alpha: 1.0)
            viewForCategory.layer.borderWidth = 1.5
            viewForCategory.layer.borderColor = UIColor.black.cgColor
            viewForCategory.layer.cornerRadius = 5
            viewForCategory.layer.shadowOpacity = 10.0
            viewForCategory.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            viewForCategory.layer.shadowRadius = 3.0
            viewForCategory.layer.shadowColor = UIColor.lightGray.cgColor
            mainScrollView.addSubview(viewForCategory)
            
            let button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: viewForCategory.frame.size.width, height: viewForCategory.frame.size.height))
           // button.backgroundColor = UIColor.clear
            button.setTitle("\(categoriesArray.object(at: i))", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = button.titleLabel?.font.withSize(25)
            button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
            viewForCategory.addSubview(button)
            
            y = y + 60
            mainScrollView.contentSize.height = y
        }
    }

    @objc func buttonClicked(sender: UIButton) {
        let selectedStr:String = String(format:"%@", (sender.titleLabel?.text)!)
        //print(latStr)
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewIdentifier") as! InfoViewController
        infoView.headingString = selectedStr
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}
