
//Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
//
//A property storing how many rooms it has.
//A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
//A property storing the name of the estate agent responsible for selling the building.
//A method for printing the sales summary of the building, describing what it is along with its other properties.
protocol Building {
    var numberOfRooms: Int {get set}
    var cost: Int {get set}
    var agent: String {get}
    
    func printSalesSummary()
}

extension Building {
    func printSalesSummary(){
        print("The Building costs $\(cost) and is being managed by: \(agent).\n It has \(numberOfRooms)")
    }
}

struct House: Building {
    var agent: String
    var numberOfRooms: Int
    var numberOfBedrooms: Int
    var numberOfBathrooms: Int
    var cost: Int

    
    init(numberOfBedrooms: Int, numberOfBathrooms: Int, cost: Int){
        agent = "Justin Trubela"
        numberOfRooms = numberOfBedrooms+numberOfBathrooms+3
        self.numberOfBedrooms = numberOfBedrooms
        self.numberOfBathrooms = numberOfBathrooms
        self.cost = cost
    }
    
    func printSalesSummary() {
        print("This House costs $\(cost) and is being managed by: \(agent).")
        print("It is a \(numberOfBedrooms) bedroom/\(numberOfBathrooms) bath with a full kitchen/dining area")
        print("In total there are \(numberOfRooms) rooms")

    }
}

struct Office: Building {
    var agent: String
    var numberOfRooms: Int
    var cornerOffice: Bool
    var numberOfOffices: Int
    var numberOfConferenceRooms: Int
    var cost: Int
    
    init(agent: String, cornerOffice: Bool, numberOfConferenceRooms: Int, numberOfOffices: Int, cost: Int) {
        self.agent = agent
        self.cost = cost
        self.cornerOffice = cornerOffice
        self.numberOfOffices = numberOfOffices
        self.numberOfConferenceRooms = numberOfConferenceRooms
        
        numberOfRooms = numberOfConferenceRooms+numberOfOffices+3
        if cornerOffice==true {
            numberOfRooms += 1
        }

    }
    
    func printSalesSummary() {
        var costAgentSummary =  "The Office costs $\(cost) and is being managed by: \(agent)."
        let layoutSummary = "\nIt has a \(numberOfConferenceRooms) conference rooms, \(numberOfOffices) offices, it's own eatery, and 2 bathrooms"
        let totalRooms = "\nTotal of rooms: \(numberOfRooms)"
        if cornerOffice{
            let cornerOfficeSummary = " It has a corner office."
            costAgentSummary.append(cornerOfficeSummary)
            print(costAgentSummary + layoutSummary + totalRooms)
        }
        else{
            print(costAgentSummary + layoutSummary + totalRooms)
        }
    }
}

var RiversideHouse = House(numberOfBedrooms: 4, numberOfBathrooms: 2, cost: 200_000)
RiversideHouse.printSalesSummary()

var MainStBusinessPark = Office(agent: "Justin Trubela", cornerOffice: true, numberOfConferenceRooms: 2, numberOfOffices: 4, cost: 600_000)
MainStBusinessPark.printSalesSummary()

