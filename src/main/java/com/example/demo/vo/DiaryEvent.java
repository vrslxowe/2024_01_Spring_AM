package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiaryEvent {
	private int id;
    private String regDate;
    private String updateDate;
    private int memberId;
    private String title;
    private String body;
    private int hitCount;
    private int goodReactionPoint;
    private int badReactionPoint;

 // 추가된 필드
    private int extra__repliesCnt;
    private String extra__writer;

    // 추가된 필드
    private boolean userCanModify;
    private boolean userCanDelete;
}