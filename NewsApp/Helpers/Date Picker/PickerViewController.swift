
import UIKit
protocol DatePickerDelegate {
    func didPickedUpYear(index: Int)
}
class PickerViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    
    // MARK: - Outelts
    @IBOutlet weak var picker: UIPickerView!
    
    // MARK: - Varibles
    var branches = [String]()
    var delegate: DatePickerDelegate?
    var selectedBranchIndex :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    @IBAction func SaveTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true) {
            if let delegate = self.delegate{
                delegate.didPickedUpYear(index: self.selectedBranchIndex!)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return branches.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return branches[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedBranchIndex = row
    }
    
}
extension PickerViewController{
    func config(delegate: DatePickerDelegate,branches:[String]){
        self.delegate = delegate
        self.branches = branches
        self.selectedBranchIndex = 0
    }
}
