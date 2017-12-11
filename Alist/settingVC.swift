//
//  settingVC.swift
//  Alist
//
//  Created by Thanapat Sorralump on 1/11/17.
//  Copyright © 2017 Thanapat Sorralump. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreData

class settingVC: UITableViewController {
  
  @IBOutlet weak var username: UILabel!
  let thonburiFont = UIFont(name: "Thonburi", size: 17)
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: thonburiFont!, NSAttributedStringKey.foregroundColor: UIColor.white]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  @IBAction func deleteAllBtn(_ sender: Any) {
    
    // alert if don't insert every text field
    let alert = UIAlertController(title: "ลบข้อมูลทั้งหมด", message: "คุณต้องการลบข้อมูลรายการที่ต้องทำทั้งหมดหรือไม่", preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.default, handler: { action in
      
      let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
      let myContext = myAppDelegate.persistentContainer.viewContext
      let myFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
      let deleteAllData = NSBatchDeleteRequest(fetchRequest: myFetchRequest)
      
      self.tabBarController?.tabBar.items?.first?.badgeValue = nil
      
      do {
        try myContext.execute(deleteAllData)
      } catch let error as NSError {
        print(error.description + ": Can't delete all of data")
      }
    }))
    
    alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertActionStyle.cancel, handler: nil))
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func logout(_ sender: Any) {
    let alertLogout = UIAlertController(title: "ออกจากระบบ", message: "คุณต้องการออกจากระบบหรือไม่", preferredStyle: .alert)
    
    alertLogout.addAction(UIAlertAction(title: "ไม่", style: .default, handler: nil))
    
    alertLogout.addAction(UIAlertAction(title: "ใช่", style: .cancel, handler: { (action) in
      let firebaseAuth = Auth.auth()
      try! firebaseAuth.signOut()
      self.performSegue(withIdentifier: "unwindToRoot", sender: self)
    }))
    
    self.present(alertLogout, animated: true, completion: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let backItem = UIBarButtonItem()
    backItem.title = ""
    navigationItem.backBarButtonItem = backItem
  }
  
}
