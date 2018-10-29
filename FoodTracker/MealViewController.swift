//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //mealname输入框
    @IBOutlet weak var nameTextInput: UITextField!
    //选择图片按钮
    @IBOutlet weak var photoImageView: UIImageView!
    //评分图标
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //让MealviewController成为代理
        nameTextInput.delegate = self
    }
    
     //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    //添加手势
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //隐藏键盘输入
        nameTextInput.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        //选择类型
        imagePickerController.sourceType = .photoLibrary
        //让MealviewController成为代理
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

}





