//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class FriendsListVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerNibs()
        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
