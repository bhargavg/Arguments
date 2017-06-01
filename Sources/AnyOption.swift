public struct AnyOption<U> {
    let isOption: (String) -> Bool
    let parse: (String, U) throws -> ()

    init<T>(_ option: Option<T, U>) where T: ArgumentExpressible {
        isOption = option.isOption
        parse = option.parse
    }

    public func isOption(_ option: String) -> Bool {
        return isOption(option)
    }

    public func parse(_ value: String, into bag: U) throws {
        try parse(value, bag)
    }
}


public protocol AnyOptionRepresentable {
    associatedtype OptionsBoxType
    func toAnyOption() -> AnyOption<OptionsBoxType>
}

