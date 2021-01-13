#import "SecureScreenSwitcherPlugin.h"
#if __has_include(<secure_screen_switcher/secure_screen_switcher-Swift.h>)
#import <secure_screen_switcher/secure_screen_switcher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "secure_screen_switcher-Swift.h"
#endif

@implementation SecureScreenSwitcherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSecureScreenSwitcherPlugin registerWithRegistrar:registrar];
}
@end
