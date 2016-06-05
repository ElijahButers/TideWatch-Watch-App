//
//  ComplicationController.swift
//  TideWatch
//
//  Created by User on 6/5/16.
//  Copyright © 2016 razeware. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {

  // MARK: Register
  func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
    
    handler(nil)
  }
  
  func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimelineEntry?) -> Void) {
    
    handler(nil)
  }
  
  func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
    
    handler(.None)
  }
}
