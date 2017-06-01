public struct Option<T, U>: AnyOptionRepresentable where T: ArgumentExpressible {
    let name: String?
    let shortName: String?
    let description: String?
    let setter: (T, U) -> ()

    public func isOption(_ option: String) -> Bool {
        return name == option || shortName == option
    }

    public func parse(_ value: String, into bag: U) throws {
        setter(try T.fromArgument(value), bag)
    }

    public func isFlag() -> Bool {
        return T.self == Bool.self
    }

    public func toAnyOption() -> AnyOption<U> {
        return AnyOption(self)
    }
}

