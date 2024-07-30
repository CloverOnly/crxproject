package com.project.crx.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CrxControllerImpl {
	
	//일반예매
    @GetMapping("/ticket.do")
    public String ticket() {
        return "ticket"; 
    }
    
    //단체예매
    @GetMapping("/groupTicket.do")
    public String groupTicket() {
        return "groupTicket"; 
    }
    
    //역 명 조회 작은 팝업
    @GetMapping("/lookUp.do")
	public String lookUp() {
	    return "lookUp"; 
	}
	@GetMapping("/lookUp2.do")
	public String lookUp2() {
	    return "lookUp2"; 
	}
    
    //예약
    @GetMapping("/reservation.do")
    public String reservation() {
        return "reservation"; 
    }
    
    //결제
    @GetMapping("/payment.do")
    public String payment() {
        return "payment"; 
    }
    
    //발권
    @GetMapping("/ticketing.do")
    public String ticketing() {
        return "ticketing"; 
    }
    
    //예매관리
    @GetMapping("/management.do")
    public String management() {
        return "management"; 
    }
    
    //이용내역
    @GetMapping("/usageDetails.do")
    public String usageDetails() {
        return "usageDetails"; 
    }
    
    //환불
    @GetMapping("/refund.do")
    public String refund() {
        return "refund"; 
    }
    
    //환불완료
    @GetMapping("/refundEnd.do")
    public String refundEnd() {
        return "refundEnd"; 
    }
    
    //화천역
    @GetMapping("/hwacheon.do")
    public String hwacheon() {
        return "hwacheon"; 
    }
    //양구역
    @GetMapping("/yanggu.do")
    public String yanggu() {
        return "yanggu"; 
    }
    //인제역
    @GetMapping("/inje.do")
    public String inje() {
        return "inje"; 
    }
    //고성역
    @GetMapping("/goseong.do")
    public String goseong() {
        return "goseong"; 
    }
    //속초역
    @GetMapping("/sokcho.do")
    public String sokcho() {
        return "sokcho"; 
    }
    //양양역
    @GetMapping("/yangyang.do")
    public String yangyang() {
        return "yangyang"; 
    }
    
    //api
    @GetMapping("/trainInfo.do")
    public String getTrainInfo(
            @RequestParam(value = "depPlaceId", defaultValue = "NAT010000") String depPlaceId,
            @RequestParam(value = "arrPlaceId", defaultValue = "NAT011668") String arrPlaceId,
            @RequestParam(value = "depPlandTime", defaultValue = "20240730") String depPlandTime,
            @RequestParam(value = "trainGradeCode", defaultValue = "00") String trainGradeCode,
            Model model) {

        try {
            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo");
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=KOyx%2F5iXteTdFA1wcSF1KvBTsEQcHMa8cFsrBwLTM6EGpTydPaVEtn4IjjQrwiIxqBvpc%2Bqi4NM9izQQfHzT3w%3D%3D");
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("depPlaceId", "UTF-8") + "=" + URLEncoder.encode(depPlaceId, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("arrPlaceId", "UTF-8") + "=" + URLEncoder.encode(arrPlaceId, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "=" + URLEncoder.encode(depPlandTime, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("trainGradeCode", "UTF-8") + "=" + URLEncoder.encode(trainGradeCode, "UTF-8"));

            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");

            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            model.addAttribute("apiResponse", sb.toString());

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("apiResponse", "Error occurred while fetching train info.");
        }

        return "trainInfo"; // JSP 페이지의 이름
    }

    
    
    //테스트
    @GetMapping("/test.do")
    public String test() {
        return "test"; 
    }
    @GetMapping("/test2.do")
    public String test2() {
        return "test2"; 
    }
	@GetMapping("/test3.do")
	public String test3() {
	    return "test3"; 
	}
	@GetMapping("/test4.do")
	public String test4() {
	    return "test4"; 
	}
	
}