
import Foundation

struct Projects {
    var projectTitle: String
    var projectTags: String
    var projectDescription: String
    var projectImage: String
    
}

struct ProjectsMetaData {
    static func getAllProjects() -> [Projects] {
        return [
           Projects(projectTitle: "Education Series", projectTags: "UX design | child development", projectDescription: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ianventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed.Nemo enim ipsam voluptatem quia voluptas...", projectImage: "education_series"),
             Projects(projectTitle: "Education Series", projectTags: "UX design | child development", projectDescription: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ianventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed.Nemo enim ipsam voluptatem quia voluptas...", projectImage: "education_series"),
             Projects(projectTitle: "Facebook Live", projectTags: "swift | UI design | Illustration", projectDescription: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ianventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed.Nemo enim ipsam voluptatem quia voluptas...", projectImage: "facebook_live")
        ]
    }
}



//Project(name: "Online course with video streaming", level: "beginner", imageName: "3"),
//Project(name: "Online shopping cart app", level: "beginner", imageName: "4"),
//Project(name: "Photos browser with UITableView", level: "intermediate", imageName: "5"),
//App(name: "REST API and JSON: Restaurants Explorer", level: "intermediate", imageName: "6"),
//App(name: "REST API and JSON: weather forecast app", level: "intermediate", imageName: "7"),
//App(name: "UICollectionView: News Reader", level: "intermediate", imageName: "8"),
//App(name: "REST API and JSON: Instagram Browser", level: "intermediate", imageName: "9"),
//App(name: "Journal App with Core Data", level: "advanced", imageName: "10"),
//App(name: "Build Twitter with Firebase Webinar", level: "advanced", imageName: "11")
//
//
//


