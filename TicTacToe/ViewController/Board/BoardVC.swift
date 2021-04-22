//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lucas on 20/04/2021.
//

import UIKit

class BoardVC: UIViewController {

    // MARK: - Privates
    @IBOutlet private weak var playAgainButton: UIButton!
    @IBOutlet private weak var playerOneLabel: UILabel!
    @IBOutlet private weak var playerTwoLabel: UILabel!
    @IBOutlet weak var gameContainerView: UIView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

// MARK: - SetupView
private extension BoardVC {
    func setupUI() {
        playerOneLabel.text = "boardvc_first_player_label".localized()
        playerTwoLabel.text = "boardvc_second_player_label".localized()
        playAgainButton.setTitle("boardvc_play_again_button".localized(), for: .normal)
    }
}

