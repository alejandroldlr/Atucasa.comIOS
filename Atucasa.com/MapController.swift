//
//  MapController.swift
//  Atucasa.com
//
//  Created by Administrator on 5/16/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
   
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var lat = -17.3668827
    var long = -66.2079351
    
    var restaurant = "Restaurant"
    
    
    var Latitud:Double{
        get{
            return self.lat
        }
        set{
            self.lat = newValue
        }
    }
    
    var Longitud:Double{
        get{
            return self.long
        }
        set{
            self.long = newValue
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
        
        //self.Latitud = locationManager.location.coordinate.latitude
        //self.Longitud = locationManager.location.coordinate.latitude
        
        let location = CLLocationCoordinate2D(latitude:self.Latitud,longitude:self.Longitud)
        
        println(self.Latitud)
        println(self.Longitud)
        let span = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegion(center:location, span:span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title="Tu ubicacion!!!"
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var currentLocation : CLLocation = locations[0] as! CLLocation
        
        //if currentLocation.description != nil {
            var stringLong : NSString = NSString(format: "%0.8f", currentLocation.coordinate.longitude)
            
            var stringLat : NSString = NSString(format: "%0.8f", currentLocation.coordinate.latitude)
            
            
            
        //}
        
        println("longitud:" + (stringLong as String))
        println("latitud:" + (stringLat as String))
        
        locationManager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error) ->Void in
            
            if (error != nil){
                println("Error al obtener la ubicacion")
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as! CLPlacemark
                self.displayLocationInfo(pm)
            } else{
                println("Error al recibir datos dek geocoder")

            }
        
        })
        
    }
    
    func displayLocationInfo(placemark: CLPlacemark?){
        if let containsPlacemark = placemark {
            //locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil ) ? containsPlacemark.locality : ""
            println(locality)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error mientras se actualizaba la ubicacion " + error.localizedDescription)
        var errorAlert : UIAlertView = UIAlertView(title: "Error", message: "Error al obtener la ubicacion", delegate: nil, cancelButtonTitle: "OK")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
