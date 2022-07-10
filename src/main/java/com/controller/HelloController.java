package com.controller;

import com.model.Chart;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static java.lang.Math.sqrt;

@Controller
public class HelloController {

    @RequestMapping("/")
    public String hello() {
        return "main";
    }

    @RequestMapping(value = "/addPoint", method = RequestMethod.POST)
    public String add(Chart chart, BindingResult bindingResult, HttpServletRequest request){
        if (bindingResult.hasErrors())
            return "error";
        long start = System.nanoTime();


        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter myFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        chart.setCallTime(now.format(myFormat));

        ServletContext context = request.getServletContext();
        List<Chart> chartList = (List<Chart>) context.getAttribute("ChartList");
        if (chartList == null)
            chartList = new ArrayList<>();

        double x;
        double y;
        double r;

        try {
            x = chart.getX();
            y = chart.getY();
            r = chart.getR();
        } catch (Error e) {
            return "error";
        }

        List<Double> validR = Arrays.asList(1.0, 2.0, 3.0, 4.0, 5.0);
        if (!validR.contains(r) || y<-5 || y>3)
            return "error";

        boolean isInArea = (x >= -r && x <= 0 && y <= 0 && y >= -r/2)
                || (x >= -r/2 && x <= 0 && y >= 0 && y <= (r/2 + x))
                || (x >= 0 && x <= r && y >= 0 && y <= sqrt(r*r - x*x));
        chart.setResult(isInArea);
        chart.setCalcTime((System.nanoTime() - start) / Math.pow(10, 6));
        chartList.add(chart);
        context.setAttribute("ChartList", chartList);
        return "adding";
    }
}
