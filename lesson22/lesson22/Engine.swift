//
//  Engine.swift
//  lesson22
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import Foundation

enum EngineState {
    case off
    case ignitionOn
    case ride
}

class Engine {
    private(set) var cylindersCount: Int
    private(set) var engineSpeed: Int = 0
    private(set) var state: EngineState = .off

    init(cylindersCount: Int) {
        self.cylindersCount = cylindersCount
    }

    func ignition() {
        state = .ignitionOn
    }

    func setEngineSpeed(_ speed: Int) {
        state = .ride
        engineSpeed = speed
    }
}
