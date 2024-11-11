//
//  SearchVC.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/5/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let searchTextField = BCTextField()
    let tableView = UITableView()
    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTextField()
        configureTableView()
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
    
    private func configureTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseId)
        tableView.rowHeight = 80
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
            
    }
    
    func getBooks() {
        let bookService = BookSearchService()
        
        guard let keyword = searchTextField.text else { return }
        bookService.searchBook(query: keyword) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                self.books = data
//                print("Data received: \(self.books)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
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

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId) as! SearchCell
        let book = books[indexPath.row]        
        cell.set(book: book)
        return cell
    }
}
