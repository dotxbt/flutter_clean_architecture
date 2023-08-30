# FLUTTER CLEAN ARCHITECTURE
Belajar memahami clean architecture 

```bash
-------------------------------------
           |    Page --- Widget      ^
 PRESENTER |    State Management     |
           |           |             |
-----------| ------ Use Case         |
           |           |             |
   DOMAIN  |        Entity           |
           |           |         Call FLow
------------------Repositories       |
           |      |         |        |
           |    Model     Model      |
   DATA    |      |         |        |
           |   Remote      Local     |
           |    Data       Data      |
           |   Source     Source     |
--------------------------------------
```

## Folder Structure

```bash
├── config
│   ├── routes
│   └── theme
├── core
│   ├── constants
│   ├── network
│   ├── resources
│   ├── usecases
│   └── utils
├── features
│   └── auth
│       ├── data
│       │   ├── data_sources
│       │   │   └── remote
│       │   │   └── local
│       │   ├── models
│       │   └── repository
│       ├── domain
│       │   ├── entities
│       │   ├── repository
│       │   └── usecases
│       └── presentation
│           ├── bloc
│           ├── pages
│           └── widgets
└── main.dart
```