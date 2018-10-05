//
//  HomeViewController.swift
//  Construction
//
//  Created by apple on 22/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var productServiesLbl: UILabel!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var buildingMaterialBtn: UIButton!
    @IBOutlet weak var constructionBtn: UIButton!
    @IBOutlet weak var designLbl: UIButton!
    @IBOutlet weak var architectBtn: UIButton!
    
    @IBOutlet weak var viewForBuildingMaterialBtn: UIView!
    @IBOutlet weak var viewForConsultationBtn: UIView!
    @IBOutlet weak var viewForDesignBtn: UIView!
    @IBOutlet weak var viewForArchitectBtn: UIView!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    //MARK:- Variables
    
    var ImageArray:NSArray = NSArray()
    var initialX:CGFloat = CGFloat()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageArray = ["img1","img2","img3"]
        topScrollView.delegate = self
        initialX = 0
        configurePageControl()
          _ = Timer.scheduledTimer(timeInterval: 03.0, target: self, selector: #selector(HomeViewController.ScrollImages), userInfo: nil, repeats: true)
        //self.navigationController?.navigationBar.isHidden = true
        
        if revealViewController() != nil {
            
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
        self.intialSetup()
        self.createImageScroll()
    }

    func intialSetup()  {
        viewForBuildingMaterialBtn.layer.borderWidth = 1.5
        viewForBuildingMaterialBtn.layer.borderColor = UIColor.black.cgColor
        viewForBuildingMaterialBtn.layer.cornerRadius = 5
        viewForBuildingMaterialBtn.layer.shadowOpacity = 10.0
        viewForBuildingMaterialBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForBuildingMaterialBtn.layer.shadowRadius = 3.0
        viewForBuildingMaterialBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForConsultationBtn.layer.borderWidth = 1.5
        viewForConsultationBtn.layer.borderColor = UIColor.black.cgColor
        viewForConsultationBtn.layer.cornerRadius = 5
        viewForConsultationBtn.layer.shadowOpacity = 10.0
        viewForConsultationBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForConsultationBtn.layer.shadowRadius = 3.0
        viewForConsultationBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
     /*   viewForDesignBtn.layer.borderWidth = 1.5
        viewForDesignBtn.layer.borderColor = UIColor.white.cgColor
        viewForDesignBtn.layer.cornerRadius = 5
       
        viewForDesignBtn.layer.shadowOpacity = 10.0
        viewForDesignBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForDesignBtn.layer.shadowRadius = 3.0
        viewForDesignBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewForArchitectBtn.layer.borderWidth = 1.5
        viewForArchitectBtn.layer.borderColor = UIColor.white.cgColor
        viewForArchitectBtn.layer.cornerRadius = 5
      
        viewForArchitectBtn.layer.shadowOpacity = 10.0
        viewForArchitectBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForArchitectBtn.layer.shadowRadius = 3.0
        viewForArchitectBtn.layer.shadowColor = UIColor.lightGray.cgColor
//        viewForBuildingMaterialBtn.dropShadow()*/
//        viewForConsultationBtn.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

    }
    func createImageScroll() {
        var X:CGFloat = CGFloat()
        X = 0
        self.pageControll.numberOfPages = self.ImageArray.count
        for i in 0...self.ImageArray.count - 1 {
            
            let serviceImage:UIImageView = UIImageView()
            serviceImage.frame = CGRect(x:X, y: 0, width: self.topScrollView.frame.size.width, height: self.topScrollView.frame.size.height)
            serviceImage.image = UIImage(named: "\(self.ImageArray.object(at: i))")
            self.topScrollView.addSubview(serviceImage)
            
            X = X + topScrollView.frame.size.width
            topScrollView.contentSize.width = X
        }
       // self.topScrollView.contentSize = CGSize(width:self.topScrollView.frame.size.width * 4,height: self.topScrollView.frame.size.height)

    }
    @objc func ScrollImages()
    {
      //  scrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
        //let x = CGFloat(pageControll.currentPage) * topScrollView.frame.size.width
        initialX = initialX + topScrollView.frame.size.width
        if initialX >= (CGFloat(topScrollView.frame.size.width) * CGFloat(ImageArray.count)){
         initialX = 0
        }
        
        topScrollView.setContentOffset(CGPoint(x:initialX, y:0), animated: true)

    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
       // self.pageControl.numberOfPages = colors.count
        self.pageControll.currentPage = 0
//        self.pageControll.tintColor = UIColor.red
//        self.pageControll.pageIndicatorTintColor = UIColor.black
//        self.pageControll.currentPageIndicatorTintColor = UIColor.green
       // self.view.addSubview(pageControll)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControll.currentPage) * topScrollView.frame.size.width
        topScrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        if Int(pageNumber) >= ImageArray.count{
            pageNumber = 1
            topScrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
            pageControll.currentPage = Int(pageNumber)
        }
        else{
            pageControll.currentPage = Int(pageNumber)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func buildingMaterialBtnClicked(_ sender: UIButton) {
    //CategoryViewIdentifier
        let infoView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListViewIdentifier") as! CategoryListViewController
        //infoView.headingString = "Construction Materials"
        self.navigationController?.pushViewController(infoView, animated: true)
    }
    
    @IBAction func constructionBtnClicked(_ sender: UIButton) {
        let categoryView = self.storyboard?.instantiateViewController(withIdentifier: "ConsultingServicesViewIdentifier") as! ConsultingServicesViewController
       // categoryView.headingString = "Consultant"
        self.navigationController?.pushViewController(categoryView, animated: true)
    }
    
    @IBAction func designBtnClicked(_ sender: UIButton) {
        let categoryView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewIdentifier") as! CategoryViewController
        categoryView.headingString = "Designer"
        self.navigationController?.pushViewController(categoryView, animated: true)
    }
    
    @IBAction func architectBtnClicked(_ sender: UIButton) {
        let categoryView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewIdentifier") as! CategoryViewController
        categoryView.headingString = "Architect"
        self.navigationController?.pushViewController(categoryView, animated: true)
    }
    
  
}
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
