import PackageDescription

let package = Package(
	name: "Today-News-Server",
	targets: [
        Target(name: "TNApplication", dependencies: ["TNServer"]),
        Target(name: "TNCommon", dependencies: []),
        Target(name: "TNServer", dependencies: ["TNRoute"]),
        Target(name: "TNHandler", dependencies: ["TNCommon"]),
        Target(name: "TNRoute", dependencies: ["TNHandler", "TNCommon"])
    ],
	dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-MongoDB.git", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
