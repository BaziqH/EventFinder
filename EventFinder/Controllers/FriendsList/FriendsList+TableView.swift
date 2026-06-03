/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
    
//MARK: - TABLE VIEW
extension FriendsListVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadFriendRowTVuCell(indexPath)
        }
        return UITableViewCell()
    }
}
//MARK: - LOAD CELLS
extension FriendsListVC{
    func loadFriendRowTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = friendsTableView.dequeueReusableCell(withIdentifier: "FriendRowTVuCell", for: indexPath) as? FriendRowTVuCell else {
            return FriendRowTVuCell()
        }
        cell.configure(indexPath: indexPath)
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension FriendsListVC{
    
    func setupTableView(){
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        
        friendsTableView.rowHeight = UITableView.automaticDimension
        friendsTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let friendNib = UINib(nibName: "FriendRowTVuCell", bundle: nil)
        friendsTableView.register(friendNib, forCellReuseIdentifier: "FriendRowTVuCell")
    }
}
