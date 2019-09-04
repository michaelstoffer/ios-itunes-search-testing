//
//  BadResultsData.swift
//  SearchResultController Tests
//
//  Created by Michael Stoffer on 9/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

let badResultsData = """
{
  "resultCount": 2,
  "results": [
    {

      "trackName": "GarageBand",
      "artistName": "Apple",
    },
    {
      "trackName": "Shortcut: GarageBand Edition",
      "artistName": "Mark Keroles",
    }
  ]
""".data(using: .utf8)!

let noResultsData = """
{
  "resultCount": 0,
  "results": []
}
""".data(using: .utf8)!
