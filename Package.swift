// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TPNMediationIronSourceAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TPNMediationIronSourceAdapter",
            targets: ["TPNMediationIronSourceAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/topon-packages/TPNiOS_SPM.git", from: "6.5.60"),
        .package(url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git", exact: "9.8.0")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkIronSourceAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkIronSourceAdapter/90800.2.10/AnyThinkIronSourceAdapter-90800.2.10.zip",
            checksum: "57b34fbe6936af72b61de75d320597ebe9e04f568791556f70443aeb4cf03249"
        ),
        .target(
            name: "TPNMediationIronSourceAdapterTarget",
            dependencies: [
                "AnyThinkIronSourceAdapter",
                .product(name: "TPNiOS", package: "TPNiOS_SPM"),
                .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
            ],
            path: "Sources/TPNMediationIronSourceAdapterTarget"
        )
    ]
)