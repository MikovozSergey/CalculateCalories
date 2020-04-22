//
//  NewPersonViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class NewPersonViewController: UITableViewController {

    
    @IBOutlet weak var imageOfPerson: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() // убираем лишние полосы от ячеек
       
    }
    
// MARK: Table View delegate
    
    // скрывание клавиатуры по тапу на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "camera")
            
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

}

// MARK: Text field delegate

extension NewPersonViewController: UITextFieldDelegate {
    
    // скрываем клавиатуру по нажатию done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
        
        imageOfPerson.image = info[.editedImage] as? UIImage
        imageOfPerson.contentMode = .scaleAspectFill // делаем картинку ровной в нашем ImageView
        imageOfPerson.clipsToBounds = true
        
        dismiss(animated: true) // закрываем imagePickerController
    }
}
