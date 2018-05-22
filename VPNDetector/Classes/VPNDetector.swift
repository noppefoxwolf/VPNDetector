//
//  VPNDetector.swift
//  VPNDetector
//
//  Created by Tomoya Hirano on 2018/05/23.
//

import Foundation

public class VPNDetector {
  public init() {}
  
  public var isRunning: Bool {
    guard let interfaces = interfaces else { return false }
    return interfaces.keys.contains(where: { $0.contains("tun") })
  }
  
  internal var interfaces: [String : Any]? {
    guard let settings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() as? [String : Any] else { return nil }
    return settings["__SCOPED__"] as? [String : Any]
  }
}
