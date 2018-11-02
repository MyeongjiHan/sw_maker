//
//  ResultTableViewController.swift
//  yourThing
//
//  Created by CAU on 31/10/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController, XMLParserDelegate {

    var xmlParser = XMLParser()
    var currentElement = ""
    var placeAddrs = [String]()
    var placeAddr = ""
    var resultPlaces = ""
    
    var userLostPlace = ""
    var userLostCategory = ""
    
    func requestInfo() {
        
        let url = "http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccToClAreaPd?serviceKey=XuU01vYHKB%2BUi3h%2FZXvu5%2BI7BJ5fP%2BB%2FLmrFscEhUDLAJfB2hTCKnu73ZJcpS9kDVtqYxxEAhJ6XB79kQKE4Sg%3D%3D&startPage=1&numOfRows=100&START_YMD=20170302&END_YMD=20170802"
        
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else {return}
        
        xmlParser.delegate = self
        xmlParser.parse()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestInfo()
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if(elementName == "depPlace") {
            placeAddr = ""
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "depPlace") {
            placeAddrs.append(placeAddr)
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        placeAddr = string
        
        print("\(string)")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return placeAddrs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ResultTableViewCell

        // Configure the cell...
        cell.lostName.text = placeAddrs[indexPath.row]

        return cell
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

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lostName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
