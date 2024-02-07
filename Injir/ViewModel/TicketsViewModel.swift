//
//  TicketsViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import Foundation

class TicketsViewModel {
    
    var ticketTypeObservable = Observable(TicketsViewController.TicketType.aviation)
    
    var classOfService = Observable(TicketsViewController.ClassOfService.econom)
    
    var countPassengers = Observable<Int>(1)
    
    func changeTicketType(type: TicketsViewController.TicketType) {
        ticketTypeObservable.value = type
    }
    
    func changeCountGuests(count: Int) {
        countPassengers.value = count
    }
    
    func changeClassOfPassengers(newService: TicketsViewController.ClassOfService) {
        classOfService.value = newService
    }
    
    func getPassengersCountText() -> String{
        let count = countPassengers.value!
        switch count {
        case 1:
            return "\(count) пассажир"
        case 2...4:
            return "\(count) пассажира"
        default:
            return "\(count) пассажиров"
        }
    }
}
