package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.EventRepository;
import com.example.demo.vo.DiaryEvent;
@Service
public class EventService {

    @Autowired
    private EventRepository eventRepository;

    public void createEvent(int userId, String eventName, String eventType, String eventColor, LocalDateTime createdAt) {
        eventRepository.createEvent(userId, eventName, eventType, eventColor, createdAt);
    }

    public DiaryEvent getEventById(int eventId) {
        return eventRepository.getEventById(eventId);
    }

    public void updateEvent(int eventId, String eventName, String eventType, String eventColor) {
        eventRepository.updateEvent(eventId, eventName, eventType, eventColor);
    }

    public void deleteEvent(int eventId) {
        eventRepository.deleteEvent(eventId);
    }

    public List<DiaryEvent> getAllEvents() {
        return eventRepository.getAllEvents();
    }
}