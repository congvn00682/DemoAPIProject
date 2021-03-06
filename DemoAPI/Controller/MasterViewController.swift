//
//  MasterViewController.swift
//  DemoAPI
//
//  Created by Vu Ngoc Cong on 5/10/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var heros: [Hero] = []
    override func viewDidLoad() {
        super.viewDidLoad()

//        // notification
//        NotificationCenter.default.addObserver(self, selector: #selector(handler), name: Notification.Name.init("update"), object: nil)
        
        // closure
        HeroDataServices.shared.getDataFromAPI { [unowned self] heros in
            self.heros = heros
            self.tableView.reloadData()
        }
        
    }
    

//    // notification
//    @objc func handler(){
//        tableView.reloadData()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        let hero = heros[indexPath.row]
        cell.nameEN.text = hero.nameEN_Champ
        cell.nameVN.text = hero.nameVN_Champ
        cell.level.text = hero.level_Champ
        cell.photoHero.download(from: hero.url_Champ)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
