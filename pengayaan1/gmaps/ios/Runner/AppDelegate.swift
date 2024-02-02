import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMMServices.provideAPIKey("AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
