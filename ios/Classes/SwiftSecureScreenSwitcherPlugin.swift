import Flutter
import UIKit

public class SwiftSecureScreenSwitcherPlugin: NSObject, FlutterPlugin {
  var secured = false;
  
  internal let registrar: FlutterPluginRegistrar
  
  init(registrar: FlutterPluginRegistrar) {
      self.registrar = registrar
    super.init()
    registrar.addApplicationDelegate(self)
  }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "secure_screen_switcher", binaryMessenger: registrar.messenger())
    let instance = SwiftSecureScreenSwitcherPlugin(registrar: registrar)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func applicationWillResignActive(
    _ application: UIApplication
  ) -> Void {
    if ( secured ) {
      UIApplication.shared.ignoreSnapshotOnNextApplicationLaunch()
      let windows = UIApplication.shared.windows;

      for w in windows {
        w.isHidden = true
      }
    }
  }

  public func applicationDidBecomeActive(
    _ application: UIApplication
  ) -> Void {
    
    let windows = UIApplication.shared.windows;

    for w in windows {
      w.isHidden = false
    }
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "secure_app") {
      secured = true;
      result(true)
    }
  }
}
