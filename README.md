# MCA Rick And Morty iOS App
This project is an iOS application developed in SwiftUI and MVVM architecture. It uses the Rick and Morty API to display a list of characters and their details. The project follows a Test Driven Development (TDD) approach and uses modern technologies such as Async/Await and custom cache implementation to optimise performance.

## Tech Stack
- SwiftUI
- MVVM architecture
- Test-driven development  (TDD)
- Async/Await
- iOS 16


## Time Tracking
Logging of hours spent on each project task.

| Date | Task | Hours Employed|
| ----- | ----- | ---------------- |
| 08/01/2024 | Initial analisis, create repo, create backlog | 1:30H |
| 09/01/2024 | API Design and Testing  |  1H |
| TOTAL|  |  2:30H |


## Backlog
| Task | Description | Status|
| ----- | ----------- | ------ |
| Create repo and make the initial analysis of how the app will be developed. | It is the initial task where an empty project is created and all the backlog points are organised for a more optimised development.| DONE |
| Initial Project Configuration| Configure the project in Xcode with SwiftUI. | DONE |
| API Design and Testing | Design the structure of API calls with unit tests.| DONE |
| Implementing API Services | Develop and test logic to consume the Rick and Morty API. | DONE |
| Implement Characters Data | Implement character data manager, repository and use casese | DONE |
| Basic User Interface Design| Create a basic interface for the list of characters and details. | TODO |
| Navigation Coordinator | Implement a navigation coordinator using NavigationStack. | TODO |
| Implement Episodes Data | Implement Espisode data manager, repository and use cases | TODO |
| MVVM implementation| Develop ViewModels for the views, guided by TDD. | TODO |
| Error and Status Management | Implement a system for error handling and load states, including testing. | TODO |
| Image and Response Caches | Develop a cache class with unit tests. | TODO |
| UX/UI and Design Improvements in Figma | Refine the user interface and create a design system in Figma. | TODO |
| Research on Server Driven UI | Investigate how to implement Server Driven UI in the project. | TODO |

## Git Workflow
To ensure efficient and organised development, a simple Git workflow will be followed:

1. **Master Branch:** The main branch where the code is always in its most stable state.

2. **Feature Branches:** For each new feature or task, a separate branch is created (e.g., `feature/api-integration`).

3. **Commits Regulares:** Make small, frequent commits with clear and descriptive messages.

4. **Pull Requests y Code Reviews:** Although working alone, pull requests are used to merge feature branches into the main branch, allowing for self-imposed code review.

5. **Merge and Delete Feature Branches:** After a feature is completed and tested, it is merged into the main branch and the feature branch is removed to keep the repository organised.



## Project History
A chronological log of major decisions, changes, and milestones in the project, along with daily challenges and learnings.

| Fecha | Evento | Comentarios y Aprendizajes |
| ----- | ------ | -------------------------- |
| [08/01/2024] | Creation of the repository and initial analysis of the project. | No comments on is day |
| [08/01/2024] | Start the analysis on how to desing API service | I will take advantage of the structure that I have been using in other projects and that I am even creating a library called [RequestBuilder](https://github.com/rodri2d2/RequestBuilder). This library is still under development but the code used will help me to build on it.|
| [08/01/2024] | Start create network classes and test | Even if I do have a lot of code ready, I'm re-writing it to fallow correctly TDD and the backlog created|
| [09/01/2024] | Keep create network classes and test | I have finished with the creation of protocols that will help standardise the creation of responses. I discovered a bug in my original URLRequesBuilder class when I was doing the tests for that project. I was able to fix it and made notes to change it in the framework I'm building. |
| [09/01/2024] | Modify git ignore| I noticed that the "ignore file" was not configured correctly as it was asking for DS_STORE all the time. |
| [09/01/2024] | Modify README | For the interview I have added a track of the time I have worked each day. |
| [10/01/2024] | Implement API Sevice | Implement the entire api access layer and make some tests |
| [10/01/2024] | A lot of refactoring | While writing the new code I realised that I should have gone into more detail and divided the tasks more. I also had to do a lot of refactoring and apply other concepts. |
| [10/01/2024] | New backlog| I have decided to increase the backlog to better divide the tasks. |
