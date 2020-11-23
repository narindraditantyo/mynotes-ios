//
//  NotesDummy.swift
//  mynotes
//
//  Created by Narindra Aditantyo on 09/11/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import Foundation

let toggleCategories = UserDefaults.standard.bool(forKey: "toggleCategories")

var arrCategories: [String] = ["Private", "Work"]

var arrNotes: [[Notes]] = [
    [
        Notes(title: "Daftar Belanja", desc: "Apel 1kg, telur, vitamin C, pen merah, kertas HVS, baterai"),
        Notes(title: "Kupon Diskon", desc: "OCTOBERONLY diskon 20% dengan syarat dan ketentuan berlaku")
    ],
    [
        Notes(title: "Ringkasan Meeting", desc: "Seminar akan dilakukan secara online dari rumah masing-masing"),
        Notes(title: "Sales Follow-up", desc: "Nama: John Doe, Email: johndoe@email.com")
    ],
]
