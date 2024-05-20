<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="My Schedule"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<script>

!(function () {
	  var today = moment();

	  // 캘린더 생성자 함수 정의
	  function Calendar(selector, events) {
	    this.el = document.querySelector(selector);
	    this.events = events;
	    this.current = moment().date(1);
	    this.draw();
	    var current = document.querySelector(".today");
	    if (current) {
	      var self = this;
	      window.setTimeout(function () {
	        self.openDay(current);
	      }, 500);
	    }
	    // 페이지 로드 시 이벤트를 모두 표시하는 함수 호출
	    this.showAllEvents();
	  }

	  // 캘린더 그리기 함수
	  Calendar.prototype.draw = function () {
	    // 헤더 생성
	    this.drawHeader();

	    // 달 그리기
	    this.drawMonth();
	  };

	  // 헤더 그리기 함수
	  Calendar.prototype.drawHeader = function () {
	    var self = this;
	    if (!this.header) {
	      // 헤더 요소 생성
	      this.header = createElement("div", "header");
	      this.header.className = "header";

	      this.title = createElement("h1");

	      var right = createElement("div", "right");
	      right.addEventListener("click", function () {
	        self.nextMonth();
	      });

	      var left = createElement("div", "left");
	      left.addEventListener("click", function () {
	        self.prevMonth();
	      });

	      // 요소 추가
	      this.header.appendChild(this.title);
	      this.header.appendChild(right);
	      this.header.appendChild(left);
	      this.el.appendChild(this.header);
	    }

	    this.title.innerHTML = this.current.format("MMM YYYY");
	  };

	  // 달 그리기 함수
	  Calendar.prototype.drawMonth = function () {
	    var self = this;

	    // 이벤트를 각 날짜에 랜덤하게 배치
	    this.events.forEach(function (ev) {
	      ev.date = self.current.clone().date(Math.random() * (29 - 1) + 1);
	    });

	    // 이미 존재하는 경우 이전 달에 대한 처리
	    if (this.month) {
	      this.oldMonth = this.month;
	      this.oldMonth.className = "month out " + (self.next ? "next" : "prev");
	      this.oldMonth.addEventListener("webkitAnimationEnd", function () {
	        self.oldMonth.parentNode.removeChild(self.oldMonth);
	        self.month = createElement("div", "month");
	        self.backFill();
	        self.currentMonth();
	        self.fowardFill();
	        self.el.appendChild(self.month);
	        window.setTimeout(function () {
	          self.month.className = "month in " + (self.next ? "next" : "prev");
	        }, 16);
	      });
	    } else {
	      // 새로운 달 생성
	      this.month = createElement("div", "month");
	      this.el.appendChild(this.month);
	      this.backFill();
	      this.currentMonth();
	      this.fowardFill();
	      this.month.className = "month new";
	    }
	  };

	  // 이전 달 채우기 함수
	  Calendar.prototype.backFill = function () {
	    var clone = this.current.clone();
	    var dayOfWeek = clone.day();

	    if (!dayOfWeek) {
	      return;
	    }

	    clone.subtract("days", dayOfWeek + 1);

	    for (var i = dayOfWeek; i > 0; i--) {
	      this.drawDay(clone.add("days", 1));
	    }
	  };

	  // 다음 달 채우기 함수
	  Calendar.prototype.fowardFill = function () {
	    var clone = this.current.clone().add("months", 1).subtract("days", 1);
	    var dayOfWeek = clone.day();

	    if (dayOfWeek === 6) {
	      return;
	    }

	    for (var i = dayOfWeek; i < 6; i++) {
	      this.drawDay(clone.add("days", 1));
	    }
	  };

	  // 현재 달 그리기 함수
	  Calendar.prototype.currentMonth = function () {
	    var clone = this.current.clone();

	    while (clone.month() === this.current.month()) {
	      this.drawDay(clone);
	      clone.add("days", 1);
	    }
	  };

	  // 주 단위 요소 생성 함수
	  Calendar.prototype.getWeek = function (day) {
	    if (!this.week || day.day() === 0) {
	      this.week = createElement("div", "week");
	      this.month.appendChild(this.week);
	    }
	  };

	  // 주단위 요일 이름 배열
	  var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

	  // 요일 레이블 생성 함수
	  Calendar.prototype.drawWeekdays = function () {
	    var weekdaysRow = createElement("div", "weekdays-row");
	    weekdays.forEach(function (weekday) {
	      var weekdayLabel = createElement("div", "weekday-label", weekday);
	      weekdaysRow.appendChild(weekdayLabel);
	    });
	    this.el.appendChild(weekdaysRow);
	  };

	  // 날짜 그리기 함수
	  Calendar.prototype.drawDay = function (day) {
	    var self = this;
	    this.getWeek(day);

	    // 날짜 외부 요소 생성
	    var outer = createElement("div", this.getDayClass(day));
	    outer.addEventListener("click", function () {
	      self.openDay(this);
	    });

	    // 날짜
	    var number = createElement("div", "day-number", day.format("DD"));

	    // 이벤트
	    var events = createElement("div", "day-events");
	    this.drawEvents(day, events);

	    outer.appendChild(number);
	    outer.appendChild(events);
	    this.week.appendChild(outer);
	  };

	  // 날짜에 해당하는 이벤트 그리기 함수
	  Calendar.prototype.drawEvents = function (day, element) {
	    if (day.month() === this.current.month()) {
	      var todaysEvents = this.events.reduce(function (memo, ev) {
	        if (ev.date.isSame(day, "day")) {
	          memo.push(ev);
	        }
	        return memo;
	      }, []);

	      todaysEvents.forEach(function (ev) {
	        var evSpan = createElement("span", ev.color);
	        element.appendChild(evSpan);
	      });
	    }
	  };

	  // 날짜에 따른 클래스 설정 함수
	  Calendar.prototype.getDayClass = function (day) {
	    classes = ["day"];
	    if (day.month() !== this.current.month()) {
	      classes.push("other");
	    } else if (today.isSame(day, "day")) {
	      classes.push("today");
	    }
	    return classes.join(" ");
	  };

	  // 기본적으로 페이지가 로드될 때 이벤트를 표시하는 함수
	  Calendar.prototype.showAllEvents = function () {
	    var self = this;
	    // 스크롤 가능한 컨테이너 생성
	    var scrollContainer = createElement("div", "scroll-container");
	    // 현재 월의 각 날짜에 대해 반복
	    var daysInMonth = this.current.daysInMonth();
	    for (var dayNumber = 1; dayNumber <= daysInMonth; dayNumber++) {
	      var day = this.current.clone().date(dayNumber);
	      var todaysEvents = this.events.filter(function (ev) {
	        return ev.date.isSame(day, "day");
	      });
	      // 전체 월에 대한 이벤트 표시
	      if (todaysEvents.length > 0) {
	        // 날짜에 해당하는 이벤트를 함께 표시하기 위해 scrollContainer에 날짜도 추가
	        var dayElement = createElement("div", "day-events-container");
	        var dayNumberElement = createElement(
	          "div",
	          "day-number",
	          day.format("DD")
	        );
	        dayElement.appendChild(dayNumberElement);
	        self.renderEvents(todaysEvents, dayElement);
	        scrollContainer.appendChild(dayElement);
	      }
	    }
	    // 스크롤 가능한 컨테이너를 캘린더 요소의 오른쪽에 추가
	    this.el.parentNode.insertBefore(scrollContainer, this.el.nextSibling);
	  };

	  // 날짜 클릭 시 상세 정보 표시 함수
	  Calendar.prototype.openDay = function (el) {
	    var details, arrow;
	    var dayNumber =
	      +el.querySelector(".day-number").innerText ||
	      +el.querySelector(".day-number").textContent;
	    var day = this.current.clone().date(dayNumber);

	    // Find the currently opened detail window, if any
	    var currentOpened = document.querySelector(".details");

	    // Only open the detail window if it's not already open for the clicked date
	    if (!currentOpened || currentOpened.parentNode !== el.parentNode) {
	      // Close any previously opened detail window
	      if (currentOpened) {
	        currentOpened.addEventListener("animationend", function () {
	          if (currentOpened.parentNode) {
	            currentOpened.parentNode.removeChild(currentOpened);
	          }
	        });
	        currentOpened.className = "details out";
	      }

	      // Create a new detail window
	      details = createElement("div", "details in");
	      arrow = createElement("div", "arrow");
	      var eventsWrapper = createElement("div", "events");

	      details.appendChild(arrow);
	      details.appendChild(eventsWrapper);

	      // Add the detail window to the body element
	      document.body.appendChild(details);

	      // Position the detail window
	      details.style.right = "140px";
	      details.style.top = "50px";
	      details.style.position = "fixed";

	      // Find events for the clicked day
	      var todaysEvents = this.events.filter(function (ev) {
	        return ev.date.isSame(day, "day");
	      });

	      // Render events for the clicked day
	      this.renderEvents(todaysEvents, eventsWrapper);

	      // Position the arrow
	      arrow.style.left = el.offsetLeft - el.parentNode.offsetLeft + 27 + "px";
	    }
	  };

	  // 이벤트 렌더링 함수
	  Calendar.prototype.renderEvents = function (events, ele) {
	    // 현재 상세 정보 요소에 있는 이벤트 제거
	    var currentWrapper = ele.querySelector(".events");
	    var wrapper = createElement(
	      "div",
	      "events in" + (currentWrapper ? " new" : "")
	    );

	    events.forEach(function (ev) {
	      var div = createElement("div", "event");
	      var square = createElement("div", "event-category " + ev.color);
	      var span = createElement("span", "", ev.eventName);

	      div.appendChild(square);
	      div.appendChild(span);
	      wrapper.appendChild(div);
	    });

	    if (!events.length) {
	      var div = createElement("div", "event empty");
	      var span = createElement("span", "", "No Events");

	      div.appendChild(span);
	      wrapper.appendChild(div);
	    }

	    if (currentWrapper) {
	      currentWrapper.className = "events out";
	      currentWrapper.addEventListener("animationend", function () {
	        if (currentWrapper.parentNode) {
	          currentWrapper.parentNode.removeChild(currentWrapper);
	        }
	      });
	    }

	    ele.appendChild(wrapper);
	  };

	  // 다음 달로 이동 함수
	  Calendar.prototype.nextMonth = function () {
	    this.current.add("months", 1);
	    this.next = true;
	    this.draw();
	  };

	  // 이전 달로 이동 함수
	  Calendar.prototype.prevMonth = function () {
	    this.current.subtract("months", 1);
	    this.next = false;
	    this.draw();
	  };

	  window.Calendar = Calendar;

	  function createElement(tagName, className, innerText) {
	    var ele = document.createElement(tagName);
	    if (className) {
	      ele.className = className;
	    }
	    if (innerText) {
	      ele.innerText = ele.textContent = innerText;
	    }
	    return ele;
	  }
	})();

	!(function () {
	  var data = [
	    { eventName: "Lunch Meeting w/ Mark", calendar: "Work", color: "orange" },
	    {
	      eventName: "Interview - Jr. Web Developer",
	      calendar: "Work",
	      color: "orange"
	    },
	    {
	      eventName: "Demo New App to the Board",
	      calendar: "Work",
	      color: "orange"
	    },
	    { eventName: "Dinner w/ Marketing", calendar: "Work", color: "orange" },

	    { eventName: "Game vs Portalnd", calendar: "Sports", color: "gray" },
	    { eventName: "Game vs Houston", calendar: "Sports", color: "gray" },
	    { eventName: "Game vs Denver", calendar: "Sports", color: "gray" },
	    { eventName: "Game vs San Degio", calendar: "Sports", color: "gray" },

	    { eventName: "School Play", calendar: "Kids", color: "gray" },
	    {
	      eventName: "Parent/Teacher Conference",
	      calendar: "Kids",
	      color: "gray"
	    },
	    {
	      eventName: "Pick up from Soccer Practice",
	      calendar: "Kids",
	      color: "gray"
	    },
	    { eventName: "Ice Cream Night", calendar: "Kids", color: "orange" },

	    { eventName: "Free Tamale Night", calendar: "Other", color: "orange" },
	    { eventName: "Bowling Team", calendar: "Other", color: "orange" },
	    { eventName: "Teach Kids to Code", calendar: "Other", color: "orange" },
	    { eventName: "Startup Weekend", calendar: "Other", color: "orange" }
	  ];

	  function addDate(ev) {}

	  // draw 함수 내부
	  Calendar.prototype.draw = function () {
	    // 먼저 헤더를 표시
	    this.drawHeader();

	    // 주단위 요일 이름 그리기
	    this.drawWeekdays();

	    // 그다음, 달을 표시
	    this.drawMonth();
	  };

	  var calendar = new Calendar("#calendar", data);
	})();

