import PackageDescription

let package = Package(
	name: "Today-News-Server",
	targets: [

//        Target(name: "Application", dependencies: ["Server"]),
//        Target(name: "Common", dependencies: []),
//        Target(name: "Config", dependencies: []),
//        Target(name: "Model", dependencies: ["Config","Common","DataBase"]),
//        Target(name: "DataBase", dependencies: ["Config"]),
//        Target(name: "Server", dependencies: ["Route","Config"]),
//        Target(name: "Handler", dependencies: ["Common", "DataBase","Config","Model"]),
//        Target(name: "Route", dependencies: ["Handler", "Common"])
    ],
	dependencies: [
        .Package(
            url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
            majorVersion:3),
        .Package(
            url:"https://github.com/PerfectlySoft/Perfect-MongoDB.git",
            majorVersion:3)

    ]
)
