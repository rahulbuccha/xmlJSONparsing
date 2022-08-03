//
//  ViewController.swift
//  XmlJsonParsing
//
//  Created by Admin on 02/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var result : Result?
    
    private let tableView : UITableView = {
        let table = UITableView(frame : .zero, style : .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.parseJSON()

    }
    
    // table
    func numberOfSections(in tableView: UITableView) -> Int {
        return result?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.data[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.data[section].items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result?.data[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text
        
        return cell
    }	
    
    // JSON
    private func parseJSON(){
        //accessing the file path and file name
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else{
            return
        }
        // converting it into URL
        let url = URL(fileURLWithPath: path)        
        
        do{
            // now accessing the file to decode the what's in there
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            tableView.reloadData()
            
//            // printing and checking the result
//            if let result = result {
//                print(result)
//            }
//            else{
//                print("failed to pass")
//            }
//            return
        }
        catch{
            print("error : \(error)")
        }
    }

}







