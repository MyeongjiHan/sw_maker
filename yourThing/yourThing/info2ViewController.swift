//
//  info2ViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class info2ViewController: UIViewController {
   
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var content2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title2.text = "주민등록증 및 운전면허 분실대처 요령"
        content2.lineBreakMode = .byWordWrapping
        content2.text = "주민등록증은 분실 후 도용 등의 문제가 일어날 수 있으니, 분실 사실을 발견했다면 빠른 시일 내에 분실신고 및 재발급 처리 하실 것을 권장합니다.\n1. 분실신고\n 전국 가까운 주민센터에 직접 방문하시거나, 민원24 (대한민국 정부민원포털 www.minwon.go.kr)에 접속해 온라인으로 신고처리 하실 수 있습니다.\n2. 재발급 신청\n 주민등록증의 분실, 훼손 등의 사유로 새로운 주민등록증을 발급 받으려면, 업무의 성격상 온라인 처리가 어려우므로 (전국) 가까운 주민센터로 직접 방문하셔야 합니다.\n\n운전면허증은 분실 후 개인정보 도용 뿐 아니라 분실 면허증을 활용해 차량을 렌탈하고 사고를 일으키는 등 2차적인 문제로 인한 법적분쟁에까지 연루될 수 있으므로, 분실 사실을 발견했다면 빠른 시일 내에 분실신고 및 재발급 처리 하실 것을 권장합니다. \n1. 분실신고\n 지참하고 가까운 경찰서 교통민원실로 방문해 신고 하시거나, 도로교통공단 e-운전면허(https://dls.koroad.or.kr/) 홈페이지에서 신고하실 수 있습니다.\n 2. 재발급 신청\n  운전면허증의 분실, 훼손 등의 사유로 새로운 운전면허증을 발급 받으려면, 가까운 경찰서 또는 운전면허시험장으로 직접 방문하셔야 합니다."
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
