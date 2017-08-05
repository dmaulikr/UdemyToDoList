//
//  SecondViewController.swift
//  UdemyToDo
//
//  Created by Brian Hart on 8/2/17.
//  Copyright © 2017 Brian Hart. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func addItem(_ sender: Any) {
        // Load in itemlist from storage
        // Shouldn't we be able to pass this between controllers?
        // I hate this pattern but don't know a better one yet

        var itemlist = [String]()
        
        // Try to load an existing itemlist
        if let i = UserDefaults.standard.object(forKey: "items") as? [String] {
            
            itemlist = i
            
        }
        
        itemlist.append(textfield.text!)
        textfield.text = ""
        
        // Save to storage
        UserDefaults.standard.set(itemlist, forKey: "items")
        
    }
    
        
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func dismissKeyboard() {
//        view.endEditing(true)
//        // do aditional stuff
//    }


}

