//
//  RealmManager.swift
//  List
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//
//
import RealmSwift

public class RealmManager {
    public static let shared = RealmManager()
    private let realm: Realm
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Error initializing Realm: \(error)")
        }
    }
}

extension RealmManager {
    
     func saveUniversitiesToRealm(_ universities: [UniversityObject]) throws {
          do {
              try realm.write {
                  realm.deleteAll()
                  for university in universities {
                      let universityObject = UniversityObject()
                      universityObject.name = university.name
                      universityObject.stateProvince = university.stateProvince
                      universityObject.webPages.append(objectsIn: university.webPages)
                      universityObject.alphaTwoCode = university.alphaTwoCode
                      universityObject.country = university.country
                      realm.add(universityObject)
                  }
              }
          } catch {
              throw error
          }
      }
      
    func fetchUniversitiesFromRealm() -> [UniversityObject]? {
          let universityObjects = realm.objects(UniversityObject.self)
          return Array(universityObjects)
      }
}
