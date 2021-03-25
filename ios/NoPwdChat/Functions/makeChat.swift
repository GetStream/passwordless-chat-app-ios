import UIKit
import StreamChat
import StreamChatUI

func makeChat(_ token: String) -> UINavigationController {
    let apiKey = APIKey("[your_stream_api_key]")
    let token = Token(stringLiteral: token)
    let chatConfig = ChatClientConfig(apiKey: apiKey)
    let chatClient = ChatClient(config: chatConfig, tokenProvider: .static(token))
    
    let channelListVC = ChatChannelListVC()
    let query = ChannelListQuery(filter: .containMembers(userIds: [chatClient.currentUserId!]))
    channelListVC.controller = chatClient.channelListController(query: query)
    
    return UINavigationController(rootViewController: channelListVC)
}
