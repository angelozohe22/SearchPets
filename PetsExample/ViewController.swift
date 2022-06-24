//
//  ViewController.swift
//  PetsExample
//
//  Created by Luis Angel Inga Mendoza on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var txtSearchPets: UITextField!
    @IBOutlet weak var petsTableView: UITableView!
    
    var petsArray = [
        "Sam dog",
        "Lorenzo el loro",
        "Mostacho el gato",
        "Simba el Leon"
    ]
    
    var backupPetsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backupPetsArray = petsArray
        
        petsTableView.dataSource = self
        petsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        txtSearchPets.delegate = self
        
        txtSearchPets.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        txtSearchPets.addTarget(nil, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
}

extension ViewController {
    
    @objc func textFieldDidChange(_ textField: UITextField){
        var petsArrayFiltered: [String] = []
        if textField == txtSearchPets {
            let text = textField.text ?? ""
            backupPetsArray.forEach({ value in
                if value.lowercased().contains(text.lowercased()){
                    petsArrayFiltered.append(value)
                }
            })
            petsArray = (text.count > 0) ? petsArrayFiltered : backupPetsArray
            petsTableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = petsArray[indexPath.row]
        
        return cell
    }
    
}


extension ViewController: UITextFieldDelegate{
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        guard let text = textField.text else {
//            return true
//        }
//
//        let count = text.count + string.count - range.length
//        let stringToValidate = "\(text)\(string)"
//
//        print("texto escribiendo:: \(text)")
//
////        return true
//        return count == 12 ? false : true
//    }
}

