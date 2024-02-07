//
//  Ticket.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import Foundation

struct Ticket {
    var type: TicketsViewController.TicketType
    var from: String
    var to: String
    var forth: Date//туда
    var back: Date// обратно
    var countPeople: Int
    var typeSit: String///????
}
