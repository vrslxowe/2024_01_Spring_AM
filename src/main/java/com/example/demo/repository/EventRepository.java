package com.example.demo.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.DiaryEvent;

@Mapper
public interface EventRepository {

	 @Insert("""
	            INSERT INTO Diary_Event
	            SET
	            user_id = #{userId},
	            event_name = #{eventName},
	            event_type = #{eventType},
	            event_color = #{eventColor},
	            created_at = #{createdAt}, -- Include the createdAt parameter
	            updated_at = CURRENT_TIMESTAMP
	            """)
	    public void createEvent(int userId, String eventName, String eventType, String eventColor, LocalDateTime createdAt);
	 
    @Select("SELECT * FROM Diary_Event WHERE event_id = #{eventId}")
    public DiaryEvent getEventById(int eventId);

    @Update("""
            UPDATE Diary_Event
            SET
            event_name = #{eventName},
            event_type = #{eventType},
            event_color = #{eventColor},
            updated_at = CURRENT_TIMESTAMP
            WHERE event_id = #{eventId}
            """)
    public void updateEvent(int eventId, String eventName, String eventType, String eventColor);

    @Delete("DELETE FROM Diary_Event WHERE event_id = #{eventId}")
    public void deleteEvent(int eventId);
    
    @Select("SELECT LAST_INSERT_ID()")
    public int getLastInsertId();

    @Select("SELECT * FROM Diary_Event")
    public List<DiaryEvent> getAllEvents();
}