# 🔐💬 iOS Passwordless Chat with Auth0 and Stream  [![](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2Fpasswordless-chat-app-ios)](https://twitter.com/intent/tweet?text=Want%20to%20build%20a%20passwordless%20chat%20app%20for%20iOS%3F%20Learn%20how%3A&url=https%3A%2F%2Fgithub.com%2FGetStream%2Fpasswordless-chat-app-ios)

<img align="right" src="https://i.imgur.com/KlgppiG.png" width="40%" />

## 📚 Tutorial

This repository contains the completed Xcode project following the [iOS Passwordless Chat Application with Auth0](https://getstream.io/blog/passwordless-chat-app-ios/) tutorial. You should read it before trying to run this project as it contains it may contain useful information not present in this README.

## ⚙️ Setup

## Requirements
- A [Stream account](https://getstream.io/accounts/signup/) account
- An [Auth0 account](https://auth0.com/signup) account
- An [Ngrok account](https://dashboard.ngrok.com/signup)
- [Node v14](https://nodejs.org/) installed
- [Ngrok installed](https://ngrok.com/download)
- Xcode 12 or later

### Configuration

You should place your Stream Chat API Key and Secret in the backend's [index.js](backend/index.js#L10) and the API Key once more in the iOS project's [makeChat.swift](ios/NoPwdChat/ViewController.swift#L16) and PEM certificate as public.pem in the [backend](backend) folder.

After you run your backend and you've set up Ngrok, make sure to replace the URL with your Ngrok HTTPS URL in the iOS project's [fetchStreamJWT.swift](ios/NoPwdChat/Functions/fetchStreamJWT.swift#L4)- [

### Dependencies

The dependencies are installed with Xcode's built-in Swift Package Manager integration. Opening the Xcode project will install them by default.

- [Auth0's Lock.swift Authentication Framework](https://github.com/auth0/Lock.swift)
- [Stream's Swift Chat UI SDK](https://github.com/getstream/stream-chat-swift)

## 🔗 Helpful Links

- [Build an iMessage Clone with The Stream Chat iOS SDK](https://getstream.io/blog/build-imessage-clone/)
- [Stream Chat iOS Tutorial](https://getstream.io/tutorials/ios-chat/)
- [Stream Chat iOS Repo](https://github.com/GetStream/stream-chat-swift)
- [Stream Chat iOS Docs](https://getstream.io/chat/docs/ios-swift/)
- [Auth0 Passwordless Docs](https://auth0.com/docs/libraries/lock-swift/lock-swift-passwordless)
