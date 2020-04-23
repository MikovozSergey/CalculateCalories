//
//  MainViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var persons = Person.getPersons()

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
        
        let person = persons[indexPath.row]

        cell.nameLabel.text = person.name
        cell.currentWeightLabel.text = "Current weight - " + person.currentWeight! + " kg"
        cell.desiredWeightLabel.text = "Desired weight - " + person.desiredWeight! + " kg"
        cell.essentialColoriesLabel.text = "Essential colories - " + person.essentialColories!
        
        if person.image == nil {
            cell.imageOfPerson.image = UIImage(named: person.personImage!)
        } else {
            cell.imageOfPerson.image = person.image
        }
        
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
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPersonVC = segue.source as? NewPersonViewController else { return }
        
        newPersonVC.saveNewPerson()
        persons.append(newPersonVC.newPerson!)
        
        tableView.reloadData()
    }
    
}
