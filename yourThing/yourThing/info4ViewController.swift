//
//  info4ViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class info4ViewController: UIViewController {
    
    @IBOutlet weak var title4: UILabel!
    @IBOutlet weak var content4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title4.text = "해외 분실 대처요령"
        content4.lineBreakMode = .byWordWrapping
        content4.text = "1. 여권을 분실했을 때\n가까운 현지 경찰서에서 분실신고를 하고 POLICE REPORT(분실신고 접수증)를 발급받은 후, 현지 한국 영사관에서 여행증명서를 또는 단수여권을 발급 받습니다. 만일에 대비해 여권 재발급 신청 시 필요한 서류(여권용 사진 2~3매, 여권번호와 발행연월일 별도메모 또는 여권사본 2~3매)들을 여행 전에 미리 준비해 가도록 합니다. \n 2. 항공권을 잃어버렸을 때\n 자신이 이용한 항공사 대리점을 찾아가 분실신고를 하면 항공권을 재발급 받을 수 있습니다. 단, 재발급에 별도의 비용부담이 발생할 수 있습니다.\n 3. 현금을 잃어버렸을 때\n한국에서 송금을 받으려면 우선 콜렉트 콜로 한국에 전화해 현지에서 즉시 이용이 가능한 은행명과 지점명, 여권번호, 체재하는 호텔의 이름과 주소, 전화번호 등을 알립니다.\n 4. 여행자 수표를 잃어버렸을 때\n 여행자 수표는 분실 또는 도난을 당해도 세계 각 지점을 통해 지급정지를 시키면 재발급 받을 수 있습니다. 재발행을 쉽게 받기 위해 여행자 수표에서 서명하는 2곳 중 상단에 있는 서명란에 미리 서명을 한 후 여행자 수표 구입 시 은행에서 발급하는 발행증명서를 별도로 보관합니다.\n 5. 짐을 잃어버렸을 때\n 항공기, 철도, 버스를 이용하다 짐을 분실했을 때는 짐을 예탁할 때 받는 화물인환증(Baggage Tag)으로 해당 운수회사로부터 보상을 받을 수 있습니다. 짐을 분실했을 경우에는 예탁할 때 주는 보관증서나 수화물 클레임 태그(Tag)로 분실센터에 신고하고, 경찰서에서 분실 증명서를 받아둡니다.\n 6. 비행기 탑승을 못했을 때\n 항공사 데스크를 찾아가 담당자에게 전후 사정을 설득력있게 이야기하고, 대처방안을 모색해 차선책(같은 항공사의 다음 스케줄 비행기를 이용하는 등)을 찾아야 합니다."
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
