//
//  MsgRequest.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/24.
//

import Foundation

struct Msg {
    var content : String = ""
    
    var type : MsgType = .ME
    
    enum MsgType {
        case ME
        case BOT
    }
    
}

// MARK: - MsgRequest
// 나중에 포스트 방식으로 보낼 메세지
// 데이터는 struct, 그 외에는 class

struct MsgRequest: Codable {
    let utext, lang: String?
    
}



// MARK: - BotMsgResponse
struct BotMsgResponse: Decodable {
    let status: Int?
    let statusMessage: String?
    let request: MsgRequest?
    let atext, lang: String?
}
