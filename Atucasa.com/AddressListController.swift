//
//  AddressListController.swift
//  Atucasa.com
//
//  Created by Administrator on 5/9/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import UIKit
import CoreData

class AddressListController: UITableViewController {
    
    var myListAddress:Array<AnyObject> = []
    var addressList = [Address]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*let cellBGView = UIView()
        cellBGView.backgroundColor = UIColor(red: 0, green: 0, blue: 200, alpha: 0.4)
        cell.selectedBackgroundView = cellBGView
        
        let cellUIImage = UIImage()
        
        self.tableView.backgroundColor*/
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //tableView.separatorColor = UIColor.brownColor()
    
       
    }

    override func viewDidAppear(animated: Bool) {

        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        let fetchRequest = NSFetchRequest (entityName: "AddressEntity")
        myListAddress = contxt.executeFetchRequest(fetchRequest, error: nil)!
 
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myListAddress.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let CellID: String = "Cell"
   
       var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as! UITableViewCell
       var data:NSManagedObject = myListAddress[indexPath.row] as! NSManagedObject
        
        var addressDetail:String = data.valueForKey("street") as! String!;
        
        var addressNumber:String = (data.valueForKey("houseNumber") as? String)!;
        
        addressDetail = addressDetail + ", #"
        addressDetail = addressDetail + addressNumber

        cell.textLabel?.text = addressDetail
        
        var imageView = UIImageView(frame: CGRectMake(10, 10, cell.frame.width - 10, cell.frame.height - 10))
        let image = UIImage(named: "fondoMadera1.jpeg")
        
        imageView.image = image
        cell.backgroundView = imageView
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        /*let cellUIColor = UIColor(red: 255, green: 255, blue: 153, alpha: 1)
        var cellToDeSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cellToDeSelect.contentView.backgroundColor = cellUIColor*/
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            var deletedItem:NSManagedObject = myListAddress[indexPath.row] as! NSManagedObject
            contxt.deleteObject(deletedItem)
            myListAddress.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        contxt.save(nil)
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
