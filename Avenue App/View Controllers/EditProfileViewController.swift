//
//  EditViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 25/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    
    var delegate:ProfileDetailDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = (view.frame.height * 0.18) / 2
    }

    
    @IBAction func profileImageTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = profileImageView
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
                
            })
            alertController.addAction(cameraAction)

        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library ", style: .default, handler: {
                action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        present(alertController, animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
                profileImageView.image = selectedImage
                dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let delegate = delegate,let firstName = delegate.firstName,let lastName = delegate.lastName else{ return}
        
        
        UserDataController.updateFirstName(firstName:firstName)
        UserDataController.updateLastName(lastName:lastName)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditProfileTableViewController{
            self.delegate = vc
        }
    }
    
    
    
}
