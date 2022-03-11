//
//  FirebaseFirestoreService.swift
//  Antion
//
//  Created by Trevor Schmidt on 12/18/21.
//

import FirebaseFirestore
import CodableFirebase

struct FirebaseFirestoreService {
    private init() { }
    static let shared = FirebaseFirestoreService()
    
    private let rootRef = Firestore.firestore()
    
    enum FirestoreError: Error {
        case unwrappingoptional
    }
    
    func pullApps(completion: @escaping (Result<[AppModel], Error>) -> Void) {
        rootRef.collection("Apps").order(by: "order").getDocuments { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let querySnapshot = querySnapshot else {
                completion(.failure(FirestoreError.unwrappingoptional))
                return
            }
            
            let apps = querySnapshot.documents.map { queryDocumentSnapshot -> AppModel in
                return try! FirebaseDecoder().decode(AppModel.self, from: queryDocumentSnapshot.data())
            }
            
            completion(.success(apps))
            return
        }
    }
}


