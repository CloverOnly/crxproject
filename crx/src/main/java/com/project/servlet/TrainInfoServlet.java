package com.project.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/trainInfo")
public class TrainInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=YOUR_SERVICE_KEY"); // Replace with your service key
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("depPlaceId", "UTF-8") + "=" + URLEncoder.encode("NAT010000", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId", "UTF-8") + "=" + URLEncoder.encode("NAT011668", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "=" + URLEncoder.encode("20230403", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("trainGradeCode", "UTF-8") + "=" + URLEncoder.encode("00", "UTF-8"));
        
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
        
        request.setAttribute("apiResponse", sb.toString());
        request.getRequestDispatcher("/trainInfo.jsp").forward(request, response);
    }
}
