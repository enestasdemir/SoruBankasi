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
import com.calisma.sorubankasi.Soru;

@Controller
public class SoruEkleController {
	
	DB db = new DB();

	@RequestMapping(value="/soruekle", method = RequestMethod.GET)
	public String soruekle(Model model) {
		List<Soru> ls = soruDoldur();
		if (ls.size() > 0) {
			model.addAttribute("ls", ls);
		}
		return "soruekle";
	}
	
	@RequestMapping(value = "/sorual", method = RequestMethod.POST)
	public String sorual(@RequestParam String soru, Model model) {
		try {
			String q = "INSERT INTO sorular VALUES(null, '" + soru + "')";
			db.baglan().executeUpdate(q);
		} catch (Exception e) {
			System.err.println("Soru ekleme hatasi: " + e);
		}
		List<Soru> ls = soruDoldur();
		if (ls.size() > 0) {
			model.addAttribute("ls", ls);
		}
		return "redirect:/soruekle";
	}
	
	public List<Soru> soruDoldur() {
		List<Soru> ls = new ArrayList<Soru>();
		try {
			String q = "SELECT * FROM sorular";
			ResultSet rs = db.baglan().executeQuery(q);
			while (rs.next()) {
				Soru s = new Soru();
				s.setSid(rs.getString(1));
				s.setSoru(rs.getString(2));
				ls.add(s);
			}
		} catch (Exception e) {
			System.err.println("Soru getirme hatasi: " + e);
		}
		return ls;
	}
	
	@RequestMapping(value = "/sorusil/{ssid}", method = RequestMethod.GET)
	public String sorusil(@PathVariable String ssid) {
		String q = "DELETE FROM sorular WHERE sid = '"  + ssid + "'";
		try {
			int yaz = db.baglan().executeUpdate(q);
			if (yaz > 0) {
				System.out.println("Silme baþarýlý");
			}
		} catch (Exception e) {
			System.err.println("Silme baþarýsýz:" + e);
		}
		return "redirect:/soruekle";
	}
}
