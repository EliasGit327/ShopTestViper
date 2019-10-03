import UIKit

final class MainModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: MainViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: MainViewController) {

        let router = MainRouter()
        router.viewController = viewController

        let presenter = MainPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
