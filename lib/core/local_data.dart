import 'package:ar_book/models/category.dart';
import 'package:ar_book/models/language.dart';

class LocalData {
  static List<Lang> languages = [
    Lang(
        id: "vi",
        languageCode: "vi",
        name: "Tiếng Việt",
        slug: "vi",
        font: "Nunito"),
    Lang(
        id: "en",
        languageCode: "en",
        name: "English",
        slug: "en",
        font: "Nunito"),
    Lang(
        id: "vi_Thai",
        languageCode: "vi",
        scriptCode: 'Thai',
        slug: "thai",
        name: "CVaM yT",
        font: "Thai"),
    Lang(
        slug: "mong",
        id: "vi_Mong",
        languageCode: "vi",
        scriptCode: 'Mong',
        name: "Lul Hmôngz",
        font: "Nunito"),
    Lang(
        slug: "mnong",
        id: "vi_Mnong",
        languageCode: "vi",
        scriptCode: "Mnong",
        name: "Nau Mnong",
        font: "TayNguyen"),
    Lang(
        slug: "khmer",
        id: "vi_Khmer",
        languageCode: "vi",
        scriptCode: "Khmer",
        name: "ភាសាខ្មែរ",
        font: "Khmer"),
    Lang(
        id: "vi_EDE",
        languageCode: "vi",
        scriptCode: "EDE",
        name: "Klei Êđê",
        slug: "ede",
        font: "TayNguyen"),
    Lang(
        slug: "jrai",
        id: "vi_Jrai",
        languageCode: "vi",
        scriptCode: "Jrai",
        name: "Tơlơi Jrai",
        font: "TayNguyen"),
    Lang(
        slug: "cham",
        id: "vi_Cham",
        languageCode: "vi",
        scriptCode: "Cham",
        name: "y'%1 .O gJ",
        font: "Cham"),
    Lang(
        slug: "bahnar",
        id: "vi_Bahnar",
        languageCode: "vi",
        scriptCode: "Bahnar",
        name: "Nâr Bahnar",
        font: "TayNguyen"),
  ];

  static List<Category> categories = [
    Category(
        id: 1,
        ten: 'menu.arbook',
        anh: 'assets/images/category/ar.png',
        filter: 'arbook'),
    Category(
        id: 2,
        ten: 'menu.level1',
        anh: 'assets/images/category/lvl-1.png',
        filter: '1ce0d01b-4bab-4021-82c6-db9e13361719'),
    Category(
        id: 3,
        ten: 'menu.level2',
        anh: 'assets/images/category/lvl-2.png',
        filter: '0692a70d-f7f9-428a-9923-d2a165a35553'),
    Category(
        id: 4,
        ten: 'menu.level3',
        anh: 'assets/images/category/lvl-3.png',
        filter: '3d5cde98-12c2-41f2-9ede-d1f2a29d9f22'),
    Category(
        id: 5,
        ten: 'menu.level4',
        anh: 'assets/images/category/lvl-4.png',
        filter: '08364b94-08af-4eea-8e1b-cd6d5f7e7604'),
    Category(
        id: 6,
        ten: 'menu.level5',
        anh: 'assets/images/category/lvl-5.png',
        filter: '7c636389-c908-44a8-86cd-629aad657eef'),
    Category(
        id: 7,
        ten: 'menu.videobook',
        anh: 'assets/images/category/ar.png',
        filter: 'video'),
  ];
}
