<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Main"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<script>

<!-- 달력 그리기  -->
	!(function() {
		var today = moment();

		function Calendar(selector, events) {
			this.el = document.querySelector(selector);
			this.events = events;
			this.current = moment().date(1);
			this.draw();
			var current = document.querySelector(".today");
			if (current) {
				var self = this;
				window.setTimeout(function() {
					self.openDay(current);
				}, 500);
			}
		}

		Calendar.prototype.draw = function() {
			//헤더 생성
			this.drawHeader();

			//달 그리기
			this.drawMonth();
		};
		
		<!-- 달력 헤더 부분  -->
		
		Calendar.prototype.drawHeader = function() {
			var self = this;
			if (!this.header) {
				//헤더 요소 생성
				this.header = createElement("div", "header");
				this.header.className = "header";

				this.title = createElement("h1");

				var right = createElement("div", "right");
				right.addEventListener("click", function() {
					self.nextMonth();
				});

				var left = createElement("div", "left");
				left.addEventListener("click", function() {
					self.prevMonth();
				});

				//요소 추가
				this.header.appendChild(this.title);
				this.header.appendChild(right);
				this.header.appendChild(left);
				this.el.appendChild(this.header);
			}

			this.title.innerHTML = this.current.format("MMM YYYY");
		};
		<!-- 달력 월 부분  -->
		Calendar.prototype.drawMonth = function() {
			var self = this;

			this.events.forEach(function(ev) {
				ev.date = self.current.clone().date(
						Math.random() * (29 - 1) + 1);
			});

			if (this.month) {
				this.oldMonth = this.month;
				this.oldMonth.className = "month out "
						+ (self.next ? "next" : "prev");
				this.oldMonth
						.addEventListener(
								"webkitAnimationEnd",
								function() {
									self.oldMonth.parentNode
											.removeChild(self.oldMonth);
									self.month = createElement("div", "month");
									self.backFill();
									self.currentMonth();
									self.fowardFill();
									self.el.appendChild(self.month);
									window
											.setTimeout(
													function() {
														self.month.className = "month in "
																+ (self.next ? "next"
																		: "prev");
													}, 16);
								});
			} else {
				this.month = createElement("div", "month");
				this.el.appendChild(this.month);
				this.backFill();
				this.currentMonth();
				this.fowardFill();
				this.month.className = "month new";
			}
		};
		<!-- 월 시작 부분과 끝난 부분에 전 달, 다음 달 날짜로 채움 -->
		Calendar.prototype.backFill = function() {
			var clone = this.current.clone();
			var dayOfWeek = clone.day();

			if (!dayOfWeek) {
				return;
			}

			clone.subtract(dayOfWeek + 1, "days");

			for (var i = dayOfWeek; i > 0; i--) {
				this.drawDay(clone.add(1, "days"));
			}
		};

		Calendar.prototype.fowardFill = function() {
			var clone = this.current.clone().add(1, "months").subtract(1, "days");
			var dayOfWeek = clone.day();

			if (dayOfWeek === 6) {
				return;
			}

			for (var i = dayOfWeek; i < 6; i++) {
				this.drawDay(clone.add(1, "days"));
			}
		};
		<!-- 달력을 주단위로 나눠서 표시 -->
		Calendar.prototype.currentMonth = function() {
			var clone = this.current.clone();

			while (clone.month() === this.current.month()) {
				this.drawDay(clone);
				clone.add(1, "days");
			}
		};

		Calendar.prototype.getWeek = function(day) {
			if (!this.week || day.day() === 0) {
				this.week = createElement("div", "week");
				this.month.appendChild(this.week);
			}
		};
		<!-- 달력의 각 날짜를 그려주고 해당 날짜의 이벤트를 표시  -->
		Calendar.prototype.drawDay = function(day) {
			var self = this;
			this.getWeek(day);

			//날짜를 감싸는 외부 요소
			var outer = createElement("div", this.getDayClass(day));
			outer.addEventListener("click", function() {
				self.openDay(this);
			});

			//날짜 이름 요소
			var name = createElement("div", "day-name", day.format("ddd"));

			//날짜 숫자 요소
			var number = createElement("div", "day-number", day.format("DD"));

			//이벤트 요소
			var events = createElement("div", "day-events");
			this.drawEvents(day, events);

			outer.appendChild(name);
			outer.appendChild(number);
			outer.appendChild(events);
			this.week.appendChild(outer);
		};
		<!-- 특정 날짜에 해당하는 이벤트를 그리고 이를 해당 엘리먼트에 추가  -->
		Calendar.prototype.drawEvents = function(day, element) {
			if (day.month() === this.current.month()) {
				var todaysEvents = this.events.reduce(function(memo, ev) {
    	if (moment(ev.date).isSame(day, "day")) { // ev.date를 moment 객체로 변환하여 사용
       	 	memo.push(ev);
   		 }
   		 return memo;
		}, []);

		todaysEvents.forEach(function(ev) {
			var evSpan = createElement("span", ev.color);
			element.appendChild(evSpan);
			});
		}
	};
		<!-- 각 날짜에 대한 클래스를 설정하고 반환, CSS를 통해 달력에서 각 날짜를 스타일링하는 데 사용  -->
		Calendar.prototype.getDayClass = function(day) {
			classes = [ "day" ];
			if (day.month() !== this.current.month()) {
				classes.push("other");
			} else if (today.isSame(day, "day")) {
				classes.push("today");
			}
			return classes.join(" ");
		};
		<!-- 특정 날짜를 클릭했을 때 해당 날짜의 이벤트를 표시하는 역할, 이벤트 상세정보 열고 닫기  -->
		Calendar.prototype.openDay = function(el) {
		    var dayNumber = +el.querySelector(".day-number").innerText || +el.querySelector(".day-number").textContent;
		    var day = moment().date(dayNumber); // 클릭한 날짜를 기준으로 D-Day 계산하려고 오늘 날짜 사용

		    var details = document.querySelector(".details");

		 // 클릭한 날짜의 세부 정보가 이미 열려 있는지 확인
		    if (details && details.parentNode === el.parentNode) {
		    	// 세부 정보가 이미 열려 있다면 디데이 업데이트
		        var ddayElement = details.querySelector(".event.dday span");
		        if (ddayElement) {
		            var daysUntilSelectedDate = day.diff(moment(), 'days');
		            var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + Math.abs(daysUntilSelectedDate) + " 시험";
		            ddayElement.textContent = ddayText;
		        }
		    } else {
		    	 // 세부 정보가 열려 있지 않으면 다른 열린 세부 정보를 닫고 클릭한 날짜의 세부 정보 열기
		        if (details) {
		            details.parentNode.removeChild(details);
		        }

		     // 클릭한 날짜에 해당하는 이벤트를 상세 정보로 표시, 화살표를 통해 해당 날짜를 가리키는 역할
		        // 상세 정보 컨테이너 생성
		        details = createElement("div", "details in");
		        var arrow = createElement("div", "arrow");
		        details.appendChild(arrow);
		        el.parentNode.appendChild(details);

		     // 클릭한 날짜에 대한 D-day 요소 생성
		        var ddayElement = createElement("span", "");
		        var ddayText = "D-Day 정보가 없습니다.";
		        var ddayDiv = createElement("div", "event dday");
		        ddayElement.textContent = ddayText;
		        ddayDiv.appendChild(ddayElement);
		        details.appendChild(ddayDiv);
		    }

		 // 클릭한 날짜에 대한 D-day 계산 및 업데이트
		    var ddayElement = details.querySelector(".event.dday span");
		    if (ddayElement) {
		        var daysUntilSelectedDate = day.diff(moment(), 'days');
		        var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + Math.abs(daysUntilSelectedDate) + " 시험";
		        ddayElement.textContent = ddayText;
		    }

		 // 클릭한 날짜에 대한 이벤트 렌더링
		    var todaysEvents = this.events.filter(function(ev) {
		        return moment(ev.date).isSame(day, "day");
		    });
		    this.renderEvents(todaysEvents, details, day); // 클릭된 날짜를 renderEvents에 전달

		    
		 // 화살표를 클릭한 날짜의 위치에 맞춤
		    var arrow = details.querySelector(".arrow");
		    if (arrow) {
		        arrow.style.left = el.offsetLeft - el.parentNode.offsetLeft + 27 + "px";
		    }
		};
		
		// 클릭한 날짜에 대한 이벤트 렌더링
		Calendar.prototype.renderEvents = function(events, ele, selectedDate) {
			// 세부 정보 요소에서 모든 이벤트를 제거
		    ele.innerHTML = "";

		 // 이벤트를 래핑할 요소를 생성
		    var wrapper = createElement("div", "events");

		    if (selectedDate) {
		        var daysUntilSelectedDate = selectedDate.diff(moment(), 'days');
		        var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + Math.abs(daysUntilSelectedDate) + " 시험";
		        var ddaySpan = createElement("span", "", ddayText);
		        var ddayDiv = createElement("div", "event dday");
		        ddayDiv.appendChild(ddaySpan);
		        wrapper.appendChild(ddayDiv);
		    }

		 // 이벤트를 래핑된 요소에 추가
		    events.forEach(function(ev) {
		    	var eventDiv = createElement("div", "event");
		        var squareDiv = createElement("div", "event-category " + ev.color);
		        var span = createElement("span", "", ev.eventName);
		        eventDiv.appendChild(squareDiv);
		        eventDiv.appendChild(span);
		        wrapper.appendChild(eventDiv);
		    });

		 // 이벤트가 없는 경우 메시지 표시
		    if (events.length === 0) {
		        var div = createElement("div", "event empty");
		        var span = createElement("span", "", "일정이 없습니다.");
		        div.appendChild(span);
		        wrapper.appendChild(div);
		    }

		 // 래핑된 요소를 세부 정보에 추가
		    ele.appendChild(wrapper);
		};
		
	<!-- 각 날짜에 대한 이벤트들이 상세 정보에 표시되고 상세 정보를 엘리먼트에 추가  -->
	// 클릭한 날짜에 대한 이벤트들을 상세 정보에 렌더링하고 상세 정보를 엘리먼트에 추가
	Calendar.prototype.renderEvents = function(events, ele, selectedDate) {
		// 이벤트를 래핑할 요소를 생성
	    var wrapper = createElement("div", "events in");

	 	// 현재 세부 정보 엘리먼트를 지움
	    ele.innerHTML = "";

		 // 클릭한 날짜로부터 D-day 계산하고 표시
	    var daysUntilSelectedDate = selectedDate.diff(moment(), 'days');
	    var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + Math.abs(daysUntilSelectedDate) + " 시험";
	    var ddaySpan = createElement("span", "", ddayText);
	    var ddayDiv = createElement("div", "event dday");
	    ddayDiv.appendChild(ddaySpan);
	    wrapper.appendChild(ddayDiv);

	 	// 이벤트를 래핑된 요소에 추가
	    events.forEach(function(ev) {
	        var div = createElement("div", "event");
	        var square = createElement("div", "event-category " + ev.color);
	        var span = createElement("span", "", ev.eventName);

	        div.appendChild(square);
	        div.appendChild(span);
	        wrapper.appendChild(div);
	    });

	 	// 이벤트가 없는 경우 메시지 표시
	    if (events.length === 0) {
	        var div = createElement("div", "event empty");
	        var span = createElement("span", "", "일정이 없습니다.");
	        div.appendChild(span);
	        wrapper.appendChild(div);
	    }

	 // 래핑된 요소를 세부 정보 엘리먼트에 추가
	    ele.appendChild(wrapper);
	};

		<!-- 현재 달력을 다음 달로 이동  -->
		Calendar.prototype.nextMonth = function() {
			this.current.add(1, "months");
			this.next = true;
			this.draw();
		};
		<!-- 현재 달력을 이전 달로 이동  -->
		Calendar.prototype.prevMonth = function() {
			this.current.subtract(1, "months");
			this.next = false;
			this.draw();
		};
		<!-- Calendar 객체에서 엘리먼트를 동적으로 생성하고 클래스를 추가하거나 텍스트를 설정하는 기능  -->
		window.Calendar = Calendar;

		function createElement(tagName, className, innerText) {
			var ele = document.createElement(tagName);
			if (className) {
				ele.className = className;
			}
			if (innerText) {
				ele.innderText = ele.textContent = innerText;
			}
			return ele;
		}
	})();
	
	<!-- 이벤트 데이터를 사용하여 캘린더 생성(이벤트 이름, 캘린더의 종류, 이벤트를 표시할 때 사용할 색)  -->
	!(function() {
		var data = [ {
			eventName : "Lunch Meeting w/ Mark",
			calendar : "Work",
			color : "orange"
		}, {
			eventName : "Interview - Jr. Web Developer",
			calendar : "Work",
			color : "orange"
		}, {
			eventName : "Demo New App to the Board",
			calendar : "Work",
			color : "orange"
		}, {
			eventName : "Dinner w/ Marketing",
			calendar : "Work",
			color : "orange"
		},

		{
			eventName : "Game vs Portalnd",
			calendar : "Sports",
			color : "blue"
		}, {
			eventName : "Game vs Houston",
			calendar : "Sports",
			color : "blue"
		}, {
			eventName : "Game vs Denver",
			calendar : "Sports",
			color : "blue"
		}, {
			eventName : "Game vs San Degio",
			calendar : "Sports",
			color : "blue"
		},

		{
			eventName : "School Play",
			calendar : "Kids",
			color : "yellow"
		}, {
			eventName : "Parent/Teacher Conference",
			calendar : "Kids",
			color : "yellow"
		}, {
			eventName : "Pick up from Soccer Practice",
			calendar : "Kids",
			color : "yellow"
		}, {
			eventName : "Ice Cream Night",
			calendar : "Kids",
			color : "yellow"
		},

		{
			eventName : "Free Tamale Night",
			calendar : "Other",
			color : "green"
		}, {
			eventName : "Bowling Team",
			calendar : "Other",
			color : "green"
		}, {
			eventName : "Teach Kids to Code",
			calendar : "Other",
			color : "green"
		}, {
			eventName : "Startup Weekend",
			calendar : "Other",
			color : "green"
		} ];

		function addDate(ev) {
		}

		var calendar = new Calendar("#calendar", data);
	})();
	
    <!-- 글쓰기 -->
