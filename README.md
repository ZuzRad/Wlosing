# Wlosing
.NET WPF application

![image](https://user-images.githubusercontent.com/107064508/225464705-7fc67b4b-5db2-4adc-89ea-3c503769e674.png)


## 📖 Table of Contents
* [General Information](https://github.com/ZuzRad/Wlosing#-general-information)
* [Application Features](https://github.com/ZuzRad/Wlosing#-application-features)
* [Learning goals](https://github.com/ZuzRad/Wlosing#-learning-goals)
* [Database](https://github.com/ZuzRad/Wlosing#-database)
* [Screenshots](https://github.com/ZuzRad/Wlosing#-screenshots)
* [Project status](https://github.com/ZuzRad/Wlosing#-project-status)

## 📝 General Information
wlosing is a .NET WPF application that, using a soft set, determines hair care for the user and proposes a set of products using a database. The project was made according to the MVVM pattern. In the project, the database was placed in the DAL layer, where database access, SQL queries and data reading are supported. 


## ✨ Application Features
List of features that the gapplication includes.
- Ability to display your recommended care,
- Ability to check product availability in stores,
- Ability to find a given type of product sorted by a specific variant,
- Possibility to recommend hair care according to the quiz result,
- Ability to search for a product that is an emollient, humectant or protein,
- Ppossibility of displaying the product for hair problems,
- Ability to create your own sets,
- Possibility of finding a product such as shampoo or conditioner.


## 💡 Learning Goals
- WPF library basics
- MVVM pattern
- SQL
- Soft set

## 📘 Database
The project uses its own Włosing database. Database
hair products contains specific hair products that have their own
unique number, price, name and specific type. Włosing stores information about availability
products in stores and about their producers and country of origin. Hair problems
are solved by many product types and as a result we get a group of products being
specific types and meeting the given characteristics. The type specifies the problems to which
affected by the product group. The database consists of 5 types of entities:
- PRODUKTY nazwa, cena, wegański
- PROBLEMY nazwa
- SKLEPY nazwa
- PRODUCENCI nazwa, kraj
- TYPY typ

and the following entity relationships:

- Jest dostępny: PRODUKT Jest dostępny w SKLEPIE (n:m)
- Rozwiązuje: TYP Rozwiązuje PROBLEM (n:m)
- Jest: PRODUKT Jest TYPU (n:1)
- Produkuje: PRODUCENT Produkuje PRODUKT (1:n)

The database structure and relations are presented in the following entity relationship diagram and relational model:
![image](https://user-images.githubusercontent.com/107064508/225465624-687211a9-0502-469b-8ce6-95c234e5c315.png)
![image](https://user-images.githubusercontent.com/107064508/225462026-6f6adec5-35f6-4d71-9086-bd5fc3659706.png)


## 📷 Screenshots
![image](https://user-images.githubusercontent.com/107064508/225464887-63267094-0ff4-4435-9a88-e0d18868ebd7.png)
![image](https://user-images.githubusercontent.com/107064508/225464949-bc1aab7b-5625-4d62-89fd-d6343c187dc4.png)
![image](https://user-images.githubusercontent.com/107064508/225464961-5b4337dd-e677-4ad0-86e0-af6b39a9ada1.png)
![image](https://user-images.githubusercontent.com/107064508/225464976-fecd088e-78ff-4f34-92ba-00a1c695966b.png)


## 🌱 Project Status
Project completed

