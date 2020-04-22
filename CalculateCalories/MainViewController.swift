//
//  MainViewController.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let personsProfiles = ["Ekaterina", "Alexander", "Sergey"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return personsProfiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = personsProfiles[indexPath.row]
        cell.imageView?.image = UIImage(named: personsProfiles[indexPath.row])
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageView?.clipsToBounds = true // скругляем изображение
        
        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // высота строки ячейки
        return 85
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
