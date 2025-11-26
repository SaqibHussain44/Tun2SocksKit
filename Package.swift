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

         // MARK: Swift wrapper
         .target(
             name: "Tun2SocksKit",
             dependencies: ["Tun2SocksKitC"]
         ),

         // MARK: C wrapper bridging header → Swift
         .target(
             name: "Tun2SocksKitC",
             dependencies: [
                 .target(name: "HevSocks5TunnelC")
             ],
             path: "Sources/Tun2SocksKitC",
             publicHeadersPath: "include",
             cSettings: [
                 .headerSearchPath("include"),
                 .headerSearchPath("../HevSocks5TunnelC/include")
             ]
         ),

         // MARK: XCFramework wrapper
         .target(
             name: "HevSocks5TunnelC",
             path: "Sources/HevSocks5TunnelC",
             publicHeadersPath: "include",
             cSettings: [
                 .headerSearchPath("include"),
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
