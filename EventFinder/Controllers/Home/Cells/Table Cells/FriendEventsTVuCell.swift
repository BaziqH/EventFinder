//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class FriendEventsTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        
        var size = self.friendsCollectionView.contentSize
        size.height += 35
        
        return size
    }
}
//MARK: - COLLECTION VIEW
extension FriendEventsTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadEventsCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOW LAYOUT
extension FriendEventsTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = CGFloat(278)
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

//MARK: - LOAD CELLS
extension FriendEventsTVuCell{
    func loadEventsCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = friendsCollectionView.dequeueReusableCell(withReuseIdentifier: "FriendCVuCell", for: indexPath) as? FriendCVuCell else {
            return FriendCVuCell()
        }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension FriendEventsTVuCell{
    func setupCollectionView(){
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
    }
    func registerNibs(){
        let eventsNib = UINib(nibName: "FriendCVuCell", bundle: nil)
        friendsCollectionView.register(eventsNib, forCellWithReuseIdentifier: "FriendCVuCell")
    }
}
