import XCTest
@testable import ColorToNameSwift

final class ColorToNameSwiftTests: XCTestCase {
    func test_FE5F55() throws {
        let sut = ColorClassifier()

        let result = try sut.getNames(for: "FE5F55")

        XCTAssertEqual(result.originalHex, "FE5F55")
        XCTAssertEqual(result.genericName.name, "coral")
        XCTAssertEqual(result.genericName.hex, "FF7F50")
        XCTAssertEqual(result.specificName.name, "grapefruit")
        XCTAssertEqual(result.specificName.hex, "fd5956")
    }

    func test_003844() throws {
        let sut = ColorClassifier()

        let result = try sut.getNames(for: "003844")

        XCTAssertEqual(result.originalHex, "003844")
        XCTAssertEqual(result.genericName.name, "navy")
        XCTAssertEqual(result.genericName.hex, "000080")
        XCTAssertEqual(result.specificName.name, "dark teal")
        XCTAssertEqual(result.specificName.hex, "014d4e")
    }

    func test_3E363F() throws {
        let sut = ColorClassifier()

        let result = try sut.getNames(for: "3E363F")

        XCTAssertEqual(result.originalHex, "3E363F")
        XCTAssertEqual(result.genericName.name, "indigo")
        XCTAssertEqual(result.genericName.hex, "4B0082")
        XCTAssertEqual(result.specificName.name, "dark gray")
        XCTAssertEqual(result.specificName.hex, "363737")
    }

    func test_FFE381() throws {
        let sut = ColorClassifier()

        let result = try sut.getNames(for: "FFE381")

        XCTAssertEqual(result.originalHex, "FFE381")
        XCTAssertEqual(result.genericName.name, "khaki")
        XCTAssertEqual(result.genericName.hex, "F0E68C")
        XCTAssertEqual(result.specificName.name, "wheat")
        XCTAssertEqual(result.specificName.hex, "fbdd7e")
    }
}
