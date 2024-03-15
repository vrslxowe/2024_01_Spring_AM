package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {

    @Autowired
    private CalendarRepository calendarRepository;

    public List<DiaryEvent> getAllEvents() {
        return calendarRepository.findAll();
    }

 // CRUD 작업에 대한 다른 서비스 메서드들
}