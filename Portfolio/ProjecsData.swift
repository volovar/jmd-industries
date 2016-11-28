import  UIKit
import Foundation



class CompanySection
{
    // Variables
    
    var nameOfSection: String            // name of the product line
    var projects: [SingleProject]     // all products in the line
    
//    var header: [CustomHeader]
    
    init(named: String, includeProjects: [SingleProject])
    {
        nameOfSection = named
        projects = includeProjects
//        header = includeHeader
        
        
    }
    
    class func companySections() -> [CompanySection]
    {
        return [self.facebookProjects(), self.yahooProjects(), self.moovlyProjects()]
    }
    
    // Private methods
    
    private class func facebookProjects() -> CompanySection {
        //  (1) iDevices: Apple Watch, iPad, iPhone, iOS
        var projects = [SingleProject]()
//        var header = [CustomHeader]()
        
//        header.append(CustomHeader(sectionTitle: "Facebook Projects", sectionBackground: "titleCompressedBlue"))
        
        projects.append(SingleProject(projectTitle: "Facebook Live", projectTags: "UX design | child development", projectDescription: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ianventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed.Nemo enim ipsam voluptatem quia voluptas...", projectImage: "facebook_live"))
        projects.append(SingleProject(projectTitle: "Education Series", projectTags: "UX design | child development", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "education_series"))
        
        return CompanySection(named: "Facebook Projects", includeProjects: projects)
    }
    
    private class func yahooProjects() -> CompanySection {
        var projects = [SingleProject]()
//        var header = [CustomHeader]()

        
        projects.append(SingleProject(projectTitle: "Yahoo Projects", projectTags: "Yahoo Stuff | Yahoo manager | Assets", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "sleep_tracker"))

        
            return CompanySection(named: "Yahoo Projects", includeProjects: projects)
    }
    
    
    private class func moovlyProjects() -> CompanySection {
        //  (1) iDevices: Apple Watch, iPad, iPhone, iOS
        var projects = [SingleProject]()

        
        projects.append(SingleProject(projectTitle: "Moovly Something", projectTags: "Moovly Database | Moovly arghhh", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "moovly"))

        
        
        return CompanySection(named: "Moovly Projects", includeProjects: projects)
    }
  }




//struct Project {
//
//    var projectTitle: String
//    var projectTags: String
//    var projectDescription: String
//    var projectImage: String
//    
//}

//struct CompanySections {
//    var FacebookProjects: [String]
//    var MoovlyProjects: [String]
//}

//static func allProjects() -> [Projects]
//{
//    return [self.FacebookProjects(), self.MoovlyProjects()]
//}
//
//struct ProjectsMetaData {
////        static func getAllProjects() -> [Projects]
//    
//
//    
//    
//    
//    static func FacebookProjects() -> [Project] {
//        return [
//           Project(projectTitle: "Education Series", projectTags: "UX design | child development", projectDescription: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ianventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed.Nemo enim ipsam voluptatem quia voluptas...", projectImage: "education_series"),
//             Project(projectTitle: "Education Series", projectTags: "UX design | child development", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "education_series")
//
//        ]
//    }
//    
//    static func MoovlyProjects() -> [Project] {
//        return [
//
//            Project(projectTitle: "Moovly Something", projectTags: "Moovly Database | Moovly arghhh", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "sleep_tracker"),
//            Project(projectTitle: "Moovly Test", projectTags: "Something | testing new | works", projectDescription: "Just something with less text to make use of a custom description and then moving to something else", projectImage: "moovly")
//        ]
//    }
//}

