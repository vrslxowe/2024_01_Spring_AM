<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
implementation 'org.springframework.boot:spring-boot-starter-oauth2-client'
    implementation 'org.springframework.boot:spring-boot-starter-security'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    compile 'com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.11.1'
    compile 'org.apache.commons:commons-lang3:3.11'
    compileOnly 'org.projectlombok:lombok'
    runtimeOnly 'com.h2database:h2'
    runtimeOnly 'mysql:mysql-connector-java'
<%@ include file="../common/head.jspf"%>


<script>
maniadb:
	  url: http://maniadb.com/api/search/
	  method: song
	  display: 10
	  apiKey: ${MANIADB_API_KEY}
	  version: 0.5
	  
// 24년 3월 20일을 "시험" 디데이로 추가
	    var testDday = moment();
	    var daysUntilTestDday = testDday.diff(moment(), 'days');
	    //var testDdayDiv = createElement("div", "event dday");
	    var testDdayText = daysUntilTestDday >= 0 ? "D-" + daysUntilTestDday + " 시험" : "D+" + Math.abs(daysUntilTestDday) + " 시험";
	    var testDdaySpan = createElement("span", "", testDdayText);
	    testDdayDiv.appendChild(testDdaySpan);
	    wrapper.appendChild(testDdayDiv);

//선택된 날짜를 기반으로 D-Day 번호를 업데이트하는 함수
	  function updateDday(selectedDate) {
		  var testDday = moment("2024-03-20");
		  var daysUntilTestDday = testDday.diff(moment(), 'days');
	   var daysUntilDday = dday.diff(selectedDate, 'days');
	   //var testDdayDiv = createElement("div", "event dday");
	   var ddayText = daysUntilDday >= 0 ? "D-" + daysUntilDday + " 시험" : "D+" + Math.abs(daysUntilDday) + " 시험";
	   var testDdaySpan = createElement("span", "", testDdayText);
	   document.getElementById('dday-display').innerText = ddayText;
	   testDdayDiv.appendChild(testDdaySpan);
	    wrapper.appendChild(testDdayDiv);
	  }

//선택된 날짜를 저장
	    var selectedDate = moment("2024-03-20"); // 예시 선택된 날짜

	    // 선택된 날짜와 현재 날짜 사이의 차이를 계산
	    var daysUntilSelectedDate = selectedDate.diff(moment(), 'days');

	    // 표시된 D-day 번호를 업데이트
	    var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + daysUntilSelectedDate + " 시험";
	    var ddaySpan = createElement("span", "", ddayText);
	    
	    events.forEach(function(ev) {
	        var div = createElement("div", "event");
	        var square = createElement("div", "event-category " + ev.color);
	        var span = createElement("span", "", ev.eventName);

	        div.appendChild(square);
	        div.appendChild(span);
	        wrapper.appendChild(div);
	    });
</script>

<%@ include file="../common/foot.jspf"%>