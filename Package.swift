// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SFBAudioEngine",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v14),
	],
	products: [
		.library(
			name: "SFBAudioEngine",
			targets: [
				"CSFBAudioEngine",
				"SFBAudioEngine",
			]),
	],
	dependencies: [
		.package(url: "https://github.com/sbooth/CXXAudioUtilities", from: "0.1.0"),
		.package(url: "https://github.com/sbooth/AVFAudioExtensions", from: "0.1.0"),
	],
	targets: [
		.target(
			name: "CSFBAudioEngine",
			dependencies: [
				.product(name: "CXXAudioUtilities", package: "CXXAudioUtilities"),
				.product(name: "AVFAudioExtensions", package: "AVFAudioExtensions"),
			],
			cSettings: [
				.headerSearchPath("include/SFBAudioEngine"),
				.headerSearchPath("Input"),
				.headerSearchPath("Decoders"),
				.headerSearchPath("Player"),
				.headerSearchPath("Output"),
				.headerSearchPath("Encoders"),
				.headerSearchPath("Utilities"),
				.headerSearchPath("Analysis"),
				.headerSearchPath("Metadata"),
				.headerSearchPath("Conversion"),
			],
			linkerSettings: [
				.linkedFramework("Foundation"),
				.linkedFramework("AVFAudio"),
			]),
		.target(
			name: "SFBAudioEngine",
			dependencies: [
				"CSFBAudioEngine",
			]),
		.testTarget(
			name: "SFBAudioEngineTests",
			dependencies: [
				"SFBAudioEngine",
			])
	],
	cLanguageStandard: .c11,
	cxxLanguageStandard: .cxx17
)