//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Tugay Emre Yucedag on 7.03.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}
