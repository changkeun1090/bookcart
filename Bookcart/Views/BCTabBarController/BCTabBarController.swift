//
//  BCTabBarController.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/5/24.
//

import UIKit

class BCTabBarController: UITabBarController {

    private let topBorderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        setupTopBorder()
        viewControllers = [createBookVC(), createTagNC(), createSearchVC(), createOptionVC()]
    }
    
    func setupTabbar() {
        self.tabBar.backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .black
    }
 
    private func createBookVC() -> UINavigationController {
        let bookVC = BookVC()
        bookVC.tabBarItem = UITabBarItem(title: "책", image: UIImage(systemName: "books.vertical.fill"), tag: 0)
        return UINavigationController(rootViewController: bookVC)
    }
    
    private func createTagNC() -> UINavigationController {
        let tagVC = TagVC()
        tagVC.tabBarItem = UITabBarItem(title: "태그", image: UIImage(systemName: "tag.fill"), tag: 1)
        return UINavigationController(rootViewController: tagVC)
    }
    
    private func createSearchVC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "plus.app"), tag: 2)
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createOptionVC() -> UINavigationController {
        let optionVC = OptionVC()
        optionVC.tabBarItem = UITabBarItem(title: "더보기", image: UIImage(systemName: "ellipsis.circle"), tag: 3)
        return UINavigationController(rootViewController: optionVC)
    }
    
    private func setupTopBorder() {
        
        topBorderView.backgroundColor = UIColor.systemGray4
        topBorderView.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(topBorderView)

        NSLayoutConstraint.activate([
            topBorderView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            topBorderView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            topBorderView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            topBorderView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
