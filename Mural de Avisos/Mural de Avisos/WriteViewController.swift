//
//  WriteViewController.swift
//  Mural de Avisos
//
//  Created by Paulo Matheus on 07/08/19.
//  Copyright © 2019 Paulo Matheus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class WriteViewController: UIViewController {

    
    var refTitulo: DatabaseReference!
    var refConteudo: DatabaseReference!
    var handle: DatabaseHandle!
    

    @IBOutlet weak var tfTitulo: UITextField!
    @IBOutlet weak var tvConteudo: UITextView!
    
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var btVoltar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refTitulo = Database.database().reference().child("avisos")
        refConteudo = Database.database().reference().child("conteudo")
    }
    
    
     @IBAction func voltar(_ sender: UIButton) {
         self.performSegue(withIdentifier: "backHome", sender: self)
        
     }
     @IBAction func cadastrar(_ sender: UIButton) {
        refTitulo.childByAutoId().setValue(tfTitulo.text)
        refConteudo.childByAutoId().setValue(tvConteudo.text)
        self.performSegue(withIdentifier: "backHome", sender: self)
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
