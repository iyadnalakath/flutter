//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <audioplayers_windows/audioplayers_windows_plugin.h>
#include <flutter_platform_alert/flutter_platform_alert_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AudioplayersWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AudioplayersWindowsPlugin"));
  FlutterPlatformAlertPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterPlatformAlertPlugin"));
}