</script>

<header class="header">
	<button class="logo">로고</button>
	<nav class="header_menu">
		<a href="../member/myInfo">
			<button class="username">abc123님</button>
		</a>
		<button class="hd_info">학회 정보</button>
		<button class="hd_contest">공모전</button>
		<a href="../member/myQuestion">
			<button class="hd_question">문의사항</button>
		</a>
		<button class="hd_logout">로그아웃</button>
	</nav>
</header>

<div class="img"></div>
<div class="menu_box1 left">
	<div class="mypage">마이 페이지</div>
</div>
<div class="right">
	<a href="../member/mySchedule">
		<button class="menu_box2 myschedule">내 일정</button>
	</a> <a href="../member/myInfo">
		<button class="menu_box2 myinfo">내 정보</button>
	</a> <a href="../member/myQuestion">
		<button class="menu_box2 myquestion">내 문의</button>
	</a>
</div>

<div id="calendar"></div>

<style>
body {
	width: 100%;
	hight: 130%;
	margin: 0;
	padding: 0;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin: 17px auto 0;
	padding: 0 20px;
	gap: 20px;
}

.logo {
	text-align: center;
}

.header_menu {
	display: flex;
	gap: 20px;
}

.hd_logout {
	font-size: 12.5px;
}

.username {
	flex-grow: 1;
}

