using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;
using włosing.DAL.Repositories;

namespace włosing.Model
{
    internal class SearchManager
    {
        public ObservableCollection<Produkt> Produkty { get; set; } = new ObservableCollection<Produkt>();
        public ObservableCollection<Sklep> Sklepy { get; set; } = new ObservableCollection<Sklep>();
        public ObservableCollection<Producent> Producenci { get; set; } = new ObservableCollection<Producent>();
        public ObservableCollection<Problem> Problemy { get; set; } = new ObservableCollection<Problem>();
        public ObservableCollection<Typ> Typy { get; set; } = new ObservableCollection<Typ>();
        public ObservableCollection<JestDostepne> JestDostepny { get; set; } = new ObservableCollection<JestDostepne>();
        public ObservableCollection<Rozwiazuje> Rozwiazywany { get; set; } = new ObservableCollection<Rozwiazuje>();
        public ObservableCollection<string> KrajeCombo { get; set; } = new ObservableCollection<string>();
        public ObservableCollection<string> SklepyCombo { get; set; } = new ObservableCollection<string>();
        public ObservableCollection<string> TypyCombo { get; set; } = new ObservableCollection<string>();

        public SearchManager()
        {
            var produkty = RepositoryProdukty.GetAllProducts(); //To do wyszukiwarki
            var problemy = RepositoryProblemy.GetAllProblems(); //To do wyszukiwarki
            var sklepy = RepositorySklepy.GetAllShops(); //Combobox sklepy
            var sklepyCombo = RepositorySklepy.GetAllShops().Select(p => p.nazwa).Distinct().ToList(); //Combobox sklepy
            var producenci = RepositoryProducenci.GetAllProducers(); //Stad kraj
            var rozwiazuje = RepositoryRozwiazuje.GetAllSolutions();
            var krajeCombo = RepositoryProducenci.GetAllProducers().Select(p => p.kraj).Distinct().ToList();
            var typy = RepositoryTypy.GetAllTypes(); //Combobox typy
            var typyCombo = RepositoryTypy.GetAllTypes().Select(p => p.typ).Distinct().ToList(); //Combobox typy
            var jestDostepny = RepositoryJestDostepne.GetAllAvaibility(); //Combobox sklepy potrzebne do połączenia 


            KrajeCombo.Add("Kraj Pochodzenia");
            SklepyCombo.Add("Dostępność");
            TypyCombo.Add("Typ produktu");
            foreach (var p in produkty)
                Produkty.Add(p);
            foreach (var p in rozwiazuje)
                Rozwiazywany.Add(p);
            foreach (var p in problemy)
                Problemy.Add(p);
            foreach (var p in sklepy)
                Sklepy.Add(p);
            foreach (var p in producenci)
                Producenci.Add(p);
            foreach (var t in typy)
                Typy.Add(t);
            foreach (var j in jestDostepny)
                JestDostepny.Add(j);
            foreach (var k in krajeCombo)
                KrajeCombo.Add(k);
            foreach (var s in sklepyCombo)
                SklepyCombo.Add(s);
            foreach (var k in typyCombo)
                TypyCombo.Add(k);
        }


        public List<string> showListOfProducts(ObservableCollection<Produkt> products)
        {
            List<string> listTmp = new List<string>();
            foreach (var row in products)
                listTmp.Add(string.Format("{0}", row.nazwa.ToString()));
            return listTmp;
        }

        public List<string> showLabelOfProduct(string productString)
        {
            List<string> listTmp = new List<string>();
            listTmp.Add(string.Format("{0}", " <- Powrót"));
            try
            {
                Produkt product = Produkty.Where(p => p.nazwa.ToString() == productString).Select(p => p).First();
                listTmp.Add(string.Format("Nazwa: {0}", product.nazwa.ToString()));
                listTmp.Add(string.Format("Cena: {0} zł", product.cena.ToString()));
                string tmp1 = Producenci.Where(p => p.id_producent.ToString() == product.id_producent.ToString()).Select(p => p.nazwa).First();

                listTmp.Add(string.Format("Producent: {0}", tmp1));
                string tmp = Problemy.Where(p => p.id_problem.ToString() == Rozwiazywany.Where(r => r.id_typ == product.id_typ).Select(r => r.id_problem.ToString()).First()).Select(p => p.nazwa).First();
                listTmp.Add(string.Format("Rozwiązuje problem: {0}", tmp));
                if (product.weganski != 0)
                    listTmp.Add(string.Format("Jest wegański: Tak"));
                else
                    listTmp.Add(string.Format("Jest wegański: Nie"));

            }
            catch (System.InvalidOperationException) { }
            return listTmp;


        }

