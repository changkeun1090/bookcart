//
//  SearchVC.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/5/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let searchTextField = BCTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureTextField()
        getBooks()
    }
    
    private func configureTextField() {
        
        view.addSubview(searchTextField)
        
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func getBooks() {
        let bookService = BookSearchService()
        
        guard let keyword = searchTextField.text else { return }
        bookService.searchBook(query: keyword) { result in
            switch result {
            case .success(let data):                
                print("Data received: \(data)")
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getBooks()
        return true
    }
}
