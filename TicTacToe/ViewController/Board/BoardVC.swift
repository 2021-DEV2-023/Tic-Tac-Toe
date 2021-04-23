//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lucas on 20/04/2021.
//

import UIKit

class BoardVC: UIViewController {

    // MARK: - Private parameters
    private var boardVM: TicTacToeBoardVM = TicTacToeBoardVM()
    
    // MARK: - Privates IBOutlet
    @IBOutlet private weak var playAgainButton: UIButton!
    @IBOutlet private weak var playerOneLabel: UILabel!
    @IBOutlet private weak var playerTwoLabel: UILabel!
    @IBOutlet private weak var gameContainerView: UIView!
    @IBOutlet private weak var gameContainer: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func boardButtonHandler(_ sender: BoardButton) {
        sender.setState(playerImage: boardVM.getCurrentPlayer().getImage())
        boardVM.didPlay(at: sender.tag, { state in
            
        })
        self.setupGame(state: boardVM.getState())
    }
    
    @IBAction func playAgainHandler(_ sender: Any) {
        playAgainButton.isEnabled = false
        boardVM = TicTacToeBoardVM()
        self.gameContainer.backgroundColor = .darkGray
        for index in 1...Constants.numberOfCell {
            if let button = view.viewWithTag(index) as? BoardButton {
                button.reset()
            }
        }
        setTitle(title: "boardvc_title_current_player", player: boardVM.getCurrentPlayer())
    }
    
}

// MARK: - SetupView
private extension BoardVC {
    func setupUI() {
        playerOneLabel.text = "boardvc_first_player_label".localized()
        playerTwoLabel.text = "boardvc_second_player_label".localized()
        playAgainButton.setTitle("boardvc_play_again_button".localized(), for: .normal)
        playAgainButton.isEnabled = false
        setTitle(title: "boardvc_title_current_player", player: boardVM.getCurrentPlayer())
    }
    
    func setupGame(state: GameState) {
        switch state {
        case .win:
            self.gameContainer.backgroundColor = .green
            self.playAgainButton.isEnabled = true
            self.setTitle(title: "boardvc_title_win", player: boardVM.getCurrentPlayer())
            for index in 1...Constants.numberOfCell {
                if let button = view.viewWithTag(index) as? BoardButton {
                    button.isUserInteractionEnabled = false
                }
            }
        case .draw:
            self.gameContainer.backgroundColor = .orange
            self.playAgainButton.isEnabled = true
            print("boardvc_title_draw".localized())
            self.setTitle(title: "boardvc_title_draw", player: boardVM.getCurrentPlayer())
        case .playing:
            self.gameContainer.backgroundColor = .darkGray
            self.playAgainButton.isEnabled = false
            self.setTitle(title: "boardvc_title_current_player", player: boardVM.getCurrentPlayer())
        }
    }
    
    func setTitle(title: String, player: PlayersType) {
        switch player {
        case .cross:
            titleLabel.text = title.localized(with: "boardvc_first_player_label".localized())
        case .circle:
            titleLabel.text = title.localized(with: "boardvc_second_player_label".localized())
        }
    }
}

