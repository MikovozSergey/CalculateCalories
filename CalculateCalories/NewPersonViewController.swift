//
//  NewPersonViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class NewPersonViewController: UITableViewController {

    var newPerson: Person?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var personAge: UITextField!
    @IBOutlet weak var personHeight: UITextField!
    @IBOutlet weak var personCurrentWeight: UITextField!
    @IBOutlet weak var personDesiredWeight: UITextField!
    @IBOutlet weak var sexSegmentControl: UISegmentedControl!
    @IBOutlet weak var trainingSegmentControl: UISegmentedControl!
    @IBOutlet weak var resultCaloriesLabel: UILabel!
    
    
    @IBAction func calculateTapped(_ sender: Any) {
       
        var bmi: Double = 0 // body index mass
        var bmr: Double = 0 // colories
        
        if let age: Int = Int(personAge.text!) {
            if let height: Int = Int(personHeight.text!) {
                if let weight: Int = Int(personDesiredWeight.text!){
                    
                    switch sexSegmentControl.selectedSegmentIndex {
                    case 0:
                        bmr = 88.362 + 13.397 * Double(weight) + 4.799 * Double(height) - 5.677 * Double(age)
                    case 1:
                        bmr = 447.593 + 9.247 * Double(weight) + 3.098 * Double(height) - 4.330 * Double(age)
                    default:
                        bmr = 0
                    }
                    
                    bmi = Double(weight) / pow(Double(height) / 100, 2)
                    
                }
            }
        }
        
        let factor = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor = factor[trainingSegmentControl.selectedSegmentIndex]
        
        bmr *= selectedFactor

        resultCaloriesLabel.text = String(floor(bmr))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        // tableView.tableFooterView = UIView() // убираем лишние полосы от ячеек
        personName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        personAge.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        personHeight.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        personCurrentWeight.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        personDesiredWeight.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
    }
    
// MARK: Table View delegate
    
    // скрывание клавиатуры по тапу на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                // метод для выбора изображения
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                // метод для выбора изображения
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true) // вызов наших alert controllers
        } else {
            view.endEditing(true)
        }
    }
    
    
    func saveNewPerson() {
        newPerson = Person(name: personName.text!,
                           currentWeight: personCurrentWeight.text!,
                           image: personImage.image,
                           personImage: "Ekaterina",
                           age: personAge.text,
                           height: personHeight.text,
                           desiredWeight: personDesiredWeight.text!,
                           sexSegmentControl: sexSegmentControl.selectedSegmentIndex,
                           activitiSegmentControl: trainingSegmentControl.selectedSegmentIndex,
                           essentialColories: resultCaloriesLabel.text!)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

// MARK: Text field delegate

extension NewPersonViewController: UITextFieldDelegate {
    
    // скрываем клавиатуру по нажатию done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if personName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
        if personAge.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
        if personHeight.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
        if personCurrentWeight.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
        if personDesiredWeight.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}


// MARK: Work with image

extension NewPersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker (source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source)  { // если у нас доступны объекты типа UIImagePicker
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            
            present(imagePicker, animated: true) // показываем наш  imagePicker
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { // присваиваем нашему приложению выбранную отредактированную картинку
        
        personImage.image = info[.editedImage] as? UIImage
        personImage.contentMode = .scaleAspectFill // делаем картинку ровной в нашем ImageView
        personImage.clipsToBounds = true
        
        dismiss(animated: true) // закрываем imagePickerController
    }
}
