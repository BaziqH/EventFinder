//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadHeaderTVuCell(indexPath)
        }
        else if indexPath.section == 1{
            return loadSearchTVuCell(indexPath)
        }
        else if indexPath.section == 2{
            return loadSpecialEventsTVuCell(indexPath)
        }
        else if indexPath.section == 3{
            return loadFriendEventsTVuCell(indexPath)
        }
        return UITableViewCell()
    }
}
//MARK: - LOAD CELLS
extension HomeVC{
    func loadHeaderTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "HeaderTVuCell", for: indexPath) as? HeaderTVuCell else {
            return HeaderTVuCell()
        }
        
        cell.onListTap = { [weak self] in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc =  storyboard.instantiateViewController(withIdentifier: "FriendsListVC") as? FriendsListVC {
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
      
        return cell
    }
    func loadSearchTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "SearchTVuCell", for: indexPath) as? SearchTVuCell else {
            return SearchTVuCell()
        }
        return cell
    }
    func loadSpecialEventsTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "SpecialEventsTVuCell", for: indexPath) as? SpecialEventsTVuCell else {
            return SpecialEventsTVuCell()
        }
        cell.updateCollectionHeight()
        cell.seeMoreTap = { [weak self] in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "EventsListVC") as? EventsListVC {
                vc.navBarTitle = "Special Events"
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return cell
    }
    func loadFriendEventsTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "FriendEventsTVuCell", for: indexPath) as? FriendEventsTVuCell else {
            return FriendEventsTVuCell()
        }
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension HomeVC{
    
    func setupTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let headerNib = UINib(nibName: "HeaderTVuCell", bundle: nil)
        homeTableView.register(headerNib, forCellReuseIdentifier: "HeaderTVuCell")
        
        let searchNib = UINib(nibName: "SearchTVuCell", bundle: nil)
        homeTableView.register(searchNib, forCellReuseIdentifier: "SearchTVuCell")
        
        let eventsNib = UINib(nibName: "SpecialEventsTVuCell", bundle: nil)
        homeTableView.register(eventsNib, forCellReuseIdentifier: "SpecialEventsTVuCell")

        let friendsNib = UINib(nibName: "FriendEventsTVuCell", bundle: nil)
        homeTableView.register(friendsNib, forCellReuseIdentifier: "FriendEventsTVuCell")        
    }
}
