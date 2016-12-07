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
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var headerImage: UIImageView!
    
    var imagePicked = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        



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
        } else {
            headerImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
