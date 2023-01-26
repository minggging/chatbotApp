//
//  ChatViewController.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/26.
//

import Foundation
import UIKit
import MessageKit

class ChatViewController: MessagesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

    }
}

extension ChatViewController : MessagesDataSource {
    var currentSender: MessageKit.SenderType {
        <#code#>
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        <#code#>
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        <#code#>
    }
    
    
    
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {}
