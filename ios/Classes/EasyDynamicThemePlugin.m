#import "EasyDynamicThemePlugin.h"
#if __has_include(<easy_dynamic_theme/easy_dynamic_theme-Swift.h>)
#import <easy_dynamic_theme/easy_dynamic_theme-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "easy_dynamic_theme-Swift.h"
#endif

@implementation EasyDynamicThemePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEasyDynamicThemePlugin registerWithRegistrar:registrar];
}
@end
