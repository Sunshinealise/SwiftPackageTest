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
        .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/devxoul/Then.git", from: "3.0.0"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
//        .package(url: "https://github.com/devicekit/DeviceKit.git", from: "4.0.0"),
//        .package(url: "https://github.com/alibaba/HandyJSON.git", from: "4.1.3"),
//        .package(url: "https://github.com/Tencent/MMKV.git", from: "2.3.0"),
//        .package(url: "https://github.com/CoderMJLee/MJRefresh.git", from: "3.7.9"),
//        .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults.git", from: "5.3.0"),
//        .package(url: "https://github.com/Tencent/wcdb.git", from: "2.1.15"),
//        .package(url: "https://github.com/devxoul/Then.git", from: "3.0.0"),
    ],
    
    // target是构建的最小单元，通常与 Sources/ 和 Tests/ 目录对应；.target: 主模块（源代码）；.testTarget: 测试模块
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPackageTest",
            dependencies: [
                "Alamofire",  // ✅ 使用依赖
                "SDWebImage",
                "SnapKit",
                "KeychainAccess",
                "SwiftyUserDefaults",
                "Then",
                "Moya",
//                "DeviceKit"
//                "HandyJSON",
//                "MMKV",
//                "MJRefresh",
                
//                "wcdb",
//
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
