//
//  Array+OneAndOnly.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
