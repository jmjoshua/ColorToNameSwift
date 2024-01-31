# ColorToNameSwift
 
 A Swift package which helps to map a hex color code to a color name, based on [Zeplin's color palette dataset](https://github.com/zeplin/zeplin-palette).
This package is a recreation of https://github.com/stanleyfok/color-to-name.

## Usage

### getNames
Find the nearest specific and generic colors for a given hex code string.

*Signature*
```
public func getNames(for hex: String) throws -> ColorInfo
```

*Returns*
```
Printing description of result:
▿ ColorInfo
  - originalHex : "FE5F55"
  ▿ genericName : NameInfo
    - name : "coral"
    - hex : "FF7F50"
  ▿ specificName : NameInfo
    - name : "grapefruit"
    - hex : "fd5956"
```

*Test example*

```
let sut = ColorClassifier()

let result = try sut.getNames(for: "FE5F55")

XCTAssertEqual(result.originalHex, "FE5F55")
XCTAssertEqual(result.genericName.name, "coral")
XCTAssertEqual(result.genericName.hex, "FF7F50")
XCTAssertEqual(result.specificName.name, "grapefruit")
XCTAssertEqual(result.specificName.hex, "fd5956")
```

## Generic Colors (32)
```
    "FF0000": "red",
    "FF7F50": "coral",
    "FFD700": "gold",
    "FFA500": "orange",
    "F0E68C": "khaki",
    "FFFF00": "yellow",
    "00FF00": "lime",
    "008000": "green",
    "808000": "olive",
    "00FFFF": "cyan",
    "00FFFF": "aqua",
    "40E0D0": "turquoise",
    "008080": "teal",
    "0000FF": "blue",
    "000080": "navy",
    "E6E6FA": "lavender",
    "DDA0DD": "plum",
    "EE82EE": "violet",
    "FF00FF": "fuchsia",
    "FF00FF": "magenta",
    "800080": "purple",
    "4B0082": "indigo",
    "FFC0CB": "pink",
    "FFFFFF": "white",
    "F5F5DC": "beige",
    "C0C0C0": "silver",
    "808080": "gray",
    "000000": "black",
    "D2B48C": "tan",
    "D2691E": "chocolate",
    "A52A2A": "brown",
    "800000": "maroon"
```

## Specific Colors (949)
```
    "000000": "black",
    "000133": "very dark blue",
    "00022e": "dark navy blue",
    "00035b": "dark blue",
    "000435": "dark navy",
    "001146": "navy blue",
    "002d04": "dark forest green",
    "004577": "prussian blue",
    "005249": "dark blue green",
    "00555a": "deep teal",
    "005f6a": "petrol",
    "009337": "kelley green",
    "00fbb0": "greenish turquoise",
    "00ffff": "cyan",
    "010fcc": "true blue",
    "01153e": "navy",
    "01386a": "marine blue",
    "014182": "darkish blue",
    "014600": "racing green",
    "014d4e": "dark teal",
    "015482": "deep sea blue",
    "0165fc": "bright blue",
    "016795": "peacock blue",
    "017371": "dark aquamarine",
    "017374": "deep turquoise",
    "017a79": "bluegreen",
    "017b92": "ocean",
    "01889f": "teal blue",
    "019529": "irish green",
    "01a049": "emerald",
    "01b44c": "shamrock",
    "01c08d": "green/blue",
    "01f9c6": "bright teal",
    "01ff07": "bright green",
    "020035": "midnight blue",
    "0203e2": "pure blue",
    "02066f": "dark royal blue",
    "021bf9": "rich blue",
    "02590f": "deep green",
    "028f1e": "emerald green",
    "029386": "teal",
    "02ab2e": "kelly green",
    "02c14d": "shamrock green",
    "02ccfe": "bright sky blue",
    "02d8e9": "aqua blue",
    "03012d": "midnight",
    "030764": "darkblue",
    "030aa7": "cobalt blue",
    "033500": "dark green",
    "0339f8": "vibrant blue",
    "0343df": "blue",
    "03719c": "ocean blue",
    "040273": "deep blue",
    "040348": "night blue",
    "042e60": "marine",
    "044a05": "bottle green",
    "045c5a": "dark turquoise",
    "047495": "sea blue",
    "048243": "jungle green",
    "0485d1": "cerulean",
    "04d8b2": "aquamarine",
    "04d9ff": "neon blue",
    "04f489": "turquoise green",
    "0504aa": "royal blue",
    "05472a": "evergreen",
    "05480d": "british racing green",
    "054907": "darkgreen",
    "05696b": "dark aqua",
    "056eee": "cerulean blue",
    "05ffa6": "bright sea green",
    "062e03": "very dark green",
    "06470c": "forest green",
    "0652ff": "electric blue",
    "069af3": "azure",
    "06b1c4": "turquoise blue",
    "06b48b": "green blue",
    "06c2ac": "turquoise",
    "070d0d": "almost black",
    "0804f9": "primary blue",
    "08787f": "deep aqua",
    "089404": "true green",
    "08ff08": "fluorescent green",
    "0a437a": "twilight blue",
    "0a481e": "pine green",
    "0a5f38": "spruce",
    "0a888a": "dark cyan",
    "0add08": "vibrant green",
    "0aff02": "fluro green",
    "0b4008": "hunter green",
    "0b5509": "forest",
    "0b8b87": "greenish blue",
    "0bf77d": "minty green",
    "0bf9ea": "bright aqua",
    "0c06f7": "strong blue",
    "0c1793": "royal",
    "0cb577": "green teal",
    "0cdc73": "tealish green",
    "0cff0c": "neon green",
...
```
