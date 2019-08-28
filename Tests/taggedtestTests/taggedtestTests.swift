import XCTest
import SQLite
@testable import taggedtest

final class taggedtestTests: XCTestCase {
    func testExample() {
        let connection = try! Connection(.inMemory)

        try! MyEntity.SQLite.createTable(connection: connection)
        let myEntity = MyEntity(id: 23)
        try! MyEntity.SQLite.insert(myEntity, into: connection)

        let query = MyEntity.SQLite.table
            .select(MyEntity.SQLite.id)
            .where(MyEntity.SQLite.id == MyEntity.Id(23))
        let firstRow = try! connection.pluck(query)!
        let myEntityIdFromDatabase = firstRow[MyEntity.SQLite.id]
        XCTAssertEqual(myEntityIdFromDatabase, myEntity.id)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
