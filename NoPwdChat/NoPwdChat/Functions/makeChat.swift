import UIKit
import StreamChat
import StreamChatUI

func makeChat(_ token: String) -> UINavigationController {
    let apiKey = APIKey("p3peksa7mzmx")
    let token = Token(stringLiteral: token)
    let chatConfig = ChatClientConfig(apiKey: apiKey)
    let chatClient = ChatClient(config: chatConfig, tokenProvider: .static(token))
    
    let channelListVC = ChatChannelListVC()
    let query = ChannelListQuery(filter: .containMembers(userIds: [chatClient.currentUserId!]))
    channelListVC.controller = chatClient.channelListController(query: query)
    
    return UINavigationController(rootViewController: channelListVC)
}