// 글쓰기 버튼 요소 가져오기
const write = document.getElementsByClassName('write');

// 버튼 클릭 이벤트 처리 함수 정의
function handleWriteClick() {
    // 글쓰기 페이지로 이동
    window.location.href = "../home/TestWrite"; // 변경 가능한 경로
}

// HTML 문서가 완전히 로드되었을 때 버튼 클릭 이벤트 처리
document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 요소 가져오기
    const writeButton = document.querySelector('.write');

    // writeButton이 null이 아닌지 확인
    if (writeButton) {
        // 버튼 클릭 이벤트 처리
        writeButton.addEventListener('click', handleWriteClick);
    } else {
        console.error("write를 찾을 수 없습니다.");
    }
});
        
</script>


<!doctype html>

<div class="top_bar top_bar_left">
	<a href="../home/TestLogin">
		<button class="btn top_btn btn-ghost">🧝‍♀️</button>
	</a>
</div>

<div class="top_bar top_bar_right">
	<button class="btn top_btn btn-ghost" onclick="history.back();">검색🔍</button>
	<a href="../home/TestWrite">
		<button class="btn top_btn btn-ghost write">글쓰기🖊</button>
	</a>
	<a href="../home/TestProfile">
		<button class="btn top_btn btn-ghost">내 정보😀</button>
	</a>
