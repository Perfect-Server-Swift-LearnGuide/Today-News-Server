import PackageDescription

let package = Package(
	name: "Today-News-Server",
	targets: [ ],
	dependencies: [
        .Package(
            url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
            majorVersion:3),
        .Package(
            url:"https://github.com/PerfectlySoft/Perfect-MongoDB.git",
            majorVersion:3)

    ]
)
