//
//  NewPersonViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class NewPersonViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() // убираем лишние полосы от ячеек
       
    }
    
// MARK: Table View delegate
    
    // скрывание клавиатуры по тапу на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                
                // TODO: chooseImagePicker
                // метод для выбора изображения
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                
                // TODO: chooseImagePicker
                // метод для выбора изображения
            }
            
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
