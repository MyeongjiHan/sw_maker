//
//  ListTableViewController.swift
//  yourThing
//
//  Created by MBP05 on 03/11/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var urlPath = ""
    var totalData = [String:[String:Any]]()
    var getName = [String]() //물품명
    var takePlace = [String]() //수령가능장소
    var getDate = [String]() //습득일자

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullPath = "http://openapi.seoul.go.kr:8088/7343526172686d6a34325966537845/json/SearchLostArticleService/1/50/\(urlPath)"
        print("path는\(fullPath)")
        guard let url = URL(string: fullPath) else {return}
        if let contents = try? String(contentsOf: url) {
            print(contents)
            if let data = contents.data(using: .utf8) {
                print(data)
                if let json = try! JSONSerialization.jsonObject(with: data, options: []) as?[String:[String:Any]] {
                    print(json)
                    totalData = json
                    
                }
            }
        }
        
        let totalValue = totalData["SearchLostArticleService"]
        let rowDatas = totalValue?["row"]
        
        
        if let data = rowDatas as? [[String:Any]] {
            print("rowDatas는 \(rowDatas)")
            for article in data {
                getName.append(article["GET_NAME"] as! String)
                takePlace.append(article["TAKE_PLACE"]as! String)
                getDate.append(article["GET_DATE"]as! String)}
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return getName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MyTableViewCell
            myCell.name.text = getName[indexPath.row]
            myCell.date.text = getDate[indexPath.row]
            myCell.place.text = takePlace[indexPath.row]
        
        return myCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
