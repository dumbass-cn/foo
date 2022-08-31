// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import Darwin

let package = Package(
    name: "foo",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Foo", targets: ["Foo"]),
    ],
    targets: [
        .target(name: "Foo",
                cSettings: [.headerSearchPath("cfoo")],
                linkerSettings: [.unsafeFlags(["-Xlinker", "Sources/Foo/cfoo/mobile.a"])]),
        .testTarget(
            name: "FooTests",
            dependencies: ["Foo"]),
    ]
)
// "/Users/Damon/Workspace/go-ios/example-app-ios/foo/Sources/Foo/cfoo/mobile.a"
