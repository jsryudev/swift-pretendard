import CoreText
import Foundation

public enum Pretendard {}

extension Pretendard {
    public enum Weight: String, CaseIterable {
        case regular
        case medium
        case semibold
        case bold
        
        public var fontName: String {
            switch self {
            case .regular:
                return "PretendardJP-Regular"
                
            case .medium:
                return "PretendardJP-Medium"
                
            case .semibold:
                return "PretendardJP-SemiBold"
                
            case .bold:
                return "PretendardJP-Bold"
            }
        }
    }
}

extension Pretendard {
    @discardableResult
    public static func registFonts() throws -> Bool {
        try Weight.allCases.allSatisfy {
            try Pretendard.Weight.registFont(
                bundle: .module,
                fontName: $0.fontName,
                fontExtension: "otf"
            )
        }
    }
}

extension Pretendard.Weight {
    @discardableResult
    fileprivate static func registFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) throws -> Bool {
        guard
            let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let _ = CGFont(fontDataProvider)
        else {
            fatalError("Couldn't create font from filename: \(fontName).\(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        
        let isSuccess = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        
        if let error = error?.takeUnretainedValue() {
            throw error
        }
        
        return isSuccess
    }
}
