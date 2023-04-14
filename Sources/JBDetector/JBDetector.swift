import UIKit

public struct JBDetector {
    /// Default Initializer.
    public init() {}
    
    /// Check if device is JailBroken.
    public var isJailbroken: Bool {
        get {
            // Skip checking if app is running on Simulator.
            if isSimulator { return false }
            
            // Ensure device is not JailBroken.
            guard !checkURISchemes(),
                  !checkApps(),
                  !checkFiles(),
                  !checkWritePermission(),
                  !checkSystemAPI()
            else { return true }
            
            return false
        }
    }
    
    // MARK: - Private Methods
    /// Check if suspicious apps (Cydia, etc.) is installed using URI Scheme.
    private func checkURISchemes() -> Bool {
        for scheme in suspiciousURISchemes {
            if UIApplication.shared.canOpenURL(URL(string: scheme)!) {
                return true
            }
        }
        
        return false
    }
    
    /// Check if suspicious apps (Cydia, FakeCarrier, etc.) is installed.
    private func checkApps() -> Bool {
        for path in suspiciousAppPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        
        return false
    }
    
    /// Check if system contains suspicious files.
    private func checkFiles() -> Bool {
        for path in suspiciousSystemPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        
        return false
    }
    
    /// Check if app can write system files.
    private func checkWritePermission() -> Bool {
        let text = "👀"
        do {
            try text.write(
                toFile: "/private/text.txt",
                atomically: true,
                encoding: .utf8
            )
            
            return true
        } catch {
            return false
        }
    }
    
    /// Check if app can call System API.
    private func checkSystemAPI() -> Bool {
        // `getpgrp` method is used to check if there is a child process run at kernel level.
        let pid = getpgrp()
        return pid < 0
    }
    
    
    // MARK: - Private Properties
    private var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    private let suspiciousURISchemes: [String] = [
        "cydia://"
    ]
    
    private let suspiciousAppPaths: [String] = [
        "/Applications/Cydia.app",
        "/Applications/blackra1n.app",
        "/Applications/FakeCarrier.app",
        "/Applications/Icy.app",
        "/Applications/IntelliScreen.app",
        "/Applications/MxTube.app",
        "/Applications/RockApp.app",
        "/Applications/SBSettings.app",
        "/Applications/WinterBoard.app"
    ]
    
    private let suspiciousSystemPaths: [String] = [
        "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
        "/private/var/lib/apt",
        "/private/var/lib/apt/",
        "/private/var/lib/cydia",
        "/private/var/mobile/Library/SBSettings/Themes",
        "/private/var/stash",
        "/private/var/tmp/cydia.log",
        "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        "/usr/bin/sshd",
        "/usr/libexec/sftp-server",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/bin/bash",
        "/Library/MobileSubstrate/MobileSubstrate.dylib"
    ]
}