</div>

<style type="text/css">
body {
	color: #5e5e5e;
	overflow: hidden;
	font-family: "Exo 2", "S-CoreDream-3Light";
	font-weight: normal;
	margin: 0;
	padding: 0;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	width: 100%;
	height: 100%;
	min-height: 100vh;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	background-image:
		url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

.top_bar {
	height: 61.7px;
	padding: 0;
	margin: 0;
	position: fixed;
	top: 0;
	text-align: center;
	font-family: "Exo 2";
	font-weight: normal;
	display: flex;
}

.top_bar_left {
	margin-right: 95%;
	justify-content: flex-start;
}

.top_bar_right {
	margin-left: 82%;
	justify-content: flex-end;
}

.top_btn {
	font-family: "S-CoreDream-3Light";
	margin-top: 15.5px;
	height: 30px;
	margin-right: 20px;
	display: inline-block;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}

#calendar {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	width: 900px;
	margin: 0;
	height: 650px;
	overflow: hidden;
	backdrop-filter: blur(0px);
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.25);
	border-radius: 55px;
}

.header {
	padding: 20px 0 40px;
	height: 14px;
	width: 215px;
	text-align: center;
	position: relative;
	z-index: 1000;
}

.header h1 {
	margin: 0px;
	padding: 10px;
	font-size: 1em;
	font-weight: bold;
	line-height: 0px;
	letter-spacing: 1px;
}

