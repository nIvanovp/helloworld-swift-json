//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by nikolai on 1/23/17.
//  Copyright © 2017 nikolai. All rights reserved.
//

import UIKit

class Product {
    var step: String! = "content of step"
}

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func action(_ sender: UIButton) {
        let json_object: NSMutableDictionary = NSMutableDictionary();
        
        let json_array: NSMutableArray = NSMutableArray();
        let product = Product();
        let prod: NSMutableDictionary = NSMutableDictionary()
        prod.setValue(product.step, forKey: "step")
        json_array.add(prod);
        
        json_object.setValue(input.text!, forKey: "username");
        json_object.setObject(json_array, forKey: "steps" as NSCopying);
        
        let json_data: NSData;
        do{
            json_data = try JSONSerialization.data(withJSONObject: json_object, options: JSONSerialization.WritingOptions()) as NSData
            let jsonString = NSString(data: json_data as Data, encoding: String.Encoding.utf8.rawValue) as! String
            output.text = jsonString
            print(jsonString)
        } catch _ {
            output.text = "json failure"
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

