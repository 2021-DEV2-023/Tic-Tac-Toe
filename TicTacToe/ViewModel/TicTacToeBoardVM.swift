import Foundation

enum PlayersType {
    case cross
    case circle
}

enum GameState {
    case playing
    case draw
    case win
}

class TicTacToeBoardVM {
    
    // MARK: - Private
    private var board: [PlayersType: [Int]] = [:]
    private var currentPlayer: PlayersType = .cross
    private var state: GameState = .playing
    
    init() {
        board[.cross] = []
        board[.circle] = []
    }
    
    // MARK: - Private Functions
    private func nextTurn() {
        currentPlayer = currentPlayer == .cross ? .circle : .cross
    }
    
    private func boardIsFull() -> Bool {
        let count = (board[.cross]?.count ?? 0) + (board[.circle]?.count ?? 0)
        let isFull = count == Constants.numberOfCell
        state = isFull ? .draw : state
        return isFull
    }
    
    private func boardIsWin() -> Bool {
        var isWin: Bool = false
        Constants.solutions.forEach { (solution) in
            var isWinArray: [Bool] = []
            solution.forEach { (value) in
                isWinArray.append(board[currentPlayer]?.contains(value) ?? false)
            }
            if !isWinArray.contains(false) {
                state = .win
                isWin = true
            }
        }
        return isWin
    }
    
    // MARK: - Publics Functions
    func getCurrentPlayer() -> PlayersType {
        return currentPlayer
    }
    
    func didPlay(at index: Int, _ didFinish: ((GameState) -> Void)? = nil) {
        board[currentPlayer]?.append(index)
        boardIsWin() || boardIsFull() ? didFinish?(state) : nextTurn()
    }
    
    func getBoard(of player: PlayersType) -> [Int] {
        return board[player] ?? []
    }
    
    func getState() -> GameState {
        return state
    }
}
