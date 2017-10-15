//
//  ViewController.swift
//  mapKitDecodable
//
//  Created by Vineeth Xavier on 10/12/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import UIKit
// checking git push
var zip:Int? = 76013
var zip1:String? = "76013"
var typeSearch:String? = "Restaurant"
class ViewController: UIViewController,UISearchBarDelegate {
    
   
    @IBOutlet weak var searchTupeText: UITextField!
    @IBOutlet weak var SearchBarZip: UISearchBar!
    
    @IBAction func currentLocation(_ sender: UIButton)
    {
        titleArray.removeAll()
        location.removeAll()
        latArray.removeAll()
        longArray.removeAll()
        pin.removeAll()
        
        
    }
    @IBAction func searchButton(_ sender: UIButton)
    {
        titleArray.removeAll()
        location.removeAll()
        latArray.removeAll()
        longArray.removeAll()
        pin.removeAll()
        typeSearch = searchTupeText.text
        zip = Int(zip1!)
        print("search type:::::2) = \(typeSearch)")
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        SearchBarZip.keyboardType = .numberPad
        SearchBarZip.delegate = self   // fot zip code search bar
       // SearchBarType.delegate = self // for Restaurant,hotel search bar
   
    }
//    func searchBar(_ SearchBarType: UISearchBar, textDidChange searchText: String) {
//        //print("searchText \(searchText)")
//        typeSearch = String(searchText)
//        print("type search :::: 1) \(typeSearch!)")
//
//    }
    func searchBar(_ SearchBarZip: UISearchBar, textDidChange searchText1: String) {
        //print("searchText \(searchText1)")
        zip1 = searchText1
        print("zip ::::::: 1) \(zip1!)")
        
    }

    

}

