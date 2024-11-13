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
    let bottomBorderView = UIView() // Added bottom border view

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTextField()
        configureTableView()
        configureBottomBorder()
        
        tableView.separatorColor = UIColor { traitCollection in
                return traitCollection.userInterfaceStyle == .dark ? UIColor.white.withAlphaComponent(0.7) : UIColor.black.withAlphaComponent(0.2)
            }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchTextField.becomeFirstResponder()
    }
    
    private func configureTextField() {
        
        view.addSubview(searchTextField)
        
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureBottomBorder() {
        
        view.addSubview(bottomBorderView)
        bottomBorderView.backgroundColor = .quaternaryLabel
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomBorderView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0),
            bottomBorderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            bottomBorderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            bottomBorderView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        bottomBorderView.isHidden = true
    }
    
    private func configureTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseId)
        tableView.rowHeight = 90
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
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
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.toggleBottomBorderVisibility()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func dismissKeyboard() {     
        view.endEditing(true)
    }
    
    private func toggleBottomBorderVisibility() {
        if books.isEmpty {
            bottomBorderView.isHidden = true // Hide the border when there are no books
        } else {
            bottomBorderView.isHidden = false // Show the border when there are books
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getBooks()
        return true
    }
    
    // 검색어 모두 지우면 List를 비운다.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            books = []
        }
        tableView.reloadData()
        toggleBottomBorderVisibility()
         
        return true
    }

    // Clear 버튼을 누르면 List를 비운다.
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        books = []
        tableView.reloadData()
        toggleBottomBorderVisibility()
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

