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
    
    if complication.family == .UtilitarianSmall {
      let smallFlat = CLKComplicationTemplateUtilitarianSmallFlat()
      smallFlat.textProvider = CLKSimpleTextProvider(text: "+2.6m")
      smallFlat.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "tide_high")!)
      handler(smallFlat)
    }
    else if complication.family == .UtilitarianLarge {
        let largeFlat = CLKComplicationTemplateUtilitarianLargeFlat()
        largeFlat.textProvider = CLKSimpleTextProvider(text: "Rising, +2.6m", shortText: "+2.6m")
        largeFlat.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "tide_high")!)
        handler(largeFlat)
    }
    //handler(nil)
  }
  
  func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimelineEntry?) -> Void) {
    
    let conditions = TideConditions.loadConditions()
    guard let waterLevel = conditions.currentWaterLevel else {
      //
//    handler(nil)
    return
    }
    let tideImageName: String
    switch waterLevel.situation {
    case .High: tideImageName = "tide_high"
    case .Low: tideImageName = "tide_low"
    case .Rising: tideImageName = "tide_rising"
    case .Falling: tideImageName = "tide_falling"
    default: tideImageName = "tide_high"
    }
    
    if complication.family == .UtilitarianSmall {
      let smallFlat = CLKComplicationTemplateUtilitarianSmallFlat()
      smallFlat.textProvider = CLKSimpleTextProvider(text: waterLevel.shortTextForComplication)
      smallFlat.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: tideImageName)!)
      
      handler(CLKComplicationTimelineEntry(date: waterLevel.date, complicationTemplate: smallFlat))
    } else {
      let largeFlat = CLKComplicationTemplateUtilitarianLargeFlat()
      largeFlat.textProvider = CLKSimpleTextProvider(text: waterLevel.longTextForComplication, shortText: waterLevel.shortTextForComplication)
      largeFlat.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: tideImageName)!)
      
      handler(CLKComplicationTimelineEntry(date: waterLevel.date, complicationTemplate: largeFlat))
    }
  }
  
  func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
    
    handler(.None)
  }
}
