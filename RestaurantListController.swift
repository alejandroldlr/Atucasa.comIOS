//
//  RestaurantListController.swift
//  Atucasa.com
//
//  Created by Administrator on 5/9/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import UIKit
import SwiftHTTP
import ObjectMapper


class RestaurantListController: UITableViewController {

    var restaurantList: [RestaurantObj] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var request = HTTPTask()
        
        request.GET("http://lopezdelarosa.com/atucasa/index.php", parameters: nil, completionHandler: {(response: HTTPResponse) in
            
            if let err = response.error {
                println("error: \(err.localizedDescription)")
            }
            
            if let data = response.responseObject as? NSData {
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response: \(str)") //prints the HTML of the page
                
            
                var jsonErrorOptional: NSError?

                let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonErrorOptional)
                

                if let statusArray: Array<AnyObject> = jsonOptional as? Array{

                    for rest in statusArray{

                        //println("rest \(rest)")
                        let restaurant:Restaurant = Mapper<Restaurant>().map(rest)!

                        var name = restaurant.name
 
                        self.restaurantList.append(RestaurantObj(name: restaurant.name,foodtype: restaurant.foodtype,schedule: restaurant.schedule, status: restaurant.status, imageid: restaurant.imageid,
                            address: restaurant.address, phone: restaurant.phone))
                        //self.nameRest.text = name!

                    }
                }
 
                
            }
        })
        
    
    }

    override func viewDidAppear(animated: Bool) {
        
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
        return restaurantList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let CellID: String = "RestaurantCell"
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as! UITableViewCell

        var restaurant:String

        
        restaurant = " Especialidad:"+restaurantList[indexPath.row].foodtype
        restaurant = restaurant+" Direccion:"
        restaurant = restaurant+restaurantList[indexPath.row].address
        restaurant = restaurant+" Telefono:"
        restaurant = restaurant+restaurantList[indexPath.row].phone
        restaurant = restaurant+" Estado:"
        restaurant = restaurant+restaurantList[indexPath.row].status
        
        
        cell.textLabel?.text = restaurantList[indexPath.row].name
        cell.detailTextLabel?.numberOfLines = 4;
        //cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap
        cell.detailTextLabel?.text=restaurant
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
