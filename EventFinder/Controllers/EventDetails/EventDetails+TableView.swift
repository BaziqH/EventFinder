//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
//MARK: - TABLE VIEW
extension EventDetailsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            return loadEventTVuCell(indexPath)
        case 1:
            return loadHostTVuCell(indexPath)
        case 2:
            return loadJoinBtnTVuCell(indexPath)
        case 3:
            return loadDetailTVuCell(indexPath)
        default:
            return UITableViewCell()
        }
    }
}
//MARK: - LOAD CELSS
extension EventDetailsVC{
    func loadEventTVuCell(_ indexPath: IndexPath)-> UITableViewCell{
        guard let cell = evntDtailsTableView.dequeueReusableCell(withIdentifier: "EventTVuCell") as? EventTVuCell else { return EventTVuCell() }
        return cell
    }
    func loadHostTVuCell(_ indexPath: IndexPath)-> UITableViewCell{
        guard let cell = evntDtailsTableView.dequeueReusableCell(withIdentifier: "HostTVuCell") as? HostTVuCell else { return HostTVuCell() }
        return cell
    }
    func loadJoinBtnTVuCell(_ indexPath: IndexPath)-> UITableViewCell{
        guard let cell = evntDtailsTableView.dequeueReusableCell(withIdentifier: "JoinBtnTVuCell") as? JoinBtnTVuCell else { return JoinBtnTVuCell() }
        return cell
    }
    func loadDetailTVuCell(_ indexPath: IndexPath)-> UITableViewCell{
        guard let cell = evntDtailsTableView.dequeueReusableCell(withIdentifier: "DetailTVuCell") as? DetailTVuCell else { return DetailTVuCell() }
        return cell
    }
}
//MARK: - SETUP CELLS
extension EventDetailsVC{
    func setupTableView(){
        evntDtailsTableView.delegate = self
        evntDtailsTableView.dataSource = self
        
        evntDtailsTableView.rowHeight = UITableView.automaticDimension
        evntDtailsTableView.estimatedRowHeight = 150
    }
    
    func registerNibs(){
        let detailsNib = UINib(nibName: "EventTVuCell", bundle: nil)
        evntDtailsTableView.register(detailsNib, forCellReuseIdentifier: "EventTVuCell")
        
        let hostNib = UINib(nibName: "HostTVuCell", bundle: nil)
        evntDtailsTableView.register(hostNib, forCellReuseIdentifier: "HostTVuCell")
        
        let btnNib = UINib(nibName: "JoinBtnTVuCell", bundle: nil)
        evntDtailsTableView.register(btnNib, forCellReuseIdentifier: "JoinBtnTVuCell")
        
        let detailNib = UINib(nibName: "DetailTVuCell", bundle: nil)
        evntDtailsTableView.register(detailNib, forCellReuseIdentifier: "DetailTVuCell")
    }
}
