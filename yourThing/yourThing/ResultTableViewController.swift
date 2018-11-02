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
    var xmlParser2 = XMLParser()
    var currentElement = ""
    
    var lostNames = [String]() //물품명
    var acquisitionDates = [String]() //습득일자
    var placeAddrs = [String]() //보관장소
    var lostIDs = [LostID]() //분실물 ID
    var atcIds = [String]() //관리 ID
    var fdSns = [String]() //습득순번
    var lostImages = [String]() //분실물 이미지
    
    var placeAddr = ""
    var lostName = ""
    var acquisitionDate = ""
    var atcId = ""
    var fdSn = ""
    var lostImage = ""
    
    var resultPlaces = ""
    
    var userLostPlace = ""
    var userLostCategory = ""
    
    var selectedIndex:Int?
    
    func requestInfo() {
        
//        let temp_url = "http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccTpNmCstdyPlace?serviceKey=XuU01vYHKB%2BUi3h%2FZXvu5%2BI7BJ5fP%2BB%2FLmrFscEhUDLAJfB2hTCKnu73ZJcpS9kDVtqYxxEAhJ6XB79kQKE4Sg%3D%3D&pageNo=1&startPage=1&numOfRows=50&pageSize=10&PRDT_NM="
//        let temp_url2 = "&DEP_PLACE="
//
//
//
//
//        let encodedLostCategory = userLostCategory.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let encodedLostPlace = userLostPlace.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//
//        let url = "\(temp_url)\(encodedLostCategory!)\(temp_url2)\(encodedLostPlace!)"
//
//
//        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else {return}
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: "http://localhost:8080/sample2.xml")!) else {return}
        
        xmlParser.delegate = self
        xmlParser.parse();

        
        
        print("atcIds.count = \(atcIds.count)")
        
        for i in 1...atcIds.count {
            let tempLostId = LostID(atcId: atcIds[i-1], fdSn: fdSns[i-1])
            lostIDs.append(tempLostId)
        }
        
        for i in 1...atcIds.count {
            requestInfo2(lostID: lostIDs[i-1])
        }
    }
    
    func requestInfo2(lostID:LostID) {
//        let temp_url = "http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundDetailInfo?serviceKey=XuU01vYHKB%2BUi3h%2FZXvu5%2BI7BJ5fP%2BB%2FLmrFscEhUDLAJfB2hTCKnu73ZJcpS9kDVtqYxxEAhJ6XB79kQKE4Sg%3D%3D&ATC_ID="
//        let temp_url2 = "&FD_SN="
//
//        let url = "\(temp_url)\(lostID.atcId)\(temp_url2)\(lostID.fdSn)"
//
//        guard let xmlParser2 = XMLParser(contentsOf: URL(string: url)!) else {return}
        
        guard let xmlParser2 = XMLParser(contentsOf: URL(string: "http://localhost:8080/sample2.xml")!) else {return}

        xmlParser2.delegate = self
        xmlParser2.parse()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lostNames = []
        acquisitionDates = []
        placeAddrs = []
        lostImages = []
        atcIds = []
        fdSns = []
        lostIDs = []
        
        requestInfo()
        
        
    
        
        self.tableView.rowHeight = 140
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        
        
//        if (parser == xmlParser) {
//            print("parser = xmlParser")
//            if(elementName == "depPlace") {
//                placeAddr = ""
//            } else if (elementName == "fdPrdtNm") {
//                lostName = ""
//            } else if (elementName == "fdYmd") {
//                acquisitionDate = ""
//            } else if (elementName == "atcId") {
//                atcId = ""
//            } else if (elementName == "fdSn") {
//                fdSn = ""
//            }
//        } else if (parser == xmlParser2) {
//            if (elementName == "fdFilePathImg") {
//                lostImage = ""
//            }
//        }
        
        if(elementName == "depPlace") {
            placeAddr = ""
        } else if (elementName == "fdPrdtNm") {
            lostName = ""
        } else if (elementName == "fdYmd") {
            acquisitionDate = ""
        } else if (elementName == "atcId") {
            atcId = ""
        } else if (elementName == "fdSn") {
            fdSn = ""
        } else if (elementName == "fdFilePathImg") {
            lostImage = ""
        }

    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if (parser == xmlParser) {
//            if(elementName == "depPlace") {
//                placeAddrs.append(placeAddr)
//            } else if (elementName == "fdPrdtNm") {
//                lostNames.append(lostName)
//            } else if (elementName == "fdYmd") {
//                acquisitionDates.append(acquisitionDate)
//            } else if (elementName == "atcId") {
//                atcIds.append(atcId)
//            } else if (elementName == "fdSn") {
//                fdSns.append(fdSn)
//            }
//        } else if (parser == xmlParser2) {
//            if (elementName == "fdFilePathImg") {
//                lostImages.append(lostImage)
//            }
//        }
        
        if(elementName == "depPlace") {
            placeAddrs.append(placeAddr)
        } else if (elementName == "fdPrdtNm") {
            lostNames.append(lostName)
        } else if (elementName == "fdYmd") {
            acquisitionDates.append(acquisitionDate)
        } else if (elementName == "atcId") {
            atcIds.append(atcId)
        } else if (elementName == "fdSn") {
            fdSns.append(fdSn)
        } else if (elementName == "fdFilePathImg") {
            lostImages.append(lostImage)
        }


    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
//        if (parser == xmlParser) {
//            if(currentElement == "depPlace") {
//                placeAddr = string
//            } else if (currentElement == "fdPrdtNm") {
//                lostName = string
//            } else if (currentElement == "fdYmd") {
//                acquisitionDate = string
//            } else if (currentElement == "atcId") {
//                atcId = string
//            } else if (currentElement == "fdSn") {
//                fdSn = string
//            }
//        } else if (parser == xmlParser2) {
//            if (currentElement == "fdFilePathImg") {
//                lostImage = string
//            }
//        }
        
        if(currentElement == "depPlace") {
            placeAddr = string
        } else if (currentElement == "fdPrdtNm") {
            lostName = string
        } else if (currentElement == "fdYmd") {
            acquisitionDate = string
        } else if (currentElement == "atcId") {
            atcId = string
        } else if (currentElement == "fdSn") {
            fdSn = string
        } else if (currentElement == "fdFilePathImg") {
            lostImage = string
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
        
        var imageUrl = NSURL(string: lostImages[indexPath.row])
        var data = NSData(contentsOf: imageUrl as! URL)
        cell.lostImage.image = UIImage(data: data as! Data)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        
        return indexPath
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let nextView = segue.destination as! ResultDetailViewController
        
        nextView.selectedImage = lostImages[selectedIndex!]
        nextView.selectedLostName = lostNames[selectedIndex!]
        nextView.selectedDate = acquisitionDates[selectedIndex!]
        
        print("\(selectedIndex)")
        
    }
 

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

struct LostID {
    var atcId:String //관리 ID
    var fdSn:String //습득순번
}
