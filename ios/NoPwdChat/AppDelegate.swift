import UIKit
import StreamChat
import Lock

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// 1: Create a `ChatClientConfig` with the API key.
        let config = ChatClientConfig(apiKeyString: "kvgjrn7nmuuj")

        /// 2: Set the shared `ChatClient` instance with the config and a temporary token provider.
        ChatClient.shared = ChatClient(config: config, tokenProvider: .anonymous)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Lock.resumeAuth(url, options: options)
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