.left, .right {
	position: absolute;
	width: 0;
	height: 0;
	top: 30px;
	margin-top: -7.5px;
	cursor: pointer;
}

.header h1 {
	margin: 0px;
	padding: 10px;
	font-size: 1em;
	font-weight: bold;
	line-height: 0px;
	letter-spacing: 1px;
}

.left, .right {
	position: absolute;
	width: 0;
	height: 0;
	top: 30px;
	margin-top: -7.5px;
	cursor: pointer;
}

.left {
	border-width: 7.5px 10px 7.5px 0;
	border-color: transparent rgba(160, 159, 160, 1) transparent transparent;
	left: 20px;
}

.right {
	border-width: 7.5px 0 7.5px 10px;
	border-color: transparent transparent transparent rgba(160, 159, 160, 1);
	right: 25px;
}

.month {
	/*overflow: hidden;*/
	opacity: 0;
	padding-left: 10%;
}

.left {
	border-width: 7.5px 10px 7.5px 0;
	border-color: transparent rgba(160, 159, 160, 1) transparent transparent;
	left: 20px;
}

.right {
	border-width: 7.5px 0 7.5px 10px;
	border-color: transparent transparent transparent rgba(160, 159, 160, 1);
	right: 25px;
}

.month {
	/*overflow: hidden;*/
	opacity: 0;
	padding-left: 10%;
}

