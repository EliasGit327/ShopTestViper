import UIKit

final class FavModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: FavViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: FavViewController) {

        let router = FavRouter()
        router.viewController = viewController

        let presenter = FavPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FavInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
