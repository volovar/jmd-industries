//
//  NewProjectDetailViewController.swift
//  Iceberg
//
//  Created by user on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit



class NewProjectDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate {
    
    struct StretchyHeader {
        
        fileprivate let headerHeight: CGFloat = 350
        fileprivate let headerCut: CGFloat = 0
        
    }
    
    var containerImages: [UIImage] = [UIImage(named: "sassBlue")!,UIImage(named: "sassGreen")!,UIImage(named: "sassYellow")!, UIImage(named: "sassRed")!, UIImage(named: "sassFinal")!, UIImage(named: "problemIcon")!]
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    


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
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

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
    
 

  
}
