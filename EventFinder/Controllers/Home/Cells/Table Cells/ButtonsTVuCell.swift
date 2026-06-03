//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    

class ButtonsTVuCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    //MARK: - VARIABLES
    var arrLabel: [(String,String)]!
    override func awakeFromNib() {
        super.awakeFromNib()
        loadData()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - AUTO HEIGHT FUNCTION
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        let height = optionsCollectionView.collectionViewLayout.collectionViewContentSize.height
        return CGSize(width: targetSize.width, height: height)
    }
}
//MARK: - COLLECTION VIEW
extension ButtonsTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadOptionsCVuCell(indexPath)
    }
}
extension ButtonsTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4 - 10, height: collectionView.frame.width/4.5)
    }
}
//MARK: - COLLECTION VIEW FLOW LAYOUT
extension ButtonsTVuCell{
    func loadOptionsCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = optionsCollectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCVuCell", for: indexPath) as? OptionsCVuCell else {
            return OptionsCVuCell()
        }
        cell.configure(arrLabel[indexPath.row].0, arrLabel[indexPath.row].1)
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension ButtonsTVuCell{
    func setupCollectionView(){
        optionsCollectionView.delegate = self
        optionsCollectionView.dataSource = self
    }
    func registerNibs(){
        let nib = UINib(nibName: "OptionsCVuCell", bundle: nil)
        optionsCollectionView.register(nib, forCellWithReuseIdentifier: "OptionsCVuCell")
    }
}
//MARK: - LOAD DATA
extension ButtonsTVuCell{
    func loadData(){
        arrLabel = [("Deposit","arrow.up"),
                    ("Withdrawal","arrow.down"),
                    ("Loan","banknote"),
                    ("Remit","wallet.bifold"),
        ]
    }
}
