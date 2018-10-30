//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //mealname输入框
    @IBOutlet weak var nameTextInput: UITextField!
    //选择图片按钮
    @IBOutlet weak var photoImageView: UIImageView!
    //评分图标
    @IBOutlet weak var ratingControl: RatingControl!
    //保存菜品按钮
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //取消按钮
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    //Meal类对象
    var meal : Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //让MealviewController成为代理
        nameTextInput.delegate = self
        //使MealViewController在TableView中可以编辑
        //Set up views if editing an existing Meal
        if let editMeal = meal {
            navigationItem.title = meal?.name
            nameTextInput.text = meal?.name
            photoImageView.image = meal?.photo
            ratingControl.ratingScore = (meal?.rating)!
        }
        updateSaveButtonState()
    }
    
     //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    //使saveButton在键盘输入时无效
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    //如果输入为空则让saveButton无效
    private func updateSaveButtonState(){
        let text = nameTextInput.text ?? ""
        saveButton.isEnabled = !text.isEmpty
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
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //当按下save按钮后配置目的viewController
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed", log: OSLog.default, type: .debug)
            return
        }
        //save button被按下
        let name = nameTextInput.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.ratingScore
        //Set the meal to be passed to MealTableViewController after the un
        meal = Meal(name: name, photo: photo, rating: rating)
    }

}





