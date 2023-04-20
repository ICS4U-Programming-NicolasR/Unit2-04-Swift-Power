// RecPow.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-04-20
//  Version 1.1
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Calculates any number to a positive power

import Foundation

// Define a function to find any number to any power
func recPow(_ base: Int, _ exp: Int) -> Int {
    if exp == 0 {
        return 1
    }
    return recPow(base, exp - 1) * base
}

// Define input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputString = try? String(contentsOfFile: inputFilePath) {
        // Separate the input into lines
        let inputLines = inputString.components(separatedBy: .newlines)

        // Calculate any power for each line and append to answers array
        var answers = [String]()
        for line in inputLines {
            let lineNumbers = line.components(separatedBy: " ").compactMap{Int($0)}
            let result = recPow(lineNumbers[0], lineNumbers[1])
            let resultString = "\(lineNumbers[0]) ^ \(lineNumbers[1]) = \(result)"
            answers.append(resultString)
        }

    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("Error reading input file.")
}
