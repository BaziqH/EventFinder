//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class SpecialEventsTVuCell: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var seeMore: UILabel!
    
    //MARK: - VARIABLES
    var seeMoreTap: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        addTap()
        // Initialization code
//        coursesCollectionView.collectionViewLayout.invalidateLayout()
        if let layout = eventsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    func updateCollectionHeight() {
        collectionHeight.constant = 160
        eventsCollectionView.layoutIfNeeded()
    }
}
//MARK: - COLLECTION VIEW
extension SpecialEventsTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadEventsCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOW LAYOUT
extension SpecialEventsTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

//MARK: - LOAD CELLS
extension SpecialEventsTVuCell{
    func loadEventsCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "EventsCVuCell", for: indexPath) as? EventsCVuCell else {
            return EventsCVuCell()
        }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension SpecialEventsTVuCell{
    func setupCollectionView(){
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
    }
    func registerNibs(){
        let coursesNib = UINib(nibName: "EventsCVuCell", bundle: nil)
        eventsCollectionView.register(coursesNib, forCellWithReuseIdentifier: "EventsCVuCell")
    }
}
//MARK: - TAP FUNCTIONALITY
extension SpecialEventsTVuCell{
    func addTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(seeMoreTapped))
        seeMore.addGestureRecognizer(tap)
    }
    @objc func seeMoreTapped(){
        seeMoreTap?()
    }
}
