//
//  ViewController.swift
//  macOS-Demo
//
//  Created by Ehsan Taghavi on 9/21/23.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var colorDropDown: NSPopUpButtonCell!
    @IBOutlet weak var fontDropDown: NSPopUpButtonCell!
    
    @IBOutlet weak var colorView: NSView!
    
    @IBOutlet weak var sampleFontLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.populateColorsFontFamilies()
    }
    
    func populateColorsFontFamilies() {
        colorDropDown.addItems(withTitles: ["Choose Color", "white", "red", "green", "blue"])
        colorView.wantsLayer = true
        colorView.layer?.backgroundColor = NSColor.white.cgColor
        fontDropDown.addItems(withTitles: NSFontManager.shared.availableFontFamilies)
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
    
    @IBAction func sendMessageTapped(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let myCentre = NSUserNotificationCenter.default
            let notification = NSUserNotification.init()
            notification.title = "Notification Message"
            notification.subtitle = "Subtitle Notification"
            notification.informativeText = "Text Demo"
            notification.soundName = "bell"
            myCentre.deliver(notification)
        })
    }
    
    @IBAction func changeColorTapped(_ sender: NSPopUpButton) {
        if colorDropDown.indexOfSelectedItem == 1 {
            colorView.wantsLayer = true
            colorView.layer?.backgroundColor = NSColor.white.cgColor
        } else if colorDropDown.indexOfSelectedItem == 2 {
            colorView.wantsLayer = true
            colorView.layer?.backgroundColor = NSColor.red.cgColor
        }
        else if colorDropDown.indexOfSelectedItem == 3 {
           colorView.wantsLayer = true
           colorView.layer?.backgroundColor = NSColor.green.cgColor
       }
        else if colorDropDown.indexOfSelectedItem == 4 {
           colorView.wantsLayer = true
           colorView.layer?.backgroundColor = NSColor.blue.cgColor
       }
    }
    
    
    @IBAction func changeFontTapped(_ sender: NSPopUpButton) {
        print(sender.selectedItem!.title)
        let selectedMember = sender.selectedItem!.title
        let font = NSFont.init(name: selectedMember, size: 18)
        sampleFontLabel.font = font
    }
}

