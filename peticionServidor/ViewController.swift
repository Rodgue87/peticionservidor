//
//  ViewController.swift
//  peticionServidor
//
//  Created by Rodrigo Guerra Castilla on 11/03/17.
//  Copyright © 2017 Rodrigo Guerra Castilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var isbn: UITextField!
    
    @IBOutlet weak var informacion: UITextView!
    
    func sincrono() {
        let numISBN = self.isbn.text!//"978-84-376-0494-7"
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(numISBN)"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOf: url! as URL)
        
        if (datos != nil) {
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        informacion.text = texto as String!
        } else {
            informacion.text = "No hay conexión a Internet"
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor.blue
        sincrono()
         isbn.delegate = self
        view.backgroundColor = color
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func backgroundTap(sender: UIControl){
        isbn.resignFirstResponder()
        informacion.resignFirstResponder()
        
    }
    
    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()//desaparece el teclado
        sincrono()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

