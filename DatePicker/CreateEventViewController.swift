//
//  ViewController.swift
//  DatePicker
//
//  Created by Liubov Kaper  on 11/16/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    @IBOutlet weak var eventTextField: UITextField!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    

    @IBOutlet weak var createEventButton: UIButton!
    
    
    @IBOutlet weak var rsvpLabel: UILabel!
    
    var event: Event! {
        didSet { // property observer gets called when property changes
            //update UI whenever the event changes
            if event.willAttend {
                //  update label and button
                rsvpLabel.text = "RSVP YES"
                createEventButton.setTitle("View Event", for: .normal)
            } else {
                rsvpLabel.text = "RSVP NO"
                createEventButton.setTitle("RSVP to Event", for: .normal)
            }
        }
    }
    
    
    // VIEW CONTROLLER LIFECYCLE METHODS
    
    override func viewDidLoad() { // where we configure startup logic
        super.viewDidLoad()
        
        // we need to set this view controller as the delegate object for the EventTextField
        // Date() creates (instantiates) a new Date object with the current date and timr
        event = Event(name: "Event name not changed", willAttend: false, date: Date())
        eventTextField.delegate = self
        
        // configure the DatePicker in code
        datePicker.minimumDate = Date() // user is not allowed to set the event prior to today's date
        
    }
   // SEGUE method(connects view controllers and passes data in between that)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare (for segue: )")
        // here is where we want to set up and pass the event data tp the detail view controller
        
        // 1. we need to get an instance of a detailViewController
        // the DetailViewController is where we are transitioning to ->
        // segue.source is where the segue is coming from
        // segue.destination is where the segue is going to
        // type casting to DetailViewController(it doesn't see it unless we do that)
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        // we could set the event on the detsil view controller now
        // where we segueing to now has its event set successfuly
        detailViewController.event = event
    }
    
 
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // updating event's date
        event.date = sender.date
    }
    


}

extension CreateEventViewController: UITextFieldDelegate {
    // function below to when user clicks on return key, to dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // updating event's name
        event.name = eventTextField.text ?? ""
        return true
    }
}
