//
//  DependencyContainerProtocol.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 11/1/24.
//

import Foundation


/**
 
 https://swiftunwrap.com/article/dependency-container/
 https://medium.com/sahibinden-technology/dependency-injection-container-in-swift-89392a309532
 
 */


/**
 
 DependencyContainer and Injection System
 
 __DependencyContainerProtocol__: Defines the basic structure for a dependency container. Each container must be able to register and resolve dependencies.
 
 E.G.:
  
 __CharactersDependencyContainer__ It registers all dependencies needed to create CharactersViewModel and has the facility to resolve these dependencies when requested.

 __Dependency Registration:__ In the initialiser, dependencies (such as APIService, CharacterDataManager, etc.) are registered using the register method. Each dependency is associated with a closure that knows how to instantiate it.
 
 __Dependency Resolution:__ When a dependency is needed, the resolve method is called, which looks for the corresponding closure in registeredDependencies and executes it to create the instance.
 
 __DependencyContainer:__ Acts as a main container that decides which specific container to use (such as CharactersDependencyContainer) based on the type of dependency requested. In this case it is use to return needed view models
 ```
 In resolve<T>, a switch on T.self is used to determine which specific container should be used to resolve a dependency.
 
 ```
 */
protocol DependencyContainerProtocol {
    var registeredDependencies: [String: () -> Any] { get set }
    func resolve<T>() -> T
    func register<T>(_ type: T.Type, factory: @escaping () -> T)
}
