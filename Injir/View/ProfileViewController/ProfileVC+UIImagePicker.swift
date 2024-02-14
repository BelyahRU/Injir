//
//  ProfileVC+UIImagePicker.swift
//  Injir
//
//  Created by Александр Андреев on 12.02.2024.
//

import Foundation
import UIKit
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileView.avatarImageView.image = pickedImage
            sentImageToDatabase(image: pickedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func setupImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        profileView.avatarImageView.isUserInteractionEnabled = true
        profileView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageViewTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func sentImageToDatabase(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.6) else { return }
        viewModel.changeImage(data: imageData)
    }
    

}
