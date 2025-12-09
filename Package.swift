// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageTest",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        // library表示构建成静态库或动态库
        // targets指定由哪些目标组成这个库
        // 指编译后的包，对外提供
        .library(name: "SwiftPackageTest", targets: ["SwiftPackageTest"]),
    ],
    //dependencies 指定依赖的外部 Swift 包；
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.15.0"),
        // SwiftLint - 代码规范
       .package(url: "https://github.com/realm/SwiftLint.git", from: "0.50.0"),
       
       // KeychainAccess - 钥匙串访问
       .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.2.0"),
       
        // 指定精确版本
        .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.6.0"),
    ],
    
    // target是构建的最小单元，通常与 Sources/ 和 Tests/ 目录对应；.target: 主模块（源代码）；.testTarget: 测试模块
    targets: [
//        .executableTarget(
//            name: "SwiftPackageTest",
//            dependencies: [
//            .product(name: "Alamofire", package: "Alamofire"),
//            .product(name: "SDWebImage", package: "SDWebImage"),
////            .product(name: "RxSwift", package: "RxSwift"),
////            .product(name: "RxCocoa", package: "RxSwift"),
//            .product(name: "KeychainAccess", package: "KeychainAccess"),
//            .product(name: "SnapKit", package: "SnapKit")
//        ]
//    ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPackageTest",
            dependencies: [
                "Alamofire",  // ✅ 使用依赖
                "SDWebImage",
                "SnapKit",
                "KeychainAccess",
            ]
            // ✅ 如果使用了资源文件
//           resources: [
//               .process("Resources")
//           ]
        ),
            
        .testTarget(
            name: "SwiftPackageTestTests",
            dependencies: ["SwiftPackageTest"]
        ),
    ]
)