.img {
	position: absolute;
	width: 100%;
	height: 150px;
	left: 0px;
	top: 57px;
	background:
		url('https://velog.velcdn.com/images/vrslxowe/post/1ddba4e8-b0c3-4c29-8ed7-332eb6c06820/image.jpg')
		no-repeat;
	background-size: cover;
}

.menu_box1, .menu_box2 {
	border-radius: 18px;
	background: #f9b563;
	text-align: center;
	display: inline-block;
	box-shadow: 4px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

.menu_box1 {
	width: 130px;
	height: 80px;
	font-size: 17px;
	line-height: 82px;
}

.menu_box2 {
	width: 110px;
	height: 70px;
	font-size: 16px;
	margin-right: 100px;
	line-height: 72px;
}

.menu_box2:last-child {
	margin-right: 0;
	/* 마지막 요소의 오른쪽 마진 제거 */
}

.left {
	position: absolute;
	left: 112.5px;
	top: 155px;
}

.right {
	display: flex;
	gap: 100px;
	position: absolute;
	right: 112.5px;
	top: 165px;
}

/* 캘린더 컨테이너 */
#calendar {
  transform: none;
  position: relative;
  left: -200px;
  width: 600px;
  height: 750px;
  margin: 0 auto;
  overflow: hidden;
}

