//
//  ViewController.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/24.
//

import UIKit
import Alamofire
import MessageKit
import InputBarAccessoryView


class ViewController: UIViewController {
    
    @IBOutlet weak var myTableVIew: UITableView!
    // TODO
    // 1. 리스트 준비
    // 2. 사용자가 입력한다
    // 3. 전송 누른다
    // 4. 딜레이 주기 - 로딩 보여주기
    // 5. 응갑 들어온다 - 보여준다
    
    var msgList : [Msg] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableVIew.dataSource = self
        
        //TODO: 프로토콜로 코드 재활용 올리기 알아보기
        let meCellNib = UINib(nibName: "MeCell", bundle: .main)
        self.myTableVIew.register(meCellNib, forCellReuseIdentifier: "MeCell")
        
        let otherCellNib = UINib(nibName: "OtherCell", bundle: .main)
        self.myTableVIew.register(otherCellNib, forCellReuseIdentifier: "OtherCell")
        
        self.myTableVIew.estimatedRowHeight = 100
        
    }
    
    
    
    @IBAction func sendBtn(_ sender: UIButton) {
        print("comment -", #fileID, #function, #line)
        
        guard let userInput = self.userInputTextfield.text else
        { return }
        
        // 내가 보낸 메세지 리스트에 띄우기
        var meMsg : Msg = Msg.init(content:userInput, type: .ME)
        
        self.msgList.append(meMsg)
        
        self.myTableVIew.reloadData()
        
        
        sendMsgApiCall(userInput: userInput)
    }
    
    @IBOutlet weak var userInputTextfield: UITextField!
    
    
    /// 메세지 발송 API 호출
    /// - Parameter userInput: 보낼 메세지
    fileprivate func sendMsgApiCall(userInput:String) {
        
        let parameters: [String: String] = [
            "utext": userInput,
            "lang": "ko",
        ]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "x-api-key": "SVA~OdqZkbUP2im~~OTdh-PVBrJ-ucZ1Aarrn0yI"
        ]
        
        
        AF.request("https://wsapi.simsimi.com/190410/talk",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
                    .responseDecodable(of: BotMsgResponse.self) { response in
                        
                        switch response.result {
                        case .failure(let err):
                            print("err \(err) -", #fileID, #function, #line)
                        case .success(let msg):
                            print("msg \(msg) -", #fileID, #function, #line)
                            guard let botMsg = msg.atext else { return }
                            var meMsg : Msg = Msg.init(content:botMsg, type: .BOT)
                            
                            self.msgList.append(meMsg)
                            
                            self.myTableVIew.reloadData()
                            self.userInputTextfield.text = ""
                        }
                        
            debugPrint(response)
            
        }

    }
    
    
}

extension ViewController : UITableViewDataSource {
    // 데이터가 몇 개 인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return msgList.count
    }
    
    // 각 데이터에 따라 셀 종류 정하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = msgList[indexPath.row]
        
        switch cellData.type {
        case .ME:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MeCell", for: indexPath) as? MeCell else { return UITableViewCell() }
            
            cell.meLabel.text = cellData.content
            
            return cell
            
        case .BOT:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OtherCell", for: indexPath) as? OtherCell else {return UITableViewCell()}
                    
            cell.botLabel.text = cellData.content
            
            return cell
            
        }
    }
    
    
    
}
