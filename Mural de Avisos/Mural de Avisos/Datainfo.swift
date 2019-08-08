//
//  Datainfo.swift
//  Mural de Avisos
//
//  Created by Paulo Matheus on 06/08/19.
//  Copyright © 2019 Paulo Matheus. All rights reserved.
//

import Foundation

struct DataInfo {
    var id: String?
    var titulo: String?
    var conteudo: String?
    
    init(id: String?, titulo: String?, conteudo: String?){
        self.id = id;
        self.titulo = titulo;
        self.conteudo = conteudo;
    }
}
