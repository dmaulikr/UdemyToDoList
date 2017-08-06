//
//  FirstViewController.swift
//  UdemyToDo
//
//  Created by Brian Hart on 8/2/17.
//  Copyright © 2017 Brian Hart. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var itemlist = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if let i = UserDefaults.standard.object(forKey: "items") as? [String] {
            itemlist = i
        }
        
        self.tasktable.reloadData()
        
    }
    
    
    @IBOutlet weak var tasktable: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: UITableViewDelegate {

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemlist.remove(at: indexPath.row)
            UserDefaults.standard.set(itemlist, forKey: "items")
            self.tasktable.reloadData()
            
        }
    }
    
}

extension FirstViewController: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemlist.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell" )
        
        cell.textLabel?.text = itemlist[indexPath.row]
        
        return cell
        
    }
    
}
