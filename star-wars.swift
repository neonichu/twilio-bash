#!/usr/bin/env swift

import AppKit

func fetchJSON(urlString: String, completion: (NSDictionary) -> Void) {
	let req = NSURLRequest(URL: NSURL(string: urlString)!)
	let task = NSURLSession.sharedSession().dataTaskWithRequest(req) { data, _, error in
		if let error = error {
			print(error)
		}

		if let data = data {
			let json = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
			completion(json as! NSDictionary)
		}
	}
	task.resume()
}

NSApplicationLoad()

fetchJSON("http://swapi.co/api/people/1") { dict in
	let person = dict["name"]!

	if let filmUrl = (dict["films"] as! NSArray).firstObject as? String {
		fetchJSON(filmUrl) { filmDict in
			let film = filmDict["title"]!

			if let planetUrl = dict["homeworld"] as? String {
				fetchJSON(planetUrl) { planetDict in
					let planet = planetDict["name"]!

					if let starshipUrl = (dict["starships"] as! NSArray).firstObject as? String {
						fetchJSON(starshipUrl) { starshipDict in
							let starship = starshipDict["name"]!

							let template = "Remember in \(film), \(person) shot first and took \(starship) to \(planet)?"
							print(template)

							exit(0)
						}
					}
				}
			}
		}
	}
}

NSApp.run()
