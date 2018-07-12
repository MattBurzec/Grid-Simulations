//
//  GameOfLifeSimulation.swift
//  Grid-Simulations
//
//  Created by Yujin Ariza on 3/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GameOfLifeSimulation: Simulation {

    public var liveChar: Character = "👾"
    
    public override func update() {
        for row in 0 ..< grid.count {
            for column in 0 ..< grid[0].count {
                let neighborCount = countNeighbors(grid: grid, column: column, row: row)
                let aliveForCurrentCell = getAlive(grid: grid, column: column, row: row)
                if aliveForCurrentCell == 1  {
                    if neighborCount < 2 {
                        print("Dies of underpopulation")
                        grid[column][row] = nil
                    }
                    else if neighborCount == 2 || neighborCount == 3 {
                        print("Has 2 or 3 neighbors nearby")
                    }
                    else if neighborCount > 3 {
                        print("Overpopulation death")
                        grid[column][row] = nil
                    }
                }
                else {
                    if neighborCount == 3 {
                        print("Becomes alive cell")
                        grid[column][row] = liveChar
                    }
                }
            }
        }
    }

     func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        var count: Int = 0
        for i in -1...1 {
            for j in -1...1 {
                if j == 0 && i == 0 {
                }
                else {
                    let alive = getAlive(grid: grid, column: x + i, row: y + j)
                    count += alive
                }
            }
        }
        
        return count
    }
    
    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int  {
        if x < grid.count && x >= 0  && y < grid[0].count && y >= 0 {
            if grid[x][y] == nil {
                return 0
            }
            else {
                return 1
            }
        }
        else {
            return 0
        }
    }

}
