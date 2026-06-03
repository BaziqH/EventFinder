//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//


class MentorsRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var mentorsCollectionView: UICollectionView!
    @IBOutlet weak var mentorsCollectionHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureHeight(){
        mentorsCollectionHeight.constant = 60
    }
    
}
//MARK: - COLLECTION VIEW
extension MentorsRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadMentorsCVuCell(indexPath)
    }
}
extension MentorsRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.8, height: mentorsCollectionHeight.constant)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

//MARK: - LOAD CELLS
extension MentorsRowTVuCell{
    func loadMentorsCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = mentorsCollectionView.dequeueReusableCell(withReuseIdentifier: "MentorsCVuCell", for: indexPath) as? MentorsCVuCell else {
            return MentorsCVuCell()
        }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension MentorsRowTVuCell{
    func setupCollectionView(){
        mentorsCollectionView.delegate = self
        mentorsCollectionView.dataSource = self
    }
    func registerNibs(){
        let coursesNib = UINib(nibName: "MentorsCVuCell", bundle: nil)
        mentorsCollectionView.register(coursesNib, forCellWithReuseIdentifier: "MentorsCVuCell")
    }
}


