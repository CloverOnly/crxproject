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
    
    //좌석예매 팝업
    @GetMapping("/seat.do")
    public String seat() {
        return "seat"; 
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