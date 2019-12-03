#import "FlutterDeviceLocalePlugin.h"

@implementation FlutterDeviceLocalePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_device_locale"
            binaryMessenger:[registrar messenger]];
  FlutterDeviceLocalePlugin* instance = [[FlutterDeviceLocalePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"deviceLocales" isEqualToString:call.method]) {
      NSArray* languages = NSLocale.preferredLanguages;
      result(languages);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
