//
//  ViewController.swift
//  Atucasa.com
//
//  Created by Administrator on 5/3/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import UIKit
import CoreData

class AddressController: UIViewController {


    @IBOutlet weak var textfStreet: UITextField!

    @IBOutlet weak var textfHouseNumber: UITextField!
    @IBOutlet weak var textfRefStreet1: UITextField!
    @IBOutlet weak var textfRefStreet2: UITextField!
    @IBOutlet weak var textfBuilding: UITextField!
    @IBOutlet weak var textfPhone: UITextField!
    
    @IBAction func saveAddress(sender: AnyObject) {
        println ("Save");
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        let addressEntity = NSEntityDescription.entityForName("AddressEntity", inManagedObjectContext: contxt)
        var newAddress = Address  (entity:addressEntity!,insertIntoManagedObjectContext:contxt)
        newAddress.street = textfStreet.text
        
        newAddress.houseNumber = textfHouseNumber.text
        newAddress.refStreet1 = textfRefStreet1.text
        newAddress.refStreet2 = textfRefStreet2.text
        newAddress.building = textfBuilding.text
        newAddress.phone = textfPhone.text
        print(newAddress)
        contxt.save(nil)
        //self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if (identifier == "goList"){
            if (textfStreet.text.isEmpty || textfHouseNumber.text.isEmpty || textfPhone.text.isEmpty) {
                println("entro")
                var refreshAlert = UIAlertView()
                refreshAlert.title = "Datos Direccion"
                refreshAlert.message = "Los datos de calle, nro. domicilio y telefono son obligatorios"
                refreshAlert.addButtonWithTitle("OK")
                refreshAlert.show()
                
                return false
            }
        }
         return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "goList") {
            saveAddress(self)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

