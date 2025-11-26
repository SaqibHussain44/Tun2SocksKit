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
        .target(
            name: "Tun2SocksKit",
            dependencies: ["Tun2SocksKitC"]
        ),
        .target(
            name: "Tun2SocksKitC",
            dependencies: ["HevSocks5TunnelC"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
        .target(
            name: "HevSocks5TunnelC",
            path: "Sources/HevSocks5TunnelC",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                // make headers from the xcframework visible
                .headerSearchPath("HevSocks5Tunnel.xcframework/ios-arm64/Headers"),
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