/* 스크롤 가능한 영역에 스타일 적용 */
.scroll-container {
  overflow-y: auto; /* 수직 스크롤 활성화 */
  max-height: 100px; /* 필요한 만큼 최대 높이 조정 */
}

/* 헤더 */
.header {
  height: 50px;
  width: 150px;
  text-align: center;
  position: relative;
  z-index: 100;
}

/* 헤더 제목 */
.header h1 {
  margin: 0;
  padding: 0;
  font-size: 1em;
  font-weight: 400;
  line-height: 50px;
  letter-spacing: 1px;
  text-shadow: 5px 5px 30px rgba(0, 0, 0, 0.25);
}

/* 네비게이션 화살표 */
.left,
.right {
  position: absolute;
  width: 0px;
  height: 0px;
  border-style: solid;
  top: 50%;
  margin-top: -7.5px;
  cursor: pointer;
}

/* 왼쪽 화살표 */
.left {
  border-width: 7.5px 10px 7.5px 0;
  border-color: transparent rgba(160, 159, 160, 1) transparent transparent;
  left: 20px;
}

/* 오른쪽 화살표 */
.right {
  border-width: 7.5px 0 7.5px 10px;
  border-color: transparent transparent transparent rgba(160, 159, 160, 1);
  right: 20px;
}

/* 월 컨테이너 */
.month {
  /*overflow: hidden;*/
  opacity: 0;
  color: #434343;
}

/* 새로운 월 애니메이션 */
.month.new {
  -webkit-animation: fadeIn 1s ease-out;
  opacity: 1;
}

/* 다음 월 애니메이션 */
.month.in.next {
  -webkit-animation: moveFromTopFadeMonth 0.4s ease-out;
  -moz-animation: moveFromTopFadeMonth 0.4s ease-out;
  animation: moveFromTopFadeMonth 0.4s ease-out;
  opacity: 1;
  color: red;
}

