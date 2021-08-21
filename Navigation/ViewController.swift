//
//  ViewController.swift
//  Navigation
//
//  Created by Kim Jae Hyeon on 2021/08/17.
//

import UIKit

class ViewController: UITableViewController, EditDelegate {

    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lightOn.png")
    let imgOff = UIImage(named: "lightOff.png")
    
    var isOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue: use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool){
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}
