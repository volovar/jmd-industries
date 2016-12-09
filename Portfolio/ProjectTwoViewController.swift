//
//  ProjectTwoViewController.swift
//  Iceberg
//
//  Created by user on 12/8/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ProjectTwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate, UIViewControllerTransitioningDelegate {
    
    
    
    
    var tagButtonPressed = 0
    
    let transition = CircularTransition()
    
    override func viewWillAppear(_ animated: Bool) {
        self.headerTitle.alpha = 0
        
        
    }
    
    struct StretchyHeader {
        
        fileprivate let headerHeight: CGFloat = 320
        fileprivate let headerCut: CGFloat = 0
        
    }
    
    
    
    var containerImages: [UIImage] = [UIImage(named: "app_screen")!,UIImage(named: "education_series")!,UIImage(named: "facebook_live")!, UIImage(named: "sassRed")!, UIImage(named: "sassFinal")!]
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    
    var headerTitleOriginalY: CGFloat!
    
    @IBOutlet weak var headerTitle: UIView!

    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var redTransitionButton: UIButton!
    @IBOutlet weak var showTransitionButton: UIButton!
    
    @IBOutlet weak var yellowTransitionButton: UIButton!
    @IBOutlet weak var showYellowButton: UIButton!
    
    @IBOutlet weak var greenTransitionButton: UIButton!
    @IBOutlet weak var showGreenButton: UIButton!
    
    @IBOutlet weak var blueTransitionButton: UIButton!
    @IBOutlet weak var showBlueButton: UIButton!
    
    @IBOutlet weak var purpleTransitionButton: UIButton!
    @IBOutlet weak var showPurpleButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.contentSize = CGSize(width: 375, height: 1000)
        tableVIew.frame.size = CGSize(width: 375, height: 667)
        updateView()
        
        
        // transition red
        
        redTransitionButton.layer.cornerRadius = 0.5 * redTransitionButton.bounds.size.width
        redTransitionButton.layer.borderWidth = 2
        redTransitionButton.layer.borderColor = white.cgColor
        showTransitionButton.isHidden = false
        redTransitionButton.isHidden = true
        
        yellowTransitionButton.layer.cornerRadius = 0.5 * yellowTransitionButton.bounds.size.width
        yellowTransitionButton.layer.borderWidth = 2
        yellowTransitionButton.layer.borderColor = white.cgColor
        showYellowButton.isHidden = false
        yellowTransitionButton.isHidden = true
        
        greenTransitionButton.layer.cornerRadius = 0.5 * greenTransitionButton.bounds.size.width
        greenTransitionButton.layer.borderWidth = 2
        greenTransitionButton.layer.borderColor = white.cgColor
        showGreenButton.isHidden = false
        greenTransitionButton.isHidden = true
        
        showBlueButton.isHidden = false
        blueTransitionButton.isHidden = true
        blueTransitionButton.layer.cornerRadius = 0.5 * blueTransitionButton.bounds.size.width
        blueTransitionButton.layer.borderWidth = 2
        blueTransitionButton.layer.borderColor = white.cgColor
        
        showPurpleButton.isHidden = false
        purpleTransitionButton.isHidden = true
        purpleTransitionButton.layer.cornerRadius = 0.5 * purpleTransitionButton.bounds.size.width
        purpleTransitionButton.layer.borderWidth = 2
        purpleTransitionButton.layer.borderColor = white.cgColor
    }
    
    

    
    @IBAction func showRed(_ sender: Any) {
        redTransitionButton.isHidden = false
        showTransitionButton.isHidden = true
    }
    
    @IBAction func showYellow(_ sender: Any) {
        showYellowButton.isHidden = true
        yellowTransitionButton.isHidden = false
    }
    @IBAction func showGreen(_ sender: Any) {
        showGreenButton.isHidden = true
        greenTransitionButton.isHidden = false
    }
    @IBAction func showBlue(_ sender: Any) {
        showBlueButton.isHidden = true
        blueTransitionButton.isHidden = false
    }
    @IBAction func showPurple(_ sender: Any) {
        showPurpleButton.isHidden = true
        purpleTransitionButton.isHidden = false
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(tableVIew.contentOffset.y)
        
        
        if tableVIew.contentOffset.y >= -22 {
            
            tableVIew.contentOffset.y = -22
        }
        
        if tableVIew.contentOffset.y >= -40 {
            UIView.animate(withDuration: 1){
                
                self.headerTitle.alpha = 0.8
            }
            
        } else if tableVIew.contentOffset.y <= -40 && tableVIew.contentOffset.y > -125 {
            showTransitionButton.isHidden = true
            showYellowButton.isHidden = true
            showGreenButton.isHidden = true
            showBlueButton.isHidden = true
            showPurpleButton.isHidden = true
            
        } else {
            showTransitionButton.isHidden = false
            showYellowButton.isHidden = false
            showGreenButton.isHidden = false
            showBlueButton.isHidden = false
            showPurpleButton.isHidden = false
            
            UIView.animate(withDuration: 1){
                self.headerTitle.alpha = 0
                
                
            }
        }
        
        setNewView()
        
    }
    
    func updateView(){
        
        tableVIew.backgroundColor = UIColor.white
        headerView = tableVIew.tableHeaderView
        tableVIew.tableHeaderView = nil
        tableVIew.rowHeight = UITableViewAutomaticDimension
        tableVIew.addSubview(headerView)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = newHeaderLayer
        
        let newHeight = StretchyHeader().headerHeight-StretchyHeader().headerCut/2
        
        tableVIew.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        tableVIew.contentOffset = CGPoint(x: 0, y: -newHeight)
        setNewView()
    }
    
    
    
    func setNewView(){
        
        let newHeight = StretchyHeader().headerHeight-StretchyHeader().headerCut/2
        var getHeaderFrame =  CGRect(x: 0, y: -newHeight, width: tableVIew.bounds.width, height: StretchyHeader().headerHeight)
        
        if tableVIew.contentOffset.y < newHeight {
            
            getHeaderFrame.origin.y = tableVIew.contentOffset.y
            getHeaderFrame.size.height = -tableVIew.contentOffset.y + StretchyHeader().headerCut/2
        }
        
        headerView.frame = getHeaderFrame
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: getHeaderFrame.height-StretchyHeader().headerCut))
        newHeaderLayer.path = cutDirection.cgPath
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailCellProjectTwo
            cell.selectionStyle = .none
            return cell
            
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "carouselCell") as! CarouselCellProjectTwo
            cell2.carouselContainer.type = .rotary
            cell2.selectionStyle = .none
            
            return cell2
        }
        
        
    }
    
    
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return containerImages.count
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 340, height: 230))
            
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 3
            
            imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOpacity = 0.3
            imageView.layer.shadowOffset = CGSize.zero
            imageView.layer.shadowRadius = 2
            imageView.layer.shouldRasterize = true
            
        } else {
            imageView = view as! UIImageView
        }
        
        imageView.image = self.containerImages[index]
        
        
        return imageView
    }
    
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            return 0.8
        }
        return value
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueRedTransition" {
            let destinationViewController = segue.destination as! ProjectStepsProjectTwo
            destinationViewController.transitioningDelegate = self
            destinationViewController.modalPresentationStyle = .custom
            transition.startingPoint = redTransitionButton.center
            transition.circleColor = redTransitionButton.backgroundColor!
            
            showTransitionButton.isHidden = false
            UIView.animate(withDuration: 1){
                self.redTransitionButton.isHidden = true
            }
            
            
            
        } else if segue.identifier == "segueYellowTransition" {
            let destinationViewController = segue.destination as! ProjectStepsProjectTwo
            destinationViewController.transitioningDelegate = self
            destinationViewController.modalPresentationStyle = .custom
            transition.startingPoint = yellowTransitionButton.center
            transition.circleColor = yellowTransitionButton.backgroundColor!
            showYellowButton.isHidden = false
            UIView.animate(withDuration: 1){
                
                self.yellowTransitionButton.isHidden = true
            }
            destinationViewController.contentOffset = 375
            
        } else if segue.identifier == "segueGreenTransition" {
            let destinationViewController = segue.destination as! ProjectStepsProjectTwo
            destinationViewController.transitioningDelegate = self
            transition.startingPoint = greenTransitionButton.center
            transition.circleColor = greenTransitionButton.backgroundColor!
            destinationViewController.modalPresentationStyle = .custom
            
            showGreenButton.isHidden = false
            UIView.animate(withDuration: 1){
                
                self.greenTransitionButton.isHidden = true
            }
            destinationViewController.contentOffset = 750
            
        } else if segue.identifier == "segueBlueTransition" {
            let destinationViewController = segue.destination as! ProjectStepsProjectTwo
            destinationViewController.transitioningDelegate = self
            transition.startingPoint = blueTransitionButton.center
            transition.circleColor = blueTransitionButton.backgroundColor!
            destinationViewController.modalPresentationStyle = .custom
            
            showBlueButton.isHidden = false
            UIView.animate(withDuration: 1){
                
                self.blueTransitionButton.isHidden = true
            }
            destinationViewController.contentOffset = 1125
            
        } else if segue.identifier == "seguePurpleTransition" {
            let destinationViewController = segue.destination as! ProjectStepsProjectTwo
            destinationViewController.transitioningDelegate = self
            transition.startingPoint = purpleTransitionButton.center
            transition.circleColor = purpleTransitionButton.backgroundColor!
            destinationViewController.modalPresentationStyle = .custom
            
            showPurpleButton.isHidden = false
            UIView.animate(withDuration: 1){
                
                self.purpleTransitionButton.isHidden = true
            }
            destinationViewController.contentOffset = 1500
        }
    }
    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        
        
        
        return transition
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        
        
        
        
        return transition
    }
    
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
}
