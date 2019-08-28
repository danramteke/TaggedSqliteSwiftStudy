import SQLite

extension MyEntity {
  enum SQLite {
    public static let table = Table("MyEntities")
    public static let id = Expression<MyEntity.Id>("id")

    public static func createTable(connection: Connection) throws {
      try connection.run(MyEntity.SQLite.table.create() { t in
        t.column(MyEntity.SQLite.id, primaryKey: true)
      })
    }

    public static func insert(_ myEntity: MyEntity, into connection: Connection) throws {
      try! connection.run(MyEntity.SQLite.table.insert(
          MyEntity.SQLite.id <- myEntity.id
      ))
    }
  }
}

