//
//  Car.swift
//  lesson22
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import Foundation

enum CarWarnings: String {
    case maxSpeedLimit = "max speed reached"
    case wrongSpeed = "speed must be greater than 0 km/h"
}

class Car {
    private let engine: Engine
    private let model: String
    private(set) var numberOfWheels = 4
    private(set) var warning: CarWarnings?

    init(engine: Engine, model: String) {
        self.engine = engine
        self.model = model
    }

    func ride(with speed: Int) {
        engine.ignition()

        if speed < 0 {
            warning = .wrongSpeed
        } else if speed > 200 {
            warning = .maxSpeedLimit
            engine.setEngineSpeed(200)
        } else {
            engine.setEngineSpeed(speed)
        }
    }
}
