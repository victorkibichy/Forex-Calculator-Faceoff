import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var currencyData: CurrencyData?
    private var cancellable: AnyCancellable?

    func fetchCurrencyData(base: String) {
        let urlString = "https://api.exchangerate-api.com/v4/latest/\(base)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CurrencyData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Failed to fetch data: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] data in
                self?.currencyData = data
            })
    }
}
