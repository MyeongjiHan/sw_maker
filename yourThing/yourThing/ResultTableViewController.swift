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
    
    var lostNames = [String]() //물품명
    var acquisitionDates = [String]() //습득일자
    var placeAddrs = [String]() //보관장소
    
    var placeAddr = ""
    var lostName = ""
    var acquisitionDate = ""
    
    var resultPlaces = ""
    
    var userLostPlace = ""
    var userLostCategory = ""
    
    func requestInfo() {
        
        let temp_url = "http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccTpNmCstdyPlace?serviceKey=XuU01vYHKB%2BUi3h%2FZXvu5%2BI7BJ5fP%2BB%2FLmrFscEhUDLAJfB2hTCKnu73ZJcpS9kDVtqYxxEAhJ6XB79kQKE4Sg%3D%3D&pageNo=1&startPage=1&numOfRows=50&pageSize=10&PRDT_NM="
        let temp_url2 = "&DEP_PLACE="
        
        let encodedLostCategory = userLostCategory.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let encodedLostPlace = userLostPlace.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = "\(temp_url)\(encodedLostCategory!)\(temp_url2)\(encodedLostPlace!)"
        
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else {return}
        
        xmlParser.delegate = self
        xmlParser.parse()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lostNames = []
        acquisitionDates = []
        placeAddrs = []

        
        requestInfo()
        self.tableView.rowHeight = 140
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if(elementName == "depPlace") {
            placeAddr = ""
        } else if (elementName == "fdPrdtNm") {
            lostName = ""
        } else if (elementName == "fdYmd") {
            acquisitionDate = ""
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "depPlace") {
            placeAddrs.append(placeAddr)
        } else if (elementName == "fdPrdtNm") {
            lostNames.append(lostName)
        } else if (elementName == "fdYmd") {
            acquisitionDates.append(acquisitionDate)
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(currentElement == "depPlace") {
            placeAddr = string
        } else if (currentElement == "fdPrdtNm") {
            lostName = string
        } else if (currentElement == "fdYmd") {
            acquisitionDate = string
        }
        
        //print("\(string)")
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
        cell.place.text = "보관장소: " + placeAddrs[indexPath.row]
        cell.lostName.text = "물품명: " + lostNames[indexPath.row]
        cell.acquisitionDate.text = "습득일자: " + acquisitionDates[indexPath.row]

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
    
    @IBOutlet weak var lostImage: UIImageView!
    @IBOutlet weak var lostName: UILabel!
    @IBOutlet weak var acquisitionDate: UILabel!
    @IBOutlet weak var place: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
