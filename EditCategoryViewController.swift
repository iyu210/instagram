//
//  EditCategoryViewController.swift
//  taskapp
//
//  Created by 岩渕優児 on 2021/05/03.
//

import UIKit
import RealmSwift

class EditCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    let realm = try! Realm()
    var category : Category!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
            self.view.addGestureRecognizer(tapGesture)
        
        
        
    }
    

    @objc func dismissKeyboard(){
            // キーボードを閉じる
            view.endEditing(true)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.category.category = self.textField.text!
            self.realm.add(self.category, update: .modified)
        }

        super.viewWillDisappear(animated)
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
