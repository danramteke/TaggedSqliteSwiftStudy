//
// Created by Daniel Ramteke on 8/27/19.
//

import Foundation
import SQLite
import Tagged

extension Tagged: Value, Expressible where Tagged.RawValue == Int, Tag == MyEntity {
  public static func fromDatatypeValue(_ datatypeValue: Int) -> Int {
    return datatypeValue
  }

  public static var declaredDatatype: String {
    return Int.declaredDatatype
  }
  public typealias DataType = Tagged<MyEntity, Int>
  public typealias ValueType = Int
  public var datatypeValue: Int {
    return self.rawValue
  }
}
