import XCTest

@testable import Pretendard

final class PretendardTests: XCTestCase {
    func testRegistFonts() throws {
        let isSucess = try Pretendard.registFonts()
        XCTAssertTrue(isSucess)
    }
}
