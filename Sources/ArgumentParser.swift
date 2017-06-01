public final class ArgumentParser<Bag> {
    let options: [AnyOption<Bag>]
    init(options: [AnyOption<Bag>]) {
        self.options = options
    }

    func parse(_ args: [String], into bag: Bag) throws {
        guard !args.isEmpty else { return }

        var index = 0;
        var values = Array<String>()

        while(index < args.count) {
            let arg = args[index];

            let mayBeOption = options.first(where: { $0.isOption(arg) })

            guard let option = mayBeOption else {
                values.append(arg)
                index += 1;
                continue;
            }

            guard index < args.count - 1 else {
                throw ParseError.NoValueFound
            }

            try option.parse(args[index + 1], bag)

            index += 1;
        }
    }
}
