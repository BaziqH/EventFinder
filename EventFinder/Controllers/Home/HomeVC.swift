//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    
//MARK: - HOME CLASS
class HomeVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var homeTableView: UITableView!
    //MARK: - VARIABLES

    //MARK: - VIEW CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerNibs()
    }
}
