// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "BitcoinKit",
    products: [
        .library(name: "BitcoinKit", targets: ["BitcoinKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .exactItem(.init("1.1.2200")!)),
        .package(url: "https://github.com/GigaBitcoin/secp256k1.swift.git", .exactItem(.init("0.5.0")!)),
        .package(url: "https://github.com/vapor-community/random.git", .upToNextMinor(from: "1.2.0"))
    ],
    targets: [
        .target(
            name: "BitcoinKit",
            dependencies: ["BitcoinKitPrivate", "secp256k1", "Random"]
        ),
        .target(
            name: "BitcoinKitPrivate",
            dependencies: ["OpenSSL", "secp256k1"]
        ),
        .testTarget(
            name: "BitcoinKitTests",
            dependencies: ["OpenSSL", "secp256k1", "Random", "BitcoinKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
