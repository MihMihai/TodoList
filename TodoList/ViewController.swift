//
//  ViewController.swift
//  TodoList
//
//  Created by Mike on 4/9/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

protocol UpdateTable {
    func updateTableFromList(_ list: [String:String])
}

class ViewController: UIViewController {

    var delegate : UpdateTable?
    var currentCategory : String = ""
    
    
    @IBOutlet weak var ElemTitle: UITextField!
    @IBOutlet weak var Description: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: UIButton) {
        
        let element: [String:String] = ["title":ElemTitle.text!,"desc":Description.text!]
        if var list = UserDefaults.standard.value(forKey: "todolist") as? [String:[[String:String]]] {
            list[currentCategory]?.append(element)
            UserDefaults.standard.set(list,forKey: "todolist")
        }
        else {
            var elements: [String:[[String:String]]] = [:]
            elements[currentCategory]?.append(element)
            UserDefaults.standard.set(elements, forKey: "todolist")
        }
        
        
        self.delegate?.updateTableFromList(element)
        
        self.navigationController?.popViewController(animated: true)

    }

}

