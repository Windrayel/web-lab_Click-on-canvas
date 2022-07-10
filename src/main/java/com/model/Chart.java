package com.model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.LocalDateTime;
@Component
@Scope("Session")
public class Chart {
    private double X;
    private double Y;
    private double R;
    private boolean result;
    private String callTime;
    private double calcTime;

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getCallTime() {
        return callTime;
    }

    public void setCallTime(String callTime) {
        this.callTime = callTime;
    }

    public double getCalcTime() {
        return calcTime;
    }

    public void setCalcTime(double calcTime) {
        this.calcTime = calcTime;
    }

    public double getX() {
        return X;
    }

    public void setX(double x) {
        X = x;
    }

    public double getY() {
        return Y;
    }

    public void setY(double y) {
        Y = y;
    }

    public double getR() {
        return R;
    }

    public void setR(double z) {
        R = z;
    }
}
