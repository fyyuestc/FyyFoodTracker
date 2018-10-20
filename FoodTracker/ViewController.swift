//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextInput: UITextField!
    //选择图片
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //让viewController成为代理
        nameTextInput.delegate = self
    }
    
     //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //添加手势
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //隐藏键盘输入
        nameTextInput.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        //选择类型
        imagePickerController.sourceType = .photoLibrary
        //让viewController成为代理
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //下面两个为遵守UIImagePickerControllerDelegate的方法
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Use the original representation of the image
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image!")
        }
        //显示选中的图片
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    //让nameLabel显示输入
    @IBAction func setDefaultName(_ sender: UIButton) {
          mealNameLabel.text = "Default text"
    }
}





