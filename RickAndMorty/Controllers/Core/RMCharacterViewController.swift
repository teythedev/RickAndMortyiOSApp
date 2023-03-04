//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Tugay Emre Yucedag on 3.03.2023.
//

import UIKit

/// Controller to show and search for characters
class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Page results count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    


}
