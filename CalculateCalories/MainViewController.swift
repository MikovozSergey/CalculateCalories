//
//  MainViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let persons = Person.getPersons()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView() // убираем лишние полосы от ячеек
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = persons[indexPath.row].name
        cell.currentWeightLabel.text = String(persons[indexPath.row].currentWeight)
        cell.desiredWeightLabel.text = String(persons[indexPath.row].desiredWeight)
        cell.essentialColoriesLabel.text = String(persons[indexPath.row].essentialColories)
        
        cell.imageOfPerson.image = UIImage(named: persons[indexPath.row].name)
        cell.imageOfPerson.layer.cornerRadius = cell.imageOfPerson.frame.size.height / 2
        cell.imageOfPerson.clipsToBounds = true // скругляем изображение
        
        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // высота строки ячейки
        return 100
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {} // выход с помощью кнопки Cancel на MainViewController

}
