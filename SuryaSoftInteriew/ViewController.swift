//
//  ViewController.swift
//  SuryaSoftInteriew
//
//  Created by Mithu on 3/1/19.
//  Copyright © 2019 Mithu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var ttt: UITableView!
    
     var arrayofPersons: [ResponseDataModel] = [ResponseDataModel]()
    var email: [String] = [String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
        let json: [String: Any] = ["emailId": "mithuregar390@gmail.com"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        
        // create post request
        let url = URL(string: "http://surya-interview.appspot.com/list")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        var emaillist: [String] = [String]()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            self.email.append("fgcfg")
            if let responseJSON = responseJSON as? [String: Any]
            {
               self.email.append("fgcfg")
                let items = responseJSON["items"] as? NSArray
               // self.setUpproductDetails(dictsResults: items!)
               // self.email = responseJSON["items"] as? NSArray as! [NSArray];
                for dictsResult in items! {
                    if let value = dictsResult as? [String:String]
                    {
                        let urlImage:String = value["imageUrl"] as! String
                        
                        let emailId = value["emailId"] as! String
                        let firstName = value["firstName"] as! String
                        let lastName = value["lastName"] as! String
                       
                       let res = ResponseDataModel(urlImage: urlImage, emailId: emailId, firstName: firstName, lastName: lastName);
                        self.arrayofPersons.append(res);
                    }
                }
                
            }
            
           
       
            
            
        }
         print(emaillist)
        task.resume()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayofPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellableViewCell = ttt.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! CellableViewCell
        
        let prod = arrayofPersons[indexPath.row]
        print(email[indexPath.row]);
      print(prod.emailId);
      let name  = prod.firstName + " "+prod.lastName
        cell.setCell(imageUrl: prod.urlImage, email: prod.emailId, name: name)
       
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }

}

