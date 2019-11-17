//
//  DetailViewController.swift
//  DatePicker
//
//  Created by Liubov Kaper  on 11/16/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var messegeLabel: UILabel!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    
    // we need object(Event)(need to create new file with struct Event) from source view controller (CreateEventViewController)
    var event: Event? // defoult value is nil, if no ? mark, we give an error
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
updateUI()
       
    }
    
    func updateUI() {
        guard let date = event?.date else {
            return
        }
       // selectedDateLabel.text =
        
        // set switch position base on value of willAttend, true or false
        // if true switch will turn on, else it will be turned off
        switchControl.isOn = event?.willAttend ?? false // true or false
        
        messegeLabel.text = event?.name ?? "Event name not available"
    }
  
    @IBAction func rsvpChanged(_ sender: UISwitch) {
    }
    
}
