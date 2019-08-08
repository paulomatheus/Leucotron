//
//  TableViewController.swift
//  Mural de Avisos
//
//  Created by Paulo Matheus on 06/08/19.
//  Copyright © 2019 Paulo Matheus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TableViewController: UITableViewController {

    @IBOutlet var tvcAvisos: UITableView!
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    
    var infoLista = [DataInfo]()
    var avisosLista: [String] = []
    var invertidoAvisosLista: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        invertidoAvisosLista = Array(self.avisosLista.reversed())
        //ref = Database.database().reference().child("avisos")
        ref = Database.database().reference()
        handle = ref.child("avisos").observe(.childAdded, with: {( snapshot) in
            //COnverte o conteudo em string
            let texto = snapshot.value as? String
            print("\n---------------\(texto)---------------------\n")
            
            //Verifica se nao esta nulo
            if let textoReal = texto {
                self.avisosLista.append(textoReal)
               // cell.textLabel!.text = "\(firstDay.day)  |  \(firstDay.name )"//Título
                self.tvcAvisos.reloadData()
            }
            print("\n¬¬¬¬¬¬¬¬¬¬\(self.avisosLista)¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n")
        })
       // carregarAvisos()
       
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   /* func carregarAvisos(){
        
        handle = ref.observe(.childAdded, with: {(snapshot) in
            if let item = snapshot.value as? String {
                self.avisosLista.append(item)
            }
            
            self.ref.removeObserver(withHandle: self.handle!)
            self.invertidoAvisosLista = Array(self.avisosLista.reversed())
            self.tableView.reloadData()
            
        })
    }
    */
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return avisosLista.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let info = avisosLista[indexPath.row]
        
        cell.textLabel?.text = info
        cell.textLabel?.textColor = UIColor.black
        //cell.detailTextLabel?.text = "SubTeste \(indexPath.row)"
    
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
