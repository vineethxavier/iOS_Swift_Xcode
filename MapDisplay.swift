//
//  MapDisplay.swift
//  mapKitDecodable
//
//  Created by Vineeth Xavier on 10/12/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
struct response:Decodable
{
    let query:query
}
struct query:Decodable
{
    let results:results
}

struct results:Decodable
{
    let Result:[Result]
}

struct Result:Decodable
{
    let Title:String
    let Latitude:String
    let Longitude:String
    let Phone:String
}

var titleArray =  [String]()
var longArray =  [String]()
var latArray =  [String]()
var phoneArray = [String]()
var location = [Any]()
var pin = [Any]()
//let locationManager = CLLocationManager()
//var postalCode = ""

class MapDisplay: UIViewController, UITableViewDelegate,UITableViewDataSource//,CLLocationManagerDelegate
{
    
    @IBOutlet weak var mapViewConnect: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      //first part

        
        //let UrlString = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20local.search%20where%20zip%3D%2\(zip!)3%27%20and%20query%3D%27restaurant%27&format=json&callback="
        
       let UrlString = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20local.search%20where%20zip%3D%27\(zip!)%27%20and%20query%3D%27\(typeSearch!)%27&format=json&callback="
        print (":::::ZIP:::::: \(zip!)")
        print(">>>>type<<<< \(typeSearch!)")
        
        let url = URL.init(string: UrlString )
        do{
            let data = try Data.init(contentsOf: url!)
            let decodedJSON = try JSONDecoder().decode(response.self, from: data)
            for i in stride(from: 0, to: decodedJSON.query.results.Result.count, by: 1)
            {
                //print("TITLE:: \(decodedJSON.query.results.Result[i].Title)")
                let  titleNames:String = decodedJSON.query.results.Result[i].Title
                titleArray.append(titleNames)
                
                //print("longitudeVal:: \(decodedJSON.query.results.Result[i].Longitude)")
                let  longitudeVal:String = decodedJSON.query.results.Result[i].Longitude
                longArray.append(longitudeVal)
                
               // print("latitudeVal:: \(decodedJSON.query.results.Result[i].Latitude)")
                let  latitudeVal:String = decodedJSON.query.results.Result[i].Latitude
                latArray.append(latitudeVal)
                
                let phoneVal:String = decodedJSON.query.results.Result[i].Phone
                phoneArray.append(phoneVal)
            }//for loop
            
        }//do
        catch let err
        {
            print( err)
        }//catch
        //first part end
        
        //third part start - mapview
        //mapViewConnect.showsUserLocation = true
        for j in stride(from: 0, to: latArray.count, by: 1)
        {
       location.append(CLLocationCoordinate2D(latitude: Double(latArray[j])!, longitude: Double(longArray[j])!))
            mapViewConnect.setRegion(MKCoordinateRegionMakeWithDistance(location[j] as! CLLocationCoordinate2D, 3500, 3500), animated: true)
          //to drop a pin or annitation create a new SWIFT not cocoa file(pinAnnotation.swift)
            pin.append(pinAnnotation(Title: "\(titleArray[j])", subTitle: "\(phoneArray[j])", coOrdinate: location[j] as! CLLocationCoordinate2D))
            //mapViewConnect.addAnnotation(pin[j] as! MKAnnotation)
        }
        for k in stride(from: 0, to: pin.count, by: 1){
            mapViewConnect.addAnnotation(pin[k] as! MKAnnotation)
        }
        
        //third part end - mapview
        
        //current location
        

        //current location end
    }//viewDidLoad()
    

    //second part
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titleArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //print("!!!!!!!!!!entered table !!!!!!!!!!!!!!")
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        //print("<<<<table row>>>>  \(titleArray[indexPath.row])")
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mapViewConnect.showAnnotations(mapViewConnect.annotations, animated: true)
        mapViewConnect.selectAnnotation(pin[indexPath.row] as! MKAnnotation, animated: true)
    //second part end
    }
}//MapDisplay class
