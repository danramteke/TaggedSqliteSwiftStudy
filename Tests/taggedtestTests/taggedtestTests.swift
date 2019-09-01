import XCTest
import SQLite
import Tagged
@testable import taggedtest

final class taggedtestTests: XCTestCase {
  func testExample() {
    let connection = try! Connection(.inMemory)

    try! MyEntity.SQLite.createTable(connection: connection)
    let myEntity = MyEntity(id: 23)
    try! MyEntity.SQLite.insert(myEntity, into: connection)

    let query = MyEntity.SQLite.table
        .select(MyEntity.SQLite.id)
        .where(MyEntity.SQLite.id == 23)
    let firstRow = try! connection.pluck(query)!
    print(firstRow)
//
        let intFromDatabase: Int = firstRow[Expression<Int>("id")]
//    let intFromDatabase: Int = try! firstRow.get(Expression<Int>("id"))
//    let myEntityIdFromDatabase: MyEntity.Id = MyEntity.Id(rawValue: intFromDatabase)

    XCTAssertEqual(intFromDatabase, myEntity.id.rawValue)
  }

  static var allTests = [
    ("testExample", testExample),
  ]
}
