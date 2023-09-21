//
//  ViewController.swift
//  macOS-Demo
//
//  Created by Ehsan Taghavi on 9/21/23.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sendAlertTapped(_ sender: Any) {
        let myAlert = NSAlert.init()
        myAlert.messageText = "My Alert App"
        myAlert.informativeText = "Hello Alert App"
        myAlert.addButton(withTitle: "OK")
        myAlert.runModal()
    }
    
}

