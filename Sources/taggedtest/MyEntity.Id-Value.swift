//
// Created by Daniel Ramteke on 8/27/19.
//

import Foundation
import SQLite
import Tagged

extension Tagged: Value, Expressible where Tagged.RawValue == Int, Tag == MyEntity {
  public static func fromDatatypeValue(_ datatypeValue: Int) -> MyEntity.Id {
    return MyEntity.Id(rawValue: datatypeValue)
  }

  public static var declaredDatatype: String {
    return Int.declaredDatatype
  }
  public typealias DataType = Int
  public typealias ValueType = MyEntity.Id
  public var datatypeValue: Int {
    return self.rawValue
  }
}
