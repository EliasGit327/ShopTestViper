import UIKit

final class DetailedModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: DetailedViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: DetailedViewController) {

        let router = DetailedRouter()
        router.viewController = viewController

        let presenter = DetailedPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailedInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
