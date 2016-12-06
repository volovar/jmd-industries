//
//  NewProjectDetailViewController.swift
//  Iceberg
//
//  Created by user on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit



class NewProjectDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        self.headerTitle.alpha = 0

    }
    
    struct StretchyHeader {
        
        fileprivate let headerHeight: CGFloat = 350
        fileprivate let headerCut: CGFloat = 0
        
    }
    
    var containerImages: [UIImage] = [UIImage(named: "app_screen")!,UIImage(named: "education_series")!,UIImage(named: "facebook_live")!, UIImage(named: "sassRed")!, UIImage(named: "sassFinal")!]
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    
    var headerTitleOriginalY: CGFloat!

    @IBOutlet weak var headerTitle: UIView!
    @IBOutlet weak var tableVIew: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.contentSize = CGSize(width: 375, height: 1000)
        tableVIew.frame.size = CGSize(width: 375, height: 667)
        updateView()
        
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
        } else {
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
        return 350
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! ProjectDetailCell
             cell.selectionStyle = .none
            return cell

        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "carouselCell") as! CarouselCell
            cell2.carouselContainer.type = .coverFlow2
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
            imageView = UIImageView(frame: CGRect(x: 0, y: -50, width: 270, height: 270))

            imageView.contentMode = UIViewContentMode.scaleAspectFit

        } else {
            imageView = view as! UIImageView
        }
        
        imageView.image = self.containerImages[index]
        
        
        return imageView
    }
    
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            return 1
        }
        return value
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromResearch" {
            // set up the transition
            let destinationViewController = segue.destination as! ProjectStepsViewController
            destinationViewController.contentOffset = 750
            
            
            
            
            //            zoomTransition = ImageZoomTransition()
            //            destination.modalPresentationStyle = .custom
            //            destination.transitioningDelegate = zoomTransition
            //            zoomTransition.duration = 0.35
        }
    }

  
}
