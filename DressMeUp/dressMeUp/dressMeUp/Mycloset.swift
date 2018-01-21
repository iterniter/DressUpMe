//
//  Mycloset.swift
//  dressMeUp
//
//  Created by Khalil Bennani on 2018-01-21.
//  Copyright © 2018 khalil bennani. All rights reserved.
//

import Foundation
import UIKit



class Mycloset : UIViewController,UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate {
    

    
    var picker:UIImagePickerController?=UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Open Gallery button click
    @IBAction func OpenGallery(_ sender: AnyObject) {
        openGallary()
    }
    
    // Take Photo button click
    @IBAction func TakePhoto(_ sender: AnyObject) {
        openCamera()
    }
    
    
    func openGallary()
    {
        picker!.allowsEditing = false
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            picker!.allowsEditing = false
            picker!.sourceType = UIImagePickerControllerSourceType.camera
            picker!.cameraCaptureMode = .photo
            present(picker!, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.contentMode = .scaleAspectFit
        imageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
}
