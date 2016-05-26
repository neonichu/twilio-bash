#!/usr/bin/env swift

import Foundation

let sightingsData = NSData(contentsOfFile: "/Users/boris/Downloads/SIGHTINGS.json")
let sightingsJSON = try! NSJSONSerialization.JSONObjectWithData(sightingsData!, options: [])
let actualData = (sightingsJSON["dataset"] as! NSDictionary)["data"] as! NSArray

var sightings = [Int:Int]()

actualData.forEach { data in
	let dataArray = data as! NSArray
	let month = Int((dataArray[0] as! String).componentsSeparatedByString("-")[1])!
	let sightingsPerMonth = Int(dataArray[1] as! NSNumber)

	var totalSightings = sightings[month] ?? 0
	totalSightings += sightingsPerMonth
	sightings[month] = totalSightings
}

var maxSightings = 0
var maxMonth = 0

sightings.forEach {
	if $0.1 > maxSightings {
		maxMonth = $0.0
		maxSightings = $0.1
	}
}

print("\(maxMonth)")
