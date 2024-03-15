package com.example.demo.vo;

import java.time.LocalDateTime;

@Entity
@Table(name = "Diary_Event")
public class DiaryEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long eventId;

    private Long userId;

    private String eventName;

    private String eventType;

    private String eventColor;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    // Getters and setters
}