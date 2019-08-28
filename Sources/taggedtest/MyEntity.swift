import Tagged

public struct MyEntity {
  public typealias Id = Tagged<MyEntity, Int>
  public let id: Id
}

