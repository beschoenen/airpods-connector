//
//  BluetoothProtocol.swift
//  AirPods Connector
//
//  Created by Kevin Richter on 15/07/2018.
//  Copyright © 2018 Kevin. All rights reserved.
//

import Foundation

protocol BluetoothConnectorListener {
    func connected() -> Void
    func disconnected() -> Void
}
