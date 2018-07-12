//
//  ForestFireSimulation.swift
//  Grid-Simulations
//
//  Created by Matthew  Burzec on 7/4/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation

public class ForestFireSimulation: Simulation {
    var newGrid: [[Character?]] = []
    public override func setup() {
        grid = [[Character?]](repeating: [Character?](repeating: nil, count: 10), count: 10)
        for x in 0..<8 {
            for y in 0..<10 {
                if randomZeroToOne() < 0.5 {
                    grid[x][y] = "🌲"
                    }
                }
            }
        }
}
    
    
    public override func update() {
        
        newGrid = grid
        
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                let tile = grid[x][y]
                if tile == nil {
                    if randomZeroToOne() < 0.03 {
                        newGrid[x][y] = "🌲"
                    }
                    else if tile == "🌲" {
                        let neighborCords = getNeighborPositions(x: x, y: y)
                        for neighborCoord in neighborCords {
                            let neighbor = grid[neighborCoord.x][neighborCoord.y]
                            if neighbor == "🔥" {
                                if randomZeroToOne() < 0.01 {
                                    newGrid[x][y] = "🔥"
                            }
                            else if tile == "🔥" {
                                newGrid[x][y] = nil
                            }
                        }
                    }
                }
            }
        }
        
        grid = newGrid
        }
    }
    
   
    func isLegalPosition(x: Int, y: Int) -> Bool {
        if x >= 0 && x < grid.count && y >= 0 && y < grid[0].count {
            return true
        } else {
            return false
        }
    }
    
    func getNeighborPositions(x originX: Int, y originY: Int) -> [(x: Int, y: Int)] {
        var neighbors: [(x: Int, y: Int)] = []
        for x in (originX - 1)...(originX + 1) {
            for y in (originY - 1)...(originY + 1) {
                if isLegalPosition(x: x, y: y) {
                    if !(x == originX && y == originY) {
                        neighbors.append((x, y))
                    }
                }
            }
        }
        return neighbors
    }
    
    func thunderboltAndLightning() {
        
    }
    
    
    func aTinyForest() {
        newGrid = grid
        
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                let tile = grid[x][y]
                if tile == nil {
                    if randomZeroToOne() < 0.01 {
                        newGrid[x][y] = "🌲"
                    }
                    else if tile == "🌲" {
                        let neighborCords = getNeighborPositions(x: x, y: y)
                        for neighborCoord in neighborCords {
                            let neighbor = grid[neighborCoord.x][neighborCoord.y]
                            if neighbor == "🔥" {
                                newGrid[x][y] = "🔥"
                            }
                            else if tile == "🔥" {
                                newGrid[x][y] = nil
                            }
                        }
                    }
                }
            }
        }
        
        grid = newGrid
    }
    
    func noMercy() {
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                let tile = grid[x][y]
                if tile == nil {
                    if randomZeroToOne() < 0.01 {
                        newGrid[x][y] = "🌲"
                    }
                    else if tile == "🌲" {
                        let neighborCords = getNeighborPositions(x: x, y: y)
                        for neighborCoord in neighborCords {
                            let neighbor = grid[neighborCoord.x][neighborCoord.y]
                            if neighbor == "✄" {
                                if randomZeroToOne() < 0.01 {
                                    newGrid[x][y] = "🔥"
                                }
                                else if tile == "🔥" {
                                    newGrid[x][y] = nil
                                }
                            }
                        }
                    }
                }
            }
        }
        
        func jerkTrees() {
            var newGrid: [[Character?]] = []
                grid = [[Character?]](repeating: [Character?](repeating: nil, count: 10), count: 10)
                for x in 0..<8 {
                    for y in 0..<10 {
                        if randomZeroToOne() < 0.05 {
                            grid[x][y] = "🌱"
                            grid[x][y] = "🌳"
                        }
                    }
                }
                for x in 0..<grid.count {
                    for y in 0..<grid[x].count {
                        let tile = grid[x][y]
                        if tile == nil {
                            if randomZeroToOne() >= 0.02 {
                                newGrid[x][y] = "🌳"
                            }
                            else if randomZeroToOne() < 0.02 {
                                newGrid[x][y] = "🌱"
                            }
                            else if tile == "🌳" {
                                let neighborCords = getNeighborPositions(x: x, y: y)
                                for neighborCoord in neighborCords {
                                    let neighbor = grid[neighborCoord.x][neighborCoord.y]
                                    if neighbor == "✄" {
                                        if randomZeroToOne() < 0.01 {
                                            newGrid[x][y] = nil
                                            if neighbor == "🌱"{
                                                if randomZeroToOne() < 0.01 {
                                                    newGrid[x][y] = nil
                                                }
                                             }
                                    else if tile == "🌱" {
                                        let neighborCords = getNeighborPositions(x: x, y: y)
                                        for neighborCoord in neighborCords {
                                            let neighbor = grid[neighborCoord.x][neighborCoord.y]
                                            if neighbor == "🔥" && "🌱" {
                                                    newGrid[x][y] = "🔥"
                                                if tile == "🌱" {
                                                    newGrid[x][y] = "🔥"
                                                }
                                                else if tile == "🔥" {
                                                    newGrid[x][y] == nil
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

