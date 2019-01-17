#import "StoragePlugin.h"
#import <storage/storage-Swift.h>

@implementation StoragePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStoragePlugin registerWithRegistrar:registrar];
}
@end
