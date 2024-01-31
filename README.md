# ColorToNameSwift
 
 A Swift package which helps to map a hex color code to a color name, based on [Zeplin's color palette dataset](https://github.com/zeplin/zeplin-palette).
This package is a recreation of https://github.com/stanleyfok/color-to-name.

## Usage

#### public func getNames(for hex: String) throws -> ColorInfo
Find the nearest specific and generic colors for a given hex code string.

ColorHelper.findClosestColor('#123456');
// return { color: '#1f3b4d', name: 'dark blue grey' }

```
let sut = ColorClassifier()

let result = try sut.getNames(for: "FE5F55")

XCTAssertEqual(result.originalHex, "FE5F55")
XCTAssertEqual(result.genericName.name, "coral")
XCTAssertEqual(result.genericName.hex, "FF7F50")
XCTAssertEqual(result.specificName.name, "grapefruit")
XCTAssertEqual(result.specificName.hex, "fd5956")
```
