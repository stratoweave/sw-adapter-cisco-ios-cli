# sw-adapter-cisco-ios-cli

Cisco IOS CLI device adapter for Stratoweave.

The package exports `sw_adapter_cisco_ios_cli.device_type` for use from an
application-owned `device_types.act` module:

```acton
import sw_adapter_cisco_ios_cli


device_types = {
    "CiscoIOSCLI": sw_adapter_cisco_ios_cli.device_type
}
```

The adapter currently exposes operational state only. It uses `netcli` to run
`show version`, parses output with the Cisco IOS TextFSM template from
ntc-templates, and maps the result into the bundled YANG model.

This repository uses local path dependencies for development against the
neighboring Stratoweave, netcli, textfsm, and acton-yang checkouts.
