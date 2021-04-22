import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(with values: CVarArg...) -> String {
        let localized = self.localized()
        return String(format: localized, arguments: values)
    }
}

