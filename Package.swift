// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Tun2SocksKit",
  products: [
        .library(
            name: "Tun2SocksKit",
            targets: ["Tun2SocksKit"]
        ),
        .library(
            name: "Tun2SocksKitC",
            targets: ["Tun2SocksKitC"]
        )
    ],
    targets: [
        
        // MARK: Swift Tunnel Wrapper
        .target(
            name: "Tun2SocksKit",
            dependencies: ["Tun2SocksKitC"]
        ),

        // MARK: C Wrapper for Swift
        .target(
            name: "Tun2SocksKitC",
            dependencies: ["HevSocks5TunnelC"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),

        // MARK: HevSocks5Tunnel XCFramework Wrapper
        .target(
            name: "HevSocks5TunnelC",
            path: "Sources/HevSocks5TunnelC",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),

                // XCFramework headers (DEVICE)
                .headerSearchPath("HevSocks5Tunnel.xcframework/ios-arm64/Headers"),

                // XCFramework headers (SIMULATOR)
                .headerSearchPath("HevSocks5Tunnel.xcframework/ios-arm64_x86_64-simulator/Headers")
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-framework", "HevSocks5Tunnel",
                    "-F", "Sources/HevSocks5TunnelC/HevSocks5Tunnel.xcframework"
                ])
            ]
        )
    ]
)
