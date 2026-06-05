import Combine

@MainActor
class AnalyticsDetailsViewModel: ObservableObject {
    @Published var recentProjects: [Project] = []
    @Published var isLoading: Bool = false
    let projectService: ProjectService

    init(projectService: ProjectService) {
        self.projectService = projectService
    }

    func loadRecentProjects() {
        Task {
            isLoading = true
            
            defer{
                isLoading = false
            }
            
            let projects = await projectService.fetchProjects()
            recentProjects = projects
        }
    }
}
