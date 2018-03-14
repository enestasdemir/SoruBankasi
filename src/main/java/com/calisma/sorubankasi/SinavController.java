package com.calisma.sorubankasi;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SinavController {

	DB db = new DB();

	static public int i = 1;
	int soruadet = 0;
	static List<Sonuc> sonuclar = new ArrayList<Sonuc>();
	static public int sayacDogru = 0, sayacYanlis = 0, sayacBos = 0;

	@RequestMapping(value = "/sinav/{sid}", method = RequestMethod.POST)
	public String siradaki_soru(@PathVariable int sid, @RequestParam(defaultValue = "BOŞ") String yanit, Model model) {
		soruSayisiGetir();
		sid--;
		Sonuc sp = new Sonuc();

		if (sid > 0) {
			sp.setYanit(yanit);
			List<Soru> osoru = siradakiSoru(String.valueOf(sid - 1));
			List<Secenek> osecenek = new SecenekEkleController().secenekGetir(osoru.get(0).getSid());

			if (yanit.equals("BOŞ")) {
				sp.setSonuc("BOŞ");
				sayacBos++;
				for (Secenek item : osecenek) {
					if (item.getDurum().equals("1")) {
						sp.setDogruYanit(item.getSecenek());
					}
				}
			} else {
				boolean k = false;
				for (Secenek item : osecenek) {

					if (item.getSecenek().equals(sp.getYanit())) {
						if (item.getDurum().equals("1")) {
							sp.setSonuc("DOÄ�RU");
							sayacDogru++;
							k = true;
						}

					}

					if (item.getDurum().equals("1")) {
						sp.setDogruYanit(item.getSecenek());
					}
				}
				if (k == false) {
					sp.setSonuc("YANLIŞ");
					sayacYanlis++;
				}

			}
		}
		sp.setSayi(String.valueOf(sid));
		sonuclar.add(sp);
		if (sid >= (soruadet)) {
			sonuclar.remove(0);
			model.addAttribute("sonuclar", sonuclar);
			model.addAttribute("sayacDogru", sayacDogru);
			model.addAttribute("sayacYanlis", sayacYanlis);
			model.addAttribute("sayacBos", sayacBos);

		} else {

			List<Soru> soru = siradakiSoru(String.valueOf(sid));
			List<Secenek> secenek = new SecenekEkleController().secenekGetir(soru.get(0).getSid());
			soruadet = soru.size();
			model.addAttribute("soru", soru);
			model.addAttribute("secenek", secenek);
			i++;
			model.addAttribute("i", i);
			model.addAttribute("sn", i - 1);
		}

		return "sinav";
	}

	public List<Soru> siradakiSoru(String ss) {
		List<Soru> soru = new ArrayList<Soru>();
		try {
			String q = "select * from sorular limit " + ss +", 1;";
			ResultSet rs = db.baglan().executeQuery(q);
			if (rs.next()) {
				Soru s = new Soru();
				s.setSid(rs.getString(1));
				s.setSoru(rs.getString(2));
				soru.add(s);
			}

		} catch (Exception e) {
			System.err.println("soru getirme hatasi " + e);
		}
		return soru;
	}

	public int soruSayisiGetir() {
		try {
			ResultSet rs = db.baglan().executeQuery("select COUNT(*) from sorular;");
			if (rs.next()) {
				soruadet = rs.getInt(1);
			}
		} catch (Exception e) {
			System.err.println("soru sayisini getirme hatasi " + e);
		}
		System.out.println(soruadet);
		return soruadet;
	}

	static public void sinavSifirla() {
		i = 1;
		sonuclar.clear();
		sayacDogru = 0;
		sayacYanlis = 0;
		sayacBos = 0;
	}

}
