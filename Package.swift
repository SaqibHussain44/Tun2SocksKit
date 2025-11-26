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
    // Swift-level tunnel wrapper
    .target(
       name: "Tun2SocksKit",
       dependencies: ["Tun2SocksKitC"]
    ),

    // C wrapper + headers + the HevSocks5Tunnel C API
    .target(
       name: "Tun2SocksKitC",
       path: "Sources/Tun2SocksKitC",
       publicHeadersPath: ".",
       cSettings: [
           .headerSearchPath("."),
           .headerSearchPath("../HevSocks5TunnelC/include"),
       ]
    ),
    .target(
            name: "HevSocks5TunnelC",
            path: "Sources/HevSocks5TunnelC",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        )
  ]
)
