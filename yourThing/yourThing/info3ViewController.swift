//
//  info3ViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class info3ViewController: UIViewController {
    
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var content3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title3.text = "어음 및 수표 분실 대처요령"
        content3.lineBreakMode = .byWordWrapping
        content3.text = "어음, 수표를 분실했을 때는 당황하지 마시고, 다음의 절차를 참고하여 우선 해당 은행에 연락해 지급정지 신청을 한 후, 이어지는 수순에 따라 법원에 공시최고 신청을 하면 분실금액을 다시 돌려받을 수 있습니다.\n 1.발급 은행 지점에 가서 분실신고를 합니다. \n은행으로부터 ‘미제시 증명서’ 교부 수령\n비용 : 10만원 수표 기준 5천원 / 보증금은 10만원 당 2만원 \n 2.은행에서 받은 미제시 증명서를 지참하고 가까운 경찰관서(지구대 또는 파출소)에 가서 분실신고를 합니다.\n분실신고 접수증 2통 교부 수령 \n 3.법원에서 분실공시최고 신청을 합니다.(5일 이내)\n분실장소 관할법원이나 주소지 관할법원으로 가시면 됩니다. \n준비서류 : \n-공시최고 신청서(법원) 1부 \n-미제시 증명서(은행) 1부 \n-분실신고접수증(경찰) 1부 \n-신분증(주민등록증, 여권 등) \n 4.분실공시최고 신청 차 법원방문 시 다음의 절차를 참고하시기 바랍니다. \n① 법원 민원실에서 수표(어음)분실 공시최고 신청 방문을 알리고 접수처를 확인합니다. \n② 접수처에서 안내받은 법원 내 은행에서 인지구입, 송달료 및 공고료 등을 납부합니다. \n③ 다시 접수처로 돌아와 서류를 접수하고, 법원에서 발급하는 접수증을 수령합니다. \n비용 : 인지대 1,500원 / 송달료 9,050원 / 공고료 22,000원 (정확한 비용은 법원에 따라 조금씩 상이할 수 있습니다.) \n 5.법원 최고신청이 완료되면, 다시 수표(어음) 발급 은행으로 갑니다. 법원에서 수령한 접수증을 은행 직원에게 제출합니다.\n 6.귀가해서 재판일을 기다렸다가, 재판기일에 재판정에 출석하시면 됩니다. \n-공시최고 신청 후 3개월이 지나면 재판일을 알리는 통지서가 법원에서 송달됩니다. \n-재판기일에 재판정에 출석하여 특별한 이의신청인이 없다면 분실 신고한 금액을 돌려받게 됩니다. 다만, 선의의 피해자가 있을 시에는 금액을 서로 협의해야 합니다."
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