/* 다음 월 나가기 애니메이션 */
.month.out.next {
  -webkit-animation: moveToTopFadeMonth 0.4s ease-in;
  -moz-animation: moveToTopFadeMonth 0.4s ease-in;
  animation: moveToTopFadeMonth 0.4s ease-in;
  opacity: 1;
  color: yellow;
}

/* 이전 월 입장 애니메이션 */
.month.in.prev {
  -webkit-animation: moveFromBottomFadeMonth 0.4s ease-out;
  -moz-animation: moveFromBottomFadeMonth 0.4s ease-out;
  animation: moveFromBottomFadeMonth 0.4s ease-out;
  opacity: 1;
  color: pink;
}

/* 이전 월 나가기 애니메이션 */
.month.out.prev {
  -webkit-animation: moveToBottomFadeMonth 0.4s ease-in;
  -moz-animation: moveToBottomFadeMonth 0.4s ease-in;
  animation: moveToBottomFadeMonth 0.4s ease-in;
  opacity: 1;
  color: purple;
}

/* 날짜 */
.day {
  display: inline-block;
  width: 85.7px;
  height: 108.3px;
  padding: 10px;
  text-align: center;
  vertical-align: top;
  cursor: pointer;
  position: relative;
  z-index: 2;
  border: 1px solid #ccc;
}
.weekday-label {
  height: 50px;
  display: inline-block;
  width: 85.7px;
  padding: 10px;
  text-align: center;
  vertical-align: top;
  position: relative;
  z-index: 2;
  border: 1px solid #ccc;
}

/* 다른 달의 날짜 */
.day.other {
  color: rgba(0, 0, 0, 0.1);
}

/* 오늘 날짜 */
.day.today {
  color: rgba(156, 202, 235, 1);
}

/* 요일 이름 */
.day-name {
  font-size: 9px;
  text-transform: uppercase;
  margin-bottom: 5px;
  letter-spacing: 0.7px;
}

/* 날짜 번호 */
.day-number {
  font-size: 24px;
  letter-spacing: 1.5px;
}

/* 날짜 이벤트 */
.day .day-events {
  list-style: none;
  margin-top: 3px;
  text-align: center;
  height: 12px;
  width: 20px;
  line-height: 6px;
  overflow: hidden;
}

/* 이벤트 동그라미 */
.day .day-events span {
  vertical-align: top;
  display: block;
  padding: 0;
  margin: 0;
  width: 8px;
  height: 8px;
  line-height: 5px;
  margin-bottom: 5px;
  border-radius: 5px;
}

/* 이벤트 카테고리 색상 */
.orange {
  background: rgba(247, 167, 0, 1);
}
.gray {
  background: rgba(119, 119, 119, 1);
}

/* 세부 정보 컨테이너 */
.details {
  position: relative;
  width: 300px;
  height: auto;
  top: 0;
  transform: translateY(-50%);
  right: -60%;
  background-color: pink;
}

/* 세부 정보 입장 애니메이션 */
.details.in {
  -webkit-animation: moveFromTopFade 0.5s ease both;
  -moz-animation: moveFromTopFade 0.5s ease both;
  animation: moveFromTopFade 0.5s ease both;
}

/* 세부 정보 나가기 애니메이션 */
.details.out {
  -webkit-animation: moveToTopFade 0.5s ease both;
  -moz-animation: moveToTopFade 0.5s ease both;
  animation: moveToTopFade 0.5s ease both;
}

/* 이벤트 목록 */
.events {
  height: 75px;
  padding: 7px 0;
  overflow-y: auto;
  overflow-x: hidden;
}

/* 이벤트 목록 입장 애니메이션 */
.events.in {
  -webkit-animation: fadeIn 0.3s ease both;
  -moz-animation: fadeIn 0.3s ease both;
  animation: fadeIn 0.3s ease both;
}

.events.in {
  -webkit-animation-delay: 0.3s;
  -moz-animation-delay: 0.3s;
  animation-delay: 0.3s;
}

/* 이벤트 목록 나가기 애니메이션 */
.details.out .events {
  -webkit-animation: fadeOutShrink 0.4s ease both;
  -moz-animation: fadeOutShink 0.4s ease both;
  animation: fadeOutShink 0.4s ease both;
}

/* 이벤트 목록 나가기 애니메이션 */
.events.out {
  -webkit-animation: fadeOut 0.3s ease both;
  -moz-animation: fadeOut 0.3s ease both;
  animation: fadeOut 0.3s ease both;
}