.month.new {
	-webkit-animation: fadeIn 1s ease-out;
	opacity: 1;
}

.month.in.next {
	-webkit-animation: moveFromTopFadeMonth 0.4s ease-out;
	-moz-animation: moveFromTopFadeMonth 0.4s ease-out;
	animation: moveFromTopFadeMonth 0.4s ease-out;
	opacity: 1;
}

.month.out.next {
	-webkit-animation: moveToTopFadeMonth 0.4s ease-in;
	-moz-animation: moveToTopFadeMonth 0.4s ease-in;
	animation: moveToTopFadeMonth 0.4s ease-in;
	opacity: 1;
}

.month.in.prev {
	-webkit-animation: moveFromBottomFadeMonth 0.4s ease-out;
	-moz-animation: moveFromBottomFadeMonth 0.4s ease-out;
	animation: moveFromBottomFadeMonth 0.4s ease-out;
	opacity: 1;
}

.month.out.prev {
	-webkit-animation: moveToBottomFadeMonth 0.4s ease-in;
	-moz-animation: moveToBottomFadeMonth 0.4s ease-in;
	animation: moveToBottomFadeMonth 0.4s ease-in;
	opacity: 1;
}

.day {
	display: inline-block;
	width: 100px;
	text-align: center;
	vertical-align: top;
	cursor: pointer;
	position: relative;
	z-index: 100;
}

