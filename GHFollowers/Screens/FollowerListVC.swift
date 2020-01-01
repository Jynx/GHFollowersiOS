//
//  FollowerListVCViewController.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/4/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
  // hashable by default
  enum Section {
    case main
  }

  var followers: [Follower] = []
  var filteredFollowers: [Follower] = []
  var page = 1
  var hasMoreFollowers = true
  var isSearching = false

  var userName: String!
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>! // uses Hashes to diff collections

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureSearchController()
    configureCollectionView()
    getFollowers(username: userName, page: page)
    configureDataSource()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
    view.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.backgroundColor = .systemBackground
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
  }

  func configureSearchController() {
    let searchController = UISearchController()
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    searchController.searchBar.placeholder = "search for a username"
    navigationItem.searchController = searchController
  }

  func getFollowers(username: String, page: Int) {
    showLoadingView()
    // add weak reference to self "capture list"
    NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
      // provides remedy to a ton of option selfs. self?.followers etc.
      guard let self = self else { return }
      self.dismissLoadingView()

      switch result {
      case .success(let followers):
        if followers.count < 100 { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)

        if self.followers.isEmpty {
          let message = "This user doesn't have any followers. Go follow them 😁."
          DispatchQueue.main.async {
            self.showEmptyStateView(with: message, in: self.view)
            return
          }
        }

        self.updateData(on: self.followers)

      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "bad stuff", message: error.rawValue, buttonTitle: "ok")
      }
    }

    // old way pre swift 5
    //      NetworkManager.shared.getFollowers(for: userName, page: 1) { (followers, errorMessage) in
    //        guard let followers = followers else {
    //          self.presentGFAlertOnMainThread(title: "bad stuff", message: errorMessage!.rawValue, buttonTitle: "ok")
    //          return
    //        }
    //
    //        print("followers.count = \(followers.count)")
    //        print(followers)
    //      }
    //    }
  }

  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
      cell.set(follower: follower)
      return cell
    })
  }

  func updateData(on followers: [Follower]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) } // put on foreground thread
  }
}

extension FollowerListVC: UICollectionViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY = scrollView.contentOffset.y // how far we've scrolled down
    let contentHeight = scrollView.contentSize.height // entire scroll view height
    let height = scrollView.frame.size.height // height of what's in view

    if offsetY > contentHeight - height {
      guard hasMoreFollowers else { return }
      page += 1
      getFollowers(username: userName, page: page)
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let follower = isSearching ? filteredFollowers[indexPath.item] : followers[indexPath.item]
    let destVC = UserInfoVC()
    destVC.username = follower.login
    let navController = UINavigationController(rootViewController: destVC)
    
    present(navController, animated: true)
  }
}

extension FollowerListVC: UISearchResultsUpdating, UISearchBarDelegate {
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
    isSearching = true

    filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }

    updateData(on: filteredFollowers)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    isSearching = false
    updateData(on: followers) // use original array of followers, not filtered
  }
}
