public protocol ArgumentExpressible {
    static func fromArgument(_ value: String) throws -> Self
}

extension String: ArgumentExpressible {
    public static func fromArgument(_ value: String) -> String {
        return value
    }
}

extension Int: ArgumentExpressible {
    public static func fromArgument(_ value: String) throws -> Int {
        guard let parsedValue = Int(value, radix: 10) else {
            throw ParseError.InstantiationError
        }

        return parsedValue
    }
}