.day.other {
	color: lightgrey;
}

.day {
	color: gray;
}

.day.today {
	color: rgba(156, 202, 235, 1);
}

.day-name {
	font-size: 10px;
	text-transform: uppercase;
	margin-bottom: 5px;
	color: black;
	letter-spacing: 3px;
	font-weight: normal;
}

.day-number {
	font-size: 24px;
	letter-spacing: 1.5px;
	font-weight: normal;
}

.day .day-events {
	list-style: none;
	margin-top: 13px;
	text-align: center;
	height: 12px;
	line-height: 6px;
	overflow: hidden;
}

.day .day-events span {
	vertical-align: top;
	display: inline-block;
	padding: 0;
	margin: 0;
	width: 5px;
	height: 5px;
	line-height: 5px;
	margin: 0 1px;
	border-radius: 5px;
}

.blue {
	background: cornflowerblue;
}

.orange {
	background: darkorange;
}

.green {
	background: mediumseagreen;
}

.yellow {
	background: gold;
}

.details {
	position: relative;
	margin-left: 27px;
	width: 640px;
	height: 85px;
	border: 1px dashed rgba(164, 164, 164, 1);
	margin-top: 5px;
	border-radius: 14px;
	font-weight: normal;
	color: dimgray;
}

.details.in {
	-webkit-animation: moveFromTopFade 0.5s ease both;
	-moz-animation: moveFromTopFade 0.5s ease both;
	animation: moveFromTopFade 0.5s ease both;
}

.details.out {
	-webkit-animation: moveToTopFade 0.5s ease both;
	-moz-animation: moveToTopFade 0.5s ease both;
	animation: moveToTopFade 0.5s ease both;
}

.arrow {
	position: absolute;
	top: -5px;
	left: 50%;
	margin-left: -9px;
	width: 0px;
	height: 0px;
	border-style: solid;
	border-width: 0 5px 5px 5px;
	border-color: transparent transparent rgba(164, 164, 164, 1) transparent;
	transition: all 0.7s ease;
}

.events {
	height: 83px;
	padding: 7px 0;
	overflow-y: auto;
	overflow-x: hidden;
	border-radius: 14px;
}

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

.details.out .events {
	-webkit-animation: fadeOutShrink 0.4s ease both;
	-moz-animation: fadeOutShink 0.4s ease both;
	animation: fadeOutShink 0.4s ease both;
}

.events.out {
	-webkit-animation: fadeOut 0.3s ease both;
	-moz-animation: fadeOut 0.3s ease both;
	animation: fadeOut 0.3s ease both;
}

.event {
	font-size: 16px;
	line-height: 22px;
	letter-spacing: 0.5px;
	padding: 2px 16px;
	vertical-align: top;
}

.event.empty {
	color: #777;
}

.event-category {
	height: 10px;
	width: 10px;
	display: inline-block;
	margin: 6px 0 0;
	vertical-align: top;
	border-radius: 10px;
}

.event span {
	display: inline-block;
	padding: 0 0 0 7px;
}
.event.dday {
    position: absolute;
    top: 10px; /* Adjust top position as needed */
    right: 10px; /* Adjust right position as needed */
}
.legend {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 30px;
	background: rgba(60, 60, 60, 1);
	line-height: 30px;
}

.entry {
	position: relative;
	padding: 0 0 0 25px;
	font-size: 13px;
	display: inline-block;
	line-height: 30px;
	background: transparent;
}

.entry:after {
	position: absolute;
	content: "";
	height: 5px;
	width: 5px;
	top: 12px;
	left: 14px;
}

.entry.blue:after {
	background: rgba(156, 202, 235, 1);
}

.entry.orange:after {
	background: rgba(247, 167, 0, 1);
}

.entry.green:after {
	background: rgba(153, 198, 109, 1);
}

.entry.yellow:after {
	background: rgba(249, 233, 0, 1);
}

@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* Animations are cool!  */
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
