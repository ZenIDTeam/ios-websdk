
import Foundation


final class MainDispatchDecorator<DecorateeType> {

    let decoratee: DecorateeType

    init(decoratee: DecorateeType) {
        self.decoratee = decoratee
    }

    func performOnMainThread(action: @escaping () -> Void) {
        if Thread.isMainThread {
            action()
        } else {
            DispatchQueue.main.async {
                action()
            }
        }
    }

}
