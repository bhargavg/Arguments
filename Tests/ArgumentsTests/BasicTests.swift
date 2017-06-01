import XCTest
@testable import Arguments

final class BasicTests: XCTestCase {
    func testStringParsing() {
        let stringOption = Option<String, Bag>(
            name: "--string",
            shortName: "-s",
            description: "This is a string option",
            setter: {
                $1.stringOption = $0
            }
        )

        let intOption = Option<Int, Bag>(
            name: "--int",
            shortName: "-i",
            description: "This is an int option",
            setter: {
                $1.intOption = $0
            }
        )

        let parser = ArgumentParser<Bag>(options: [
            stringOption.toAnyOption(),
            intOption.toAnyOption()
        ])


        let bag = Bag()
        try! parser.parse([
            "--string", "String Option Value",
            "--int", "5"
        ], into: bag)

        XCTAssertEqual(bag.stringOption, "String Option Value")
        XCTAssertEqual(bag.intOption, 5)
    }

    static var allTests = [
        ("testStringParsing", testStringParsing),
    ]
}

class Bag {
    var stringOption: String?
    var intOption: Int?
}

