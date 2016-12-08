//
//  ImagePickerViewController.swift
//  Iceberg
//
//  Created by user on 12/7/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import XLActionController

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var headerCameraButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var headerImage: UIImageView!
  
    @IBOutlet weak var profileImageVIew: UIView!
    
    var imagePicked = 0
    
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        profileImage.frame.size = CGSize(width: 100, height: 100)
        
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        
        profileImage.center.x = (UIScreen.main.bounds.width / 2)
        profileImage.center.y = 195
        
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = lightGrey.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressprofilePic(_ sender: Any) {
        self.imagePicked = (sender as AnyObject).tag
        //        imagePicked = 1
        
        
        let actionController = SkypeActionController()
        
        actionController.addAction(Action("Camera", style: .default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera; imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            print("cameraButtonAccessed")
            
        }))
        
        actionController.addAction(Action("Gallery", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; imagePicker.allowsEditing = true
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        
        actionController.addSection(Section())
        actionController.addAction(Action("Cancel", style: .cancel, handler:nil))
        present(actionController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func didPressHeaderPic(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        //        imagePicked = 2

        let actionController = TweetbotActionController()
    actionController.addAction(Action("Camera", style: .default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera; imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            print("cameraButtonAccessed")
            
        }))
        
        actionController.addAction(Action("Gallery", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; imagePicker.allowsEditing = true
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        
        actionController.addSection(Section())
        actionController.addAction(Action("Cancel", style: .cancel, handler:nil))
        present(actionController, animated: true, completion: nil)
        
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage pickedImage: UIImage!, editingInfo: [NSObject :   AnyObject]!) {
        
        if imagePicked == 1 {
            profileImage.image = pickedImage
            profileImageVIew.isHidden = true
            
        } else {
            headerImage.image = pickedImage
            headerCameraButton.isHidden = true
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapToChangeProfilePic(_ sender: UITapGestureRecognizer) {
        
        let actionController = SkypeActionController()
        
        actionController.addAction(Action("Camera", style: .default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera; imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            print("cameraButtonAccessed")
            
        }))
        
        actionController.addAction(Action("Gallery", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; imagePicker.allowsEditing = true
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        
        actionController.addSection(Section())
        actionController.addAction(Action("Cancel", style: .cancel, handler:nil))
        present(actionController, animated: true, completion: nil)
        
        
    }

    @IBAction func tapToChangeHeader(_ sender: Any) {
        let actionController = TweetbotActionController()
        actionController.addAction(Action("Camera", style: .default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera; imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            print("cameraButtonAccessed")
            
        }))
        
        actionController.addAction(Action("Gallery", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; imagePicker.allowsEditing = true
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        
        actionController.addSection(Section())
        actionController.addAction(Action("Cancel", style: .cancel, handler:nil))
        present(actionController, animated: true, completion: nil)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
