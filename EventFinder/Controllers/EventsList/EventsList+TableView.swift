//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

//MARK: - TABLE VIEW
extension EventsListVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadEventsTVuCell(indexPath)
        }
        return UITableViewCell()
    }
}
//MARK: - LOAD CELLS
extension EventsListVC{
    func loadEventsTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "EventsTVuCell", for: indexPath) as? EventsTVuCell else {
            return EventsTVuCell()
        }
        cell.eventDetails = {[weak self] in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "EventDetailsVC") as? EventDetailsVC {
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension EventsListVC{
    
    func setupTableView(){
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventsTableView.rowHeight = UITableView.automaticDimension
        eventsTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let eventsNib = UINib(nibName: "EventsTVuCell", bundle: nil)
        eventsTableView.register(eventsNib, forCellReuseIdentifier: "EventsTVuCell")
    }
}

