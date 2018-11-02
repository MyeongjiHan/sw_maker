//
//  info1ViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class info1ViewController: UIViewController {
    
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var content1: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title1.text = "신용카드 분실 대처요령"
        
        content1.lineBreakMode = .byWordWrapping
        content1.text = "신용카드는 분실 사실을 발견한 즉시 해당 카드사에 분실신고를 하셔야 합니다.\n여러장의 신용카드를 분실하였을 경우 신용카드 분실 일괄신고 서비스를 이용하여 분실한 여러장의 신용카드사중 한 곳의 고객센터에 신고하여 타사 카드까지 분실등록이 가능합니다.\n 단, 법인카드는 개인 명의로 발급되어 있다 해도 일괄 신고를 할 수 없으니 별도로 분실신고를 하셔야 합니다.\n\n 대부분의 카드사에서는 신용카드 분실이나 도난 후 본인이 사용하지 않은 금액에 대해서는 보상처리 수수료 2만원만 부담하면 보상 신청이 가능하지만, 각 카드사의 규약에 따라 세부적인 적용이 다르므로 정확한 내용은 카드사에 직접 문의하셔야 합니다."
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
