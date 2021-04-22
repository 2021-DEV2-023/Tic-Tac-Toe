//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Lucas on 20/04/2021.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    private var viewModel = TicTacToeBoardVM()
    
    override func setUp() {
        // This method is called before the invocation of each test method in the class.
        viewModel = TicTacToeBoardVM()
    }

    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
    }

    func testDidPlayAppend() {
        viewModel.didPlay(at: 1)
        XCTAssert(viewModel.getBoard(of: .cross).contains(1))
    }
    
    func testDidPlayNextTurn() {
        viewModel.didPlay(at: 1)
        XCTAssert(viewModel.getCurrentPlayer() == .circle)
    }
    
    func testDidPlayNextTurn2() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 3)
        XCTAssert(viewModel.getCurrentPlayer() == .cross)
    }
    
    func testDidPlayWin() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 4)
        viewModel.didPlay(at: 2)
        viewModel.didPlay(at: 5)
        viewModel.didPlay(at: 3)
        XCTAssert(viewModel.getState() == .win)
    }
    
    func testDidPlayDraw() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 2)
        viewModel.didPlay(at: 5)
        viewModel.didPlay(at: 3)
        viewModel.didPlay(at: 6)
        viewModel.didPlay(at: 4)
        viewModel.didPlay(at: 7)
        viewModel.didPlay(at: 9)
        viewModel.didPlay(at: 8)
        XCTAssert(viewModel.getState() == .draw)
    }

}