        public ObservableCollection<Produkt> selectProducts(string shop = "Dostępność", string type = "Typ produktu", string vegan = "Wszystkie", string country = "Kraj", string name = "", string orderType = "")
        {

            ObservableCollection<Produkt> wynik = Produkty;
            if (!shop.ToLower().Contains("dostępność"))
            {
                var _tmp = Sklepy.Where(tmp => tmp.nazwa.ToString() == shop).Select(tmp => tmp.id_sklep).ToList();

                var _tmp1 = JestDostepny.Where(tmp => _tmp.Contains(tmp.id_sklep)).Select(tmp => tmp.id_produkt).ToList();
                wynik = new ObservableCollection<Produkt>(wynik.Where(w => _tmp1.Contains(w.id_produkt))); //id sklepu
            }
            if (!type.ToLower().Contains("typ produktu"))
            {
                var _tmp = Typy.Where(tmp => tmp.typ.ToString() == type).Select(tmp => tmp.id_typ).ToList();
                wynik = new ObservableCollection<Produkt>(wynik.Where(w => _tmp.Contains(w.id_typ))); //id typu
            }



            if (!vegan.ToLower().Contains("wszystkie"))
            {
                int _vegan;
                if (vegan.ToLower() == "niewegański")
                {
                    _vegan = 0;

                }
                else
                {
                    _vegan = 1;
                }

                wynik = new ObservableCollection<Produkt>(wynik.Select(w => w).Where(w => w.weganski.Equals(_vegan)));
            }
            if (!country.ToLower().Contains("kraj"))
            {
                var _tmp = Producenci.Where(tmp => tmp.kraj.ToString() == country).Select(tmp => tmp.id_producent).ToList();
                wynik = new ObservableCollection<Produkt>(wynik.Select(w => w).Where(w => _tmp.Contains(w.id_producent))); //id typu

            }

            if (name.Length != 0)
            {
                wynik = new ObservableCollection<Produkt>(wynik.Select(w => w).Where(w => w.nazwa.ToLower().Contains(name.ToLower())));

            }

            if (orderType.ToLower().Contains("malejąco") || orderType.ToLower().Contains("najdroższe"))
            {
                return new ObservableCollection<Produkt>(wynik.Select(w => w).OrderByDescending(w => w.cena));

            }
            else if (orderType.ToLower().Contains("rosnąco") || orderType.ToLower().Contains("najtańsze"))
            {
                return new ObservableCollection<Produkt>(wynik.Select(w => w).OrderBy(w => w.cena));
            }
            else
            {
                Random rand = new Random();
                int toSkip = rand.Next(0, wynik.Count);
                return new ObservableCollection<Produkt>(wynik.Select(w => w).Skip(toSkip));
            }


        }

        public List<string> showHairCareProducts(string TypeOfMask, string shop = "Dostępność", string type = "Typ produktu", string vegan = "Wszystkie", string country = "Kraj", string name = "", string orderType = "", bool wcierka = false, bool peeling = false)
        {
            List<string> list = new List<string>();
            ObservableCollection<Produkt> tmp = new ObservableCollection<Produkt>(selectProducts(shop, "Szampon delikatny", vegan, country, name, orderType));
            string wynik;
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", "Szampon łagodny", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla Szampon delikatny spełniającej powyższe filtry. Spróbuj jeszcze raz";
            list.Add(wynik);

            tmp = selectProducts(shop, "Szampon rypacz", vegan, country, name, orderType);
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", "Szampon rypacz", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla produktu Szampon rypacz spełniającej powyższe filtry. Spróbuj jeszcze raz";

            list.Add(wynik);

            tmp = selectProducts(shop, "Odzywka proteinowa", vegan, country, name, orderType);
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", "Odzywka proteinowa", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla produktu Odzywka proteinowa spełniającej powyższe filtry. Spróbuj jeszcze raz";


            list.Add(wynik);

            tmp = selectProducts(shop, "Odzywka emolientowa", vegan, country, name, orderType);
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", "Odzywka emolientowa", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla produktu Odzywka emolientowa spełniającej powyższe filtry. Spróbuj jeszcze raz";


            list.Add(wynik);

            tmp = selectProducts(shop, "Odzywka humektantowa", vegan, country, name, orderType);
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", "Odzywka humektantowa", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla produktu Odzywka humektantowa spełniającej powyższe filtry. Spróbuj jeszcze raz";


            list.Add(wynik);

            tmp = selectProducts(shop, TypeOfMask, vegan, country, name, orderType);
            if (tmp.ToList().Count > 0)
                wynik = String.Format("{0}\t{1}\t{2} zł", TypeOfMask, tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
            else
                wynik = "Ups... Nie znaleziono pozycji dla produktu " + TypeOfMask + " spełniającej powyższe filtry. Spróbuj jeszcze raz";


            list.Add(wynik);



            if (wcierka)
            {
                tmp = selectProducts(shop, "Wcierka", vegan, country, name, orderType);
                if (tmp.ToList().Count > 0)
                    wynik = String.Format("{0}\t{1}\t{2} zł", "Wcierka", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
                else
                    wynik = "Ups... Nie znaleziono pozycji dla produktu Wcierka spełniającej powyższe filtry. Spróbuj jeszcze raz";

                list.Add(wynik);
            }

            if (peeling)
            {
                tmp = selectProducts(shop, "Peeling", vegan, country, name, orderType);
                if (tmp.ToList().Count > 0)
                    wynik = String.Format("{0}\t{1}\t{2} zł", "Peeling", tmp.Select(t => t.nazwa).First(), tmp.Select(t => t.cena).First());
                else
                    wynik = "Ups... Nie znaleziono pozycji dla produktu Peeling spełniającej powyższe filtry. Spróbuj jeszcze raz";

                list.Add(wynik);
            }
            return list;

        }
    }
}