/* 이벤트 */
.event {
  font-size: 16px;
  line-height: 22px;
  letter-spacing: 0.5px;
  padding: 2px 16px;
  vertical-align: top;
}

/* 빈 이벤트 */
.event.empty {
  color: #777;
}

/* 이벤트 카테고리 */
.event-category {
  height: 10px;
  width: 10px;
  display: inline-block;
  margin: 6px 0 0;
  vertical-align: top;
  border-radius: 10px;
}

/* 이벤트 텍스트 */
.event span {
  display: inline-block;
  padding: 0 0 0 7px;
}

/* 이벤트 동그라미 */
.legend {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 30px;
  background: rgba(60, 60, 60, 1);
  line-height: 30px;
}

/* 이벤트 동그라미 항목 */
.entry {
  position: relative;
  padding: 0 0 0 25px;
  font-size: 13px;
  line-height: 30px;
  background: transparent;
}

/* 이벤트 동그라미 아이콘 */
.entry:after {
  position: absolute;
  content: "";
  height: 5px;
  width: 5px;
  top: 12px;
  left: 14px;
}

/* 회색 이벤트 아이콘 */
.entry.gray:after {
  background: rgba(119, 119, 119, 1);
}

/* 주황색 이벤트 아이콘 */
.entry.orange:after {
  background: rgba(247, 167, 0, 1);
}

/* 애니메이션 */
@-webkit-keyframes moveFromTopFade {
  from {
    opacity: 0.3;
    height: 0px;
    margin-top: 0px;
    -webkit-transform: translateY(-100%);
  }
}
@-moz-keyframes moveFromTopFade {
  from {
    height: 0px;
    margin-top: 0px;
    -moz-transform: translateY(-100%);
  }
}
@keyframes moveFromTopFade {
  from {
    height: 0px;
    margin-top: 0px;
    transform: translateY(-100%);
  }
}

@-webkit-keyframes moveToTopFade {
  to {
    opacity: 0.3;
    height: 0px;
    margin-top: 0px;
    opacity: 0.3;
    -webkit-transform: translateY(-100%);
  }
}
@-moz-keyframes moveToTopFade {
  to {
    height: 0px;
    -moz-transform: translateY(-100%);
  }
}
@keyframes moveToTopFade {
  to {
    height: 0px;
    transform: translateY(-100%);
  }
}

@-webkit-keyframes moveToTopFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(-30%) scale(0.95);
  }
}
@-moz-keyframes moveToTopFadeMonth {
  to {
    opacity: 0;
    -moz-transform: translateY(-30%);
  }
}
@keyframes moveToTopFadeMonth {
  to {
    opacity: 0;
    -moz-transform: translateY(-30%);
  }
}

@-webkit-keyframes moveFromTopFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(30%) scale(0.95);
  }
}
@-moz-keyframes moveFromTopFadeMonth {
  from {
    opacity: 0;
    -moz-transform: translateY(30%);
  }
}
@keyframes moveFromTopFadeMonth {
  from {
    opacity: 0;
    -moz-transform: translateY(30%);
  }
}

@-webkit-keyframes moveToBottomFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(30%) scale(0.95);
  }
}
@-moz-keyframes moveToBottomFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(30%);
  }
}
@keyframes moveToBottomFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(30%);
  }
}

@-webkit-keyframes moveFromBottomFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(-30%) scale(0.95);
  }
}
@-moz-keyframes moveFromBottomFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(-30%);
  }
}
@keyframes moveFromBottomFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(-30%);
  }
}

@-webkit-keyframes fadeIn {
  from {
    opacity: 0;
  }
}
@-moz-keyframes fadeIn {
  from {
    opacity: 0;
  }
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
}

@-webkit-keyframes fadeOut {
  to {
    opacity: 0;
  }
}
@-moz-keyframes fadeOut {
  to {
    opacity: 0;
  }
}
@keyframes fadeOut {
  to {
    opacity: 0;
  }
}

@-webkit-keyframes fadeOutShink {
  to {
    opacity: 0;
    padding: 0px;
    height: 0px;
  }
}
@-moz-keyframes fadeOutShink {
  to {
    opacity: 0;
    padding: 0px;
    height: 0px;
  }
}
@keyframes fadeOutShink {
  to {
    opacity: 0;
    padding: 0px;
    height: 0px;
  }
}


</style>

<%@ include file="../common/foot.jspf"%>