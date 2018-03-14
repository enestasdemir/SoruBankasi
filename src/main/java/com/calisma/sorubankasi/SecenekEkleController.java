package com.calisma.sorubankasi;

import java.sql.PreparedStatement;
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
public class SecenekEkleController {

	DB db = new DB();
	String soruID = "";

	@RequestMapping(value = "/secenekekle/{sesid}", method = RequestMethod.GET)
	public String secenekekle(@PathVariable String sesid, Model model) {
		soruID = sesid;
		System.out.println(soruID);
		List<Secenek> sls = secenekDoldur();
		if (sls.size() > 0) {
			model.addAttribute("sls", sls);
		}

		try {
			String q = "SELECT soru FROM sorular WHERE sid = '" + soruID + "'";
			ResultSet rs = db.baglan().executeQuery(q);
			if (rs.next()) {
				String secilen = rs.getString(1);
				model.addAttribute("soru", secilen);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "secenekekle";
	}

	@RequestMapping(value = "/secenekal", method = RequestMethod.POST)
	public String secenekal(@RequestParam String secenek, @RequestParam String yanit, Model model) {
		System.out.println(secenek);
		System.out.println(yanit);
		System.out.println(soruID);

		try {
			if (yanit.equals("1")) {
				String q = "INSERT INTO secenekler VALUES(null,'" + soruID + "','" + secenek + "',1)";
				System.out.println(q);
				int yaz = db.baglan().executeUpdate(q);
			} else {

				String q = "INSERT INTO secenekler VALUES(null,'" + soruID + "','" + secenek + "',0)";
				System.out.println(q);
				int yaz = db.baglan().executeUpdate(q);

			}

			String q = "SELECT soru FROM sorular WHERE sorular.sid = '" + soruID + "'";
			ResultSet rss = db.baglan().executeQuery(q);
			if (rss.next()) {
				String secilen = rss.getString(1);
				model.addAttribute("soru", secilen);

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			db.kapat();
		}

		return "redirect:/secenekekle/" + soruID + "";
	}

	public List<Secenek> secenekDoldur() {
		List<Secenek> sls = new ArrayList<Secenek>();
		try {
			String q = "SELECT * FROM secenekler as sec\r\n" + "INNER JOIN sorular as sor\r\n"
					+ "ON sec.sid = sor.sid\r\n" + "WHERE sor.sid = '" + soruID + "';";
			ResultSet rs = db.baglan().executeQuery(q);
			while (rs.next()) {
				Secenek s = new Secenek();
				s.setSeid(rs.getString(1));
				s.setSecenek(rs.getString(3));
				s.setDurum(rs.getString(4));
				sls.add(s);
			}
		} catch (Exception e) {
			System.err.println("Secenek getirme hatasi: " + e);
		}
		return sls;
	}

	@RequestMapping(value = "/seceneksil/{sesilid}", method = RequestMethod.GET)
	public String seceneksil(@PathVariable String sesilid) {
		String q = "DELETE FROM secenekler WHERE seid = '" + sesilid + "'";
		try {
			int yaz = db.baglan().executeUpdate(q);
			if (yaz > 0) {
				System.out.println("Silme baþarýlý");
			}
		} catch (Exception e) {
			System.err.println("Silme baþarýsýz:" + e);
		}
		return "redirect:/secenekekle/" + soruID + "";
	}

	public List<Secenek> secenekGetir(String sid) {
		List<Secenek> sl = new ArrayList<Secenek>();
		try {
			String q = "	select se.seid,se.secenek,se.durum from secenekler as se\r\n" + 
					"	inner JOIN sorular as s\r\n" + 
					"	on  s.sid=se.sid\r\n" + 
					"	where s.sid= '" + sid + "' ;";
			ResultSet rs = db.baglan().executeQuery(q);
			while (rs.next()) {
				Secenek s = new Secenek();
				s.setSeid(rs.getString(1));
				s.setSecenek(rs.getString(2));
				s.setDurum(rs.getString(3));
				sl.add(s);
			}

		} catch (Exception e) {
			System.err.println("secenek getirme hatasi " + e);
		}
		return sl;
	}

}
