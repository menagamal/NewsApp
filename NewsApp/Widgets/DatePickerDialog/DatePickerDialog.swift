
import UIKit
protocol DatePickerDialogDelegate {
  func didPickedUpData(date: String,tag: Int)
}
class DatePickerDialog: UIViewController {
  
  // MARK: - Outelts
  @IBOutlet weak var datePicker: UIDatePicker!
  
  // MARK: - Varibles

  var datePickerType: UIDatePicker.Mode = .date
  var delegate: DatePickerDialogDelegate?
  var tag: Int?
  var minDate: Date?
  override func viewDidLoad() {
    super.viewDidLoad()
    setUp()
  }
  
  func setUp(){
    if minDate != nil{
      self.datePicker.minimumDate = minDate
    }
    self.datePicker.datePickerMode = self.datePickerType
  }
  
  @IBAction func SaveTapped(_ sender: UIButton) {
    guard let tag = self.tag else{return}
    self.dismiss(animated: true) {
      if let delegate = self.delegate{
        let formatter = DateFormatter()
        if self.datePicker.datePickerMode == .date{
          formatter.dateFormat = "YYYY-MM-dd"
        }
        else if self.datePicker.datePickerMode == .time{
          formatter.dateFormat = "h:mm a"
        }
        delegate.didPickedUpData(date: formatter.string(from: self.datePicker.date), tag: tag)
      }
    }
  }
}
extension DatePickerDialog{
  func config(delegate: DatePickerDialogDelegate,tag: Int,datePickerType: UIDatePicker.Mode){
    self.delegate = delegate
    self.tag = tag
    self.datePickerType = datePickerType
  }
}
