//
//  MessageKitProtocol.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/26.
//

import Foundation
import UIKit
import MessageKit


public protocol MessageType {

    var sender: Sender { get }

    var messageId: String { get }

    var sentDate: Date { get }

    var kind: MessageKind { get }
}


public protocol SenderType {

    var senderId: String { get }
    
    var displayName: String { get }
}

public struct Sender: SenderType {
    public let senderId: String

    public let displayName: String
}
