/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import WatchKit
import Foundation


class StationsInterfaceController: WKInterfaceController {
  @IBOutlet var table: WKInterfaceTable!
  
  var tideConditions: TideConditions?
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    tideConditions = context as? TideConditions
    
    loadStations()
  }
  
  func loadStations() {
    let stations = MeasurementStation.allStations()
    table.setNumberOfRows(stations.count, withRowType: StationRowController.RowType);
    for i in 0..<table.numberOfRows {
      let row = table.rowControllerAtIndex(i) as! StationRowController
      let station = stations[i]
      row.populateWithStation(station, index: i)
    }
  }
  
  override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
    let stations = MeasurementStation.allStations()
    let station = stations[rowIndex]
    tideConditions?.station = station
    popController()
  }
}
