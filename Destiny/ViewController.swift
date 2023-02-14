//
//  ViewController.swift
//  Destiny
//
//  Created by Artur Imanbaev on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let stories = [Story(
        title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
        choice1: "I'll hop in. Thanks for the help!", choice1Destination: 2,
        choice2: "Better ask him if he's a murderer first.", choice2Destination: 1
    ),
    Story(
        title: "He nods slowly, unfazed by the question.",
        choice1: "At least he's honest. I'll climb in.", choice1Destination: 2,
        choice2: "Wait, I know how to change a tire.", choice2Destination: 3
    ),
    Story(
        title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
        choice1: "I love Elton John! Hand him the cassette tape.", choice1Destination: 5,
        choice2: "It's him or me! You take the knife and stab him.", choice2Destination: 4
    ),
    Story(
        title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
        choice1: "The", choice1Destination: 0,
        choice2: "End", choice2Destination: 0
    ),
    Story(
        title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
        choice1: "The", choice1Destination: 0,
        choice2: "End", choice2Destination: 0
    ),
    Story(
        title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
        choice1: "The", choice1Destination: 0,
        choice2: "End", choice2Destination: 0
    )
]
    let storyLabel: UILabel = {
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 27)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let firstButton: UIButton = {
        $0.layer.cornerRadius = 30
        $0.setTitle("", for: .normal)
        $0.backgroundColor = UIColor.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tag = 1
        return $0
    }(UIButton())
    let secondButton: UIButton = {
        $0.layer.cornerRadius = 30
        $0.setTitle("", for: .normal)
        $0.backgroundColor = UIColor.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tag = 2
        return $0
    }(UIButton())
    var storyNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(ciColor: .magenta)
        storyLabel.text = stories[storyNumber].title
        firstButton.setTitle(stories[storyNumber].choice1, for: .normal)
        secondButton.setTitle(stories[storyNumber].choice2, for: .normal)
        setupConstraints()
        firstButton.addTarget(self, action: #selector(checkChoice), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(checkChoice), for: .touchUpInside)

    }
    @objc func checkChoice(_ sender: UIButton){
        var story = stories[storyNumber]
        var dest = 0
        switch sender.tag{
        case 1:
            dest = story.choice1Destination
            break
        case 2:
            dest = story.choice2Destination
            break
        default:
            break
        }
        self.storyNumber = dest
        story = stories[storyNumber]
        updateUI(with: story)
    }
    func updateUI(with story: Story){
        storyLabel.text = story.title
        firstButton.setTitle(story.choice1, for: .normal)
        secondButton.setTitle(story.choice2, for: .normal)

    }

}
extension ViewController{
    func setupConstraints(){
        view.addSubview(storyLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: storyLabel.bottomAnchor, multiplier: 40),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: storyLabel.trailingAnchor, multiplier: 1),
            storyLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.heightAnchor.constraint(equalToConstant: 100),
            firstButton.widthAnchor.constraint(equalToConstant: 330),
            secondButton.topAnchor.constraint(equalToSystemSpacingBelow: firstButton.bottomAnchor, multiplier: 2),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 100),
            secondButton.widthAnchor.constraint(equalToConstant: 330),
        ])
    }
}

