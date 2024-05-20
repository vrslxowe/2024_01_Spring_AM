<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Main"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>
<script>

<!-- 달력 그리기  -->
	!(function() {
		// 오늘 날짜 가져오기
		var today = moment();
		// 캘린더 생성자 함수 정의
		function Calendar(selector, events) {
			// 캘린더 요소와 이벤트 데이터 설정
			this.el = document.querySelector(selector);
			this.events = events;
			 // 현재 날짜 설정
			this.current = moment().date(1);
			// 캘린더 그리기
			this.draw();
			// 오늘 날짜 엘리먼트 가져오기
			var current = document.querySelector(".today");
			 // 오늘 날짜가 존재하는 경우
			if (current) {
				var self = this;
				// 일정 시간이 지난 후 오늘 날짜 열기
				window.setTimeout(function() {
					self.openDay(current);
				}, 500);
			}
		}

		// 캘린더 그리기 메서드 정의
		Calendar.prototype.draw = function() {
			//헤더 생성
			this.drawHeader();

			//달 그리기
			this.drawMonth();
		};
		
		<!-- 캘린더에 검색 요소 그리기 -->
		
		// 캘린더 박스 요소를 찾습니다
		var calendarBox = document.getElementById('calendar');

		// 새로운 div 요소를 생성합니다
		var newDiv = document.createElement('div');
		newDiv.className = 'search_box';

		// form 요소를 생성합니다
		var form = document.createElement('form');
		form.onsubmit = function(event) {
		  submitSearch(event);
		};

		// input 요소를 생성하고 속성을 설정합니다
		var input = document.createElement('input');
		input.type = 'text';
		input.placeholder = '검색어를 입력하세요';
		input.name = 'search_query';
		input.autocomplete = 'off';

		// button 요소를 생성하고 속성을 설정합니다
		var button = document.createElement('button');
		button.type = 'submit';
		button.textContent = '검색';
		button.classList.add('search_btn'); // 버튼에 클래스 이름 추가

		// input과 button을 form 안에 추가합니다
		form.appendChild(input);
		form.appendChild(button);

		// form을 div 안에 추가합니다
		newDiv.appendChild(form);
		
		// 생성된 HTML 코드를 캘린더 박스 안에 추가합니다
		calendarBox.appendChild(newDiv);
		
		<!-- 검색 결과 리스트로 그리기 -->
		
		// 검색어를 입력한 후 검색 결과를 표시할 리스트 요소를 생성합니다
		var resultList = document.createElement('ul');
		resultList.id = 'search_results'; // 결과 리스트에 ID 부여

		// 검색어 입력란에 입력한 내용이 변경될 때마다 결과를 업데이트하는 함수를 정의합니다
		var inputTimer; // 타이머 변수 초기화
		input.addEventListener('input', function() {
		  clearTimeout(inputTimer); // 기존 타이머 제거

			  // 0.35초 후에 검색 결과 업데이트하는 타이머 설정
			  inputTimer = setTimeout(function() {
			    var searchQuery = input.value.replace(/\s+/g, '').toLowerCase(); // 입력된 검색어에서 모든 공백을 제거하고 소문자로 변환

			    // 검색 결과 초기화
			    resultList.innerHTML = '';

			 // 만약 검색어가 비어 있지 않다면 검색 결과를 업데이트합니다
			    if (searchQuery !== '') {
			      // 실제 검색 로직은 여기에 들어갑니다. 예를 들어, 검색 결과를 가져오고 리스트 아이템으로 추가하는 코드를 작성합니다.
			      // 여기에 가상의 검색 결과를 생성하여 리스트 아이템으로 추가하는 코드를 작성합니다
			      var dummyData = ['검색 결과 1', '검색 결과 2', '검색 결과 3', '오시온', '박원빈', '마에다 리쿠', '토쿠노 유우시']; // 가상의 검색 결과 데이터

			      // 검색 결과를 순회하면서 리스트 아이템으로 추가
			      dummyData.forEach(function(item) {
			        if (item.replace(/\s+/g, '').toLowerCase().includes(searchQuery)) { // 검색어가 결과에 포함되어 있는지 확인
			          var listItem = document.createElement('li');
			          listItem.textContent = item;
			          resultList.appendChild(listItem);
			        }
			      });

			      // 검색 결과 리스트를 search_box 아래에 추가합니다
			      newDiv.appendChild(resultList);
			      
			      // 검색 결과가 있을 때는 결과 리스트를 표시합니다
			      resultList.style.display = 'block';
			    } else {
			      // 검색어가 비어 있을 때는 결과 리스트를 숨깁니다
			      resultList.style.display = 'none';
			    }
			  }, 350); // 0.35초(350밀리초)의 딜레이 설정
			});
		
		<!-- 달력 헤더 부분  -->
		
		Calendar.prototype.drawHeader = function() {
			var self = this;
			 // 헤더가 존재하지 않는 경우
			if (!this.header) {
				//헤더 요소 생성
				this.header = createElement("div", "header");
				this.header.className = "header";
				// 제목 요소 생성
				this.title = createElement("h1");
				// 오른쪽 화살표 요소 생성 및 클릭 이벤트 추가
				var right = createElement("div", "right");
				right.addEventListener("click", function() {
					self.nextMonth();
				});
				// 왼쪽 화살표 요소 생성 및 클릭 이벤트 추가
				var left = createElement("div", "left");
				left.addEventListener("click", function() {
					self.prevMonth();
				});

				// 요소를 헤더에 추가
				this.header.appendChild(this.title);
				this.header.appendChild(right);
				this.header.appendChild(left);
				// 헤더를 캘린더에 추가
				this.el.appendChild(this.header);
			}
			// 제목에 현재 달력의 월과 년도 설정
			this.title.innerHTML = this.current.format("MMM YYYY");
		};
		<!-- 달력 월 부분  -->
		Calendar.prototype.drawMonth = function() {
			var self = this;
			// 각 이벤트의 날짜를 현재 월에 무작위로 할당
			this.events.forEach(function(ev) {
				ev.date = self.current.clone().date(
						Math.random() * (29 - 1) + 1);
			});
			// 이전 월이 이미 존재하는 경우
			if (this.month) {
				// 이전 월을 저장하고 클래스를 설정하여 애니메이션 효과 추가
				this.oldMonth = this.month;
				this.oldMonth.className = "month out "
						+ (self.next ? "next" : "prev");
				this.oldMonth
						.addEventListener(
								"webkitAnimationEnd",
								function() {
									// 이전 월 삭제
									self.oldMonth.parentNode.removeChild(self.oldMonth);
									// 새로운 월 요소 생성
									self.month = createElement("div", "month");
									 // 이전 월과 다음 월의 날짜로 채우기
									self.backFill();
									self.currentMonth();
									self.fowardFill();
									// 새로운 월을 캘린더에 추가
									self.el.appendChild(self.month);
									// 애니메이션 클래스 설정 후 잠시 후에 적용
									window.setTimeout(function() {
										self.month.className = "month in " + (self.next ? "next" : "prev");
										}, 16);
								});
			} else {
				// 이전 월이 없는 경우 새로운 월 요소 생성
				this.month = createElement("div", "month");
				// 캘린더에 월 추가
				this.el.appendChild(this.month);
				// 이전 월과 다음 월의 날짜로 채우기
				this.backFill();
				this.currentMonth();
				this.fowardFill();
				// 새로운 월에 클래스 추가
				this.month.className = "month new";
			}
		};
		<!-- 월 시작 부분과 끝난 부분에 전 달, 다음 달 날짜로 채움 -->
		Calendar.prototype.backFill = function() {
			var clone = this.current.clone(); // 현재 날짜의 복사본 생성
			var dayOfWeek = clone.day(); // 현재 달의 시작 요일 확인

			if (!dayOfWeek) { // 만약 현재 달이 일요일로 시작한다면 아무 작업도 수행하지 않고 종료
				return;
			}

			clone.subtract(dayOfWeek + 1, "days"); // 시작 요일부터 하루씩 이전 달로 이동하여 날짜 설정

			for (var i = dayOfWeek; i > 0; i--) { // 현재 달 이전의 요일들에 대해 반복
				this.drawDay(clone.add(1, "days")); // 각 날짜를 그려주는 함수 호출
			}
		};

		// 현재 달력 월의 끝 부분을 다음 달 날짜로 채우는 함수
		Calendar.prototype.fowardFill = function() {
			var clone = this.current.clone().add(1, "months").subtract(1, "days"); // 현재 달의 다음 달의 마지막 날을 구함
			var dayOfWeek = clone.day(); // 다음 달의 마지막 날의 요일 확인

			if (dayOfWeek === 6) { // 만약 다음 달의 마지막 날이 토요일이라면 아무 작업도 수행하지 않고 종료
				return;
			}

			for (var i = dayOfWeek; i < 6; i++) { // 현재 달의 다음 달의 시작 요일부터 토요일까지 반복
				this.drawDay(clone.add(1, "days")); // 각 날짜를 그려주는 함수 호출
			}
		};
		<!-- 달력을 주단위로 나눠서 표시 -->
		Calendar.prototype.currentMonth = function() {
			var clone = this.current.clone(); // 현재 날짜의 복사본 생성


			while (clone.month() === this.current.month()) { // 현재 달의 날짜인 동안 반복
				this.drawDay(clone); // 각 날짜를 그려주는 함수 호출
				clone.add(1, "days"); // 다음 날짜로 이동
			}
		};
		// 현재 날짜가 속한 주를 가져와서 해당 주의 요일을 표시하는 함수
		Calendar.prototype.getWeek = function(day) {
			if (!this.week || day.day() === 0) { // 만약 주 요소가 없거나 현재 날짜가 일요일이라면 새로운 주 요소를 생성
				this.week = createElement("div", "week");
				this.month.appendChild(this.week); // 주 요소를 월에 추가
			}
		};
		<!-- 달력의 각 날짜를 그려주고 해당 날짜의 이벤트를 표시  -->
		Calendar.prototype.drawDay = function(day) {
			var self = this; // Calendar 객체를 참조하기 위해 self 변수에 저장
			this.getWeek(day); // 해당 날짜가 속한 주 요소를 가져옴

			//날짜를 감싸는 외부 요소 생성하고 클래스를 설정
			var outer = createElement("div", this.getDayClass(day));
			// 외부 요소에 클릭 이벤트 리스너를 추가함
			outer.addEventListener("click", function() {
				self.openDay(this); // 클릭한 날짜에 대한 상세 정보를 열기 위해 openDay 함수를 호출함
			});

			//날짜 이름 요소 생성하고 설정
			var name = createElement("div", "day-name", day.format("ddd"));

			//날짜 숫자 요소 생성하고 설정
			var number = createElement("div", "day-number", day.format("DD"));

			//이벤트 요소 생성하고 설정
			var events = createElement("div", "day-events");
			this.drawEvents(day, events);
			// 외부 요소에 이름, 숫자, 이벤트 요소를 추가함
			outer.appendChild(name);
			outer.appendChild(number);
			outer.appendChild(events);
			// 주 요소에 외부 요소를 추가함
			this.week.appendChild(outer);
		};
		<!-- 특정 날짜에 해당하는 이벤트를 그리고 이를 해당 엘리먼트에 추가  -->
		Calendar.prototype.drawEvents = function(day, element) {
			// 현재 월에 속하는 경우에만 이벤트를 그림
			if (day.month() === this.current.month()) {
				// 해당 날짜에 있는 이벤트를 필터링하고 todaysEvents 배열에 저장
				var todaysEvents = this.events.reduce(function(memo, ev) {
    	if (moment(ev.date).isSame(day, "day")) { // ev.date를 moment 객체로 변환하여 사용
       	 	memo.push(ev); // 현재 날짜에 해당하는 이벤트를 todaysEvents 배열에 추가
   		 }
   		 return memo;
		}, []);
		// todaysEvents 배열에 있는 각 이벤트를 처리함
		todaysEvents.forEach(function(ev) {
			var evSpan = createElement("span", ev.color); // 이벤트를 나타내는 span 요소를 생성함
			element.appendChild(evSpan); // 생성한 span 요소를 이벤트 요소에 추가함
			});
		}
	};
		<!-- 각 날짜에 대한 클래스를 설정하고 반환, CSS를 통해 달력에서 각 날짜를 스타일링하는 데 사용  -->
		Calendar.prototype.getDayClass = function(day) {
			classes = [ "day" ]; // 기본 클래스로 "day"를 설정함
			
			// 현재 월과 다른 월에 속하는 경우 "other" 클래스를 추가함
			if (day.month() !== this.current.month()) {
				classes.push("other");
				
				// 현재 날짜와 동일한 경우 "today" 클래스를 추가함
			} else if (today.isSame(day, "day")) {
				classes.push("today");
			}
			
			// 클래스 배열을 문자열로 결합하여 반환함
			return classes.join(" ");
		};
		<!-- 특정 날짜를 클릭했을 때 해당 날짜의 이벤트를 표시하는 역할, 이벤트 상세정보 열고 닫기  -->
		Calendar.prototype.openDay = function(el) {
			// 클릭한 요소에서 날짜를 가져옴
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
			this.current.add(1, "months"); // 현재 날짜를 1달 더하여 다음 달로 이동
			this.next = true; // 다음 달로 이동했음을 표시
			this.draw(); // 변경된 달력 다시 그리기
		};
		<!-- 현재 달력을 이전 달로 이동  -->
		Calendar.prototype.prevMonth = function() {
			this.current.subtract(1, "months"); // 현재 날짜에서 1달을 빼어 이전 달로 이동
			this.next = false; // 이전 달로 이동했음을 표시
			this.draw(); // 변경된 달력 다시 그리기
		};
		<!-- Calendar 객체에서 엘리먼트를 동적으로 생성하고 클래스를 추가하거나 텍스트를 설정하는 기능  -->
		window.Calendar = Calendar;

		function createElement(tagName, className, innerText) {
			var ele = document.createElement(tagName); // 주어진 태그 이름으로 HTML 요소 생성
			if (className) {
				ele.className = className; // 클래스 이름이 주어진 경우 요소에 클래스 추가
			}
			if (innerText) {
				ele.innderText = ele.textContent = innerText; // 내용이 주어진 경우 요소에 텍스트 내용 추가
			}
			return ele; // 생성된 요소 반환
		}
	})();
	
	<!-- 이벤트 데이터를 사용하여 캘린더 생성(이벤트 이름, 캘린더의 종류, 이벤트를 표시할 때 사용할 색)  -->
	!(function() {
		var data = [ { // 샘플 이벤트 데이터 배열
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

		// 날짜 추가하는 함수
		function addDate(ev) {
		}
		
		// Calendar 객체 생성
		var calendar = new Calendar("#calendar", data);
	})();
	
    <!-- 글쓰기 -->
// 글쓰기 버튼 요소 가져오기
// const write = document.getElementsByClassName('write');

// 버튼 클릭 이벤트 처리 함수 정의
// function handleWriteClick() {
    // 글쓰기 페이지로 이동
//     window.location.href = "../home/TestWrite"; // 변경 가능한 경로
// }

// HTML 문서가 완전히 로드되었을 때 버튼 클릭 이벤트 처리
// document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 요소 가져오기
//     const writeButton = document.querySelector('.write');

    // writeButton이 null이 아닌지 확인
//     if (writeButton) {
        // 버튼 클릭 이벤트 처리
//         writeButton.addEventListener('click', handleWriteClick);
//     } else {
//         console.error("write를 찾을 수 없습니다.");
//     }
// });
        
</script>


<!doctype html>

<div class="top_bar top_bar_left">
	<a href="../home/TestLogin">
		<button class="btn top_btn btn-ghost">🧝‍♀️</button>
	</a>
	<a href="../home/TestProfile">
		<button class="btn top_btn btn-ghost">내 정보😀</button>
	</a>
</div>

<div class="top_bar top_bar_right">
<c:if test="${rq.isLogined() }">
<button class="">${loggedInMemberName}님</button>
</c:if>
	<a href="../home/TestList">
		<button class="btn top_btn btn-ghost btn_list">목록📄</button>
	</a>
	<a href="../home/TestWrite">
		<button class="btn top_btn btn-ghost">글쓰기🖊</button>
	</a>
</div>

<style type="text/css">

body {
	color: #5e5e5e; /* 본문 텍스트 색상 */
	overflow: hidden; /* 스크롤 막기 */
	font-family: "Exo 2", "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	margin: 0; /* 바깥 여백 설정 */
	padding: 0; /* 안쪽 여백 설정 */
	-webkit-touch-callout: none; /* iOS 길게 누르면 메뉴 뜨는 것 막기 */
	-webkit-user-select: none; /* 텍스트 선택 방지 */
	-khtml-user-select: none; /* 텍스트 선택 방지 (KHTML 엔진) */
	-moz-user-select: none; /* 텍스트 선택 방지 (Gecko 엔진) */
	-ms-user-select: none; /* 텍스트 선택 방지 (마이크로소프트 엔진) */
	user-select: none; /* 텍스트 선택 방지 */
	width: 100%; /* 너비 100% 설정 */
	height: 100%; /* 높이 100% 설정 */
	min-height: 100vh; /* 최소 높이 100% 설정 */
	position: relative; /* 상대 위치 설정 */
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	flex-wrap: wrap; /* Flexbox 줄 바꿈 */
	background-image: url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg"); /* 배경 이미지 설정 */
	background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
	background-position: center; /* 배경 이미지 가운데 정렬 */
	background-size: cover; /* 배경 이미지를 컨테이너에 맞추어 표시 */
}

.top_bar {
	height: 61.7px; /* 상단 바 높이 설정 */
	padding: 0; /* 안쪽 여백 없음 */
	margin: 0; /* 바깥 여백 없음 */
	position: fixed; /* 고정 위치 설정 */
	top: 0; /* 위쪽으로 고정 */
	text-align: center; /* 가운데 정렬 */
	font-family: "Exo 2"; /* 글꼴 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	display: flex; /* Flexbox 사용 */
}

.top_bar_left {
	margin-right: 89%; /* 왼쪽 여백 설정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.top_bar_right {
	margin-left: 89%; /* 오른쪽 여백 설정 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.top_btn {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	margin-top: 15.5px; /* 위쪽 여백 설정 */
	height: 30px; /* 높이 설정 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

.btn_list {
	width : 78px;
}

.search_box {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-size: 17px;
	width: 285px;
	height: 35px;
	border-radius: 35px;
	display: flex;
	position: relative; /* 상대 위치 설정 */
	padding-top: 5px;
	padding-left: 27px;
	top: 40px;
	margin-left: 66%;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

input {
    background-color: transparent; /* 검색창 배경색 투명하게 설정 */
}
.search_btn {
  position: absolute;
}

#search_results {
  list-style: none; /* 기본 목록 마커 제거 */
  padding: 0;
  margin-top: 70px;
  margin-left: -100%;
}

#search_results li {
  padding: 18px; /* 각 결과 항목의 간격 조정 */
  width: 380px;
  border-bottom: 1px solid #ccc; /* 각 결과 항목의 아래에 구분선 추가 */
}

#search_results li:last-child {
  border-bottom: none; /* 마지막 결과 항목의 아래 구분선 제거 */
}

#calendar {
	-webkit-transform: translate3d(0, 0, 0); /* 3D 변환 */
	-moz-transform: translate3d(0, 0, 0); /* 3D 변환 */
	transform: translate3d(0, 0, 0); /* 3D 변환 */
	width: 1200px; /* 너비 설정 */
	margin: 0; /* 바깥 여백 없음 */
	height: 800px; /* 높이 설정 */
	overflow: hidden; /* 스크롤 숨김 */
	backdrop-filter: blur(0px); /* 배경 흐리게 설정 */
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
	border-radius: 55px; /* 테두리 모양 설정 */
}

.header {
	padding: 20px 0 40px; /* 안쪽 여백 설정 */
	height: 14px; /* 높이 설정 */
	width: 215px; /* 너비 설정 */
	text-align: center; /* 가운데 정렬 */
	position: relative; /* 상대 위치 설정 */
	z-index: 1000; /* 층 수 설정 */
}

.header h1 {
	margin: 0px; /* 바깥 여백 없음 */
	padding: 10px; /* 안쪽 여백 설정 */
	padding-left: 10px;
	margin-left: 35px;
	font-size: 1em; /* 글꼴 크기 설정 */
	font-weight: bold; /* 글꼴 두껍기 설정 */
	line-height: 0px; /* 줄 높이 설정 */
	letter-spacing: 1px; /* 글자 간격 설정 */
}

.left, .right {
	position: absolute; /* 절대 위치 설정 */
	width: 0; /* 너비 없음 */
	height: 0; /* 높이 없음 */
	top: 30px; /* 위쪽 여백 설정 */
	margin-top: -7.5px; /* 위쪽 여백 마이너스 값 설정하여 아래로 이동 */
	cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 모양으로 설정 */
}

.left {
	border-width: 7.5px 10px 7.5px 0; /* 테두리 두께 설정 */
	border-color: transparent rgba(160, 159, 160, 1) transparent transparent; /* 테두리 색상 설정 */
	left: 40px; /* 왼쪽 여백 설정 */
}

.right {
	border-width: 7.5px 0 7.5px 10px; /* 테두리 두께 설정 */
	border-color: transparent transparent transparent rgba(160, 159, 160, 1); /* 테두리 색상 설정 */
	right: 5px; /* 오른쪽 여백 설정 */
}

.month {
	/*overflow: hidden;*/ /* 오버플로우 숨김 설정 */
	opacity: 0; /* 투명도 설정 */
	padding-left: 0%; /* 왼쪽 여백 설정 */
	margin-top: 30px;
	width: 700px;
}

.month.new {
	-webkit-animation: fadeIn 1s ease-out; /* 새로운 달이 나타날 때의 애니메이션 설정 */
	opacity: 1; /* 투명도 설정 */
}

.month.in.next {
	-webkit-animation: moveFromTopFadeMonth 0.4s ease-out; /* 다음 달이 나타날 때의 애니메이션 설정 */
	-moz-animation: moveFromTopFadeMonth 0.4s ease-out; /* 다음 달이 나타날 때의 애니메이션 설정 */
	animation: moveFromTopFadeMonth 0.4s ease-out; /* 다음 달이 나타날 때의 애니메이션 설정 */
	opacity: 1; /* 투명도 설정 */
}

.month.out.next {
	-webkit-animation: moveToTopFadeMonth 0.4s ease-in; /* 다음 달이 사라질 때의 애니메이션 설정 */
	-moz-animation: moveToTopFadeMonth 0.4s ease-in; /* 다음 달이 사라질 때의 애니메이션 설정 */
	animation: moveToTopFadeMonth 0.4s ease-in; /* 다음 달이 사라질 때의 애니메이션 설정 */
	opacity: 1; /* 투명도 설정 */
}

.month.in.prev {
	-webkit-animation: moveFromBottomFadeMonth 0.4s ease-out; /* 이전 달이 나타날 때의 애니메이션 설정 */
	-moz-animation: moveFromBottomFadeMonth 0.4s ease-out; /* 이전 달이 나타날 때의 애니메이션 설정 */
	animation: moveFromBottomFadeMonth 0.4s ease-out; /* 이전 달이 나타날 때의 애니메이션 설정 */
	opacity: 1; /* 투명도 설정 */
}

.month.out.prev {
	-webkit-animation: moveToBottomFadeMonth 0.4s ease-in; /* 이전 달이 사라질 때의 애니메이션 설정 */
	-moz-animation: moveToBottomFadeMonth 0.4s ease-in; /* 이전 달이 사라질 때의 애니메이션 설정 */
	animation: moveToBottomFadeMonth 0.4s ease-in; /* 이전 달이 사라질 때의 애니메이션 설정 */
	opacity: 1; /* 투명도 설정 */
}

.day {
	display: inline-block; /* 인라인 블록 요소로 설정하여 다른 요소와 함께 표시 */
	width: 100px; /* 너비 설정 */
	text-align: center; /* 가운데 정렬 */
	vertical-align: top; /* 위쪽 정렬 */
	cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 모양으로 설정 */
	position: relative; /* 상대 위치 설정 */
	z-index: 100; /* z-index 값 설정 */
	color: gray; /* 일반 날짜 색상 설정 */
}

.day.other {
	color: lightgrey; /* 다른 달의 날짜 색상 설정 */
}

.day.today {
	color: rgba(156, 202, 235, 1); /* 오늘 날짜 색상 설정 */
}

.day-name {
	font-size: 10px; /* 글꼴 크기 설정 */
	text-transform: uppercase; /* 텍스트 대문자 변환 */
	margin-bottom: 5px; /* 하단 여백 설정 */
	color: black; /* 텍스트 색상 설정 */
	letter-spacing: 3px; /* 글자 간격 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
}

.day-number {
	font-size: 25px; /* 글꼴 크기 설정 */
	letter-spacing: 1.5px; /* 글자 간격 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
}

.day .day-events {
	list-style: none; /* 목록 스타일 없앰 */
	margin-top: 13px; /* 상단 여백 설정 */
	text-align: center; /* 가운데 정렬 */
	height: 30px; /* 높이 설정 */
	line-height: 6px; /* 줄 높이 설정 */
	overflow: hidden; /* 오버플로우 숨김 설정 */
}

.day .day-events span {
	vertical-align: top; /* 위쪽 정렬 */
	display: inline-block; /* 인라인 블록 요소로 설정하여 다른 요소와 함께 표시 */
	padding: 0; /* 내부 여백 없앰 */
	margin: 0; /* 마진 없앰 */
	width: 5px; /* 너비 설정 */
	height: 5px; /* 높이 설정 */
	line-height: 5px; /* 줄 높이 설정 */
	margin: 0 1px; /* 좌우 여백 설정 */
	border-radius: 5px; /* 테두리 반지름 설정 */
}

.blue {
	background: cornflowerblue; /* 파란색 배경색 설정 */
}

.orange {
	background: darkorange; /* 주황색 배경색 설정 */
}

.green {
	background: mediumseagreen; /* 초록색 배경색 설정 */
}

.yellow {
	background: gold; /* 노란색 배경색 설정 */
}

.details {
	position: relative; /* 상대 위치 설정 */
	margin-left: 27px; /* 왼쪽 여백 설정 */
	width: 640px; /* 너비 설정 */
	height: 85px; /* 높이 설정 */
	border: 1px dashed rgba(164, 164, 164, 1); /* 테두리 설정 */
	margin-top: 5px; /* 상단 여백 설정 */
	border-radius: 14px; /* 테두리 반지름 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	color: dimgray; /* 텍스트 색상 설정 */
}

.details.in {
	-webkit-animation: moveFromTopFade 0.5s ease both; /* 상세정보가 나타날 때의 애니메이션 설정 */
	-moz-animation: moveFromTopFade 0.5s ease both; /* 상세정보가 나타날 때의 애니메이션 설정 */
	animation: moveFromTopFade 0.5s ease both; /* 상세정보가 나타날 때의 애니메이션 설정 */
}

.details.out {
	-webkit-animation: moveToTopFade 0.5s ease both; /* 상세정보가 사라질 때의 애니메이션 설정 */
	-moz-animation: moveToTopFade 0.5s ease both; /* 상세정보가 사라질 때의 애니메이션 설정 */
	animation: moveToTopFade 0.5s ease both; /* 상세정보가 사라질 때의 애니메이션 설정 */
}

.arrow {
	position: absolute; /* 절대 위치 설정 */
	top: -5px; /* 위쪽 여백 설정 */
	left: 50%; /* 왼쪽 여백을 부모 요소의 가로 중앙으로 설정 */
	margin-left: -9px; /* 왼쪽 여백을 요소의 가로 너비의 절반만큼 왼쪽으로 이동 */
	width: 0px; /* 너비 없음 */
	height: 0px; /* 높이 없음 */
	border-style: solid; /* 테두리 스타일 설정 */
	border-width: 0 5px 5px 5px; /* 테두리 너비 설정 */
	border-color: transparent transparent rgba(164, 164, 164, 1) transparent; /* 테두리 색상 설정 */
	transition: all 0.7s ease; /* 모든 속성에 대한 변화를 0.7초 동안 부드럽게 설정 */
}

.events {
	height: 83px; /* 높이 설정 */
	padding: 7px 0; /* 내부 여백 설정 */
	overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
	overflow-x: hidden; /* 가로 스크롤은 숨김 */
	border-radius: 14px; /* 테두리 반경 설정 */
	/* 스크롤바 숨김 */
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* IE 10+ */
}

.content_box::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera */
}

.events.in {
	-webkit-animation: fadeIn 0.3s ease both; /* fade 효과를 통해 나타나는 애니메이션 설정 */
	-moz-animation: fadeIn 0.3s ease both; /* fade 효과를 통해 나타나는 애니메이션 설정 */
	animation: fadeIn 0.3s ease both; /* fade 효과를 통해 나타나는 애니메이션 설정 */
}

.events.in {
	-webkit-animation-delay: 0.3s; /* 나타나는 애니메이션 지연 설정 */
	-moz-animation-delay: 0.3s; /* 나타나는 애니메이션 지연 설정 */
	animation-delay: 0.3s; /* 나타나는 애니메이션 지연 설정 */
}

.details.out .events {
	-webkit-animation: fadeOutShrink 0.4s ease both; /* fade 효과와 함께 사라지는 애니메이션 설정 */
	-moz-animation: fadeOutShink 0.4s ease both; /* fade 효과와 함께 사라지는 애니메이션 설정 */
	animation: fadeOutShink 0.4s ease both; /* fade 효과와 함께 사라지는 애니메이션 설정 */
}

.events.out {
	-webkit-animation: fadeOut 0.3s ease both; /* fade 효과로 사라지는 애니메이션 설정 */
	-moz-animation: fadeOut 0.3s ease both; /* fade 효과로 사라지는 애니메이션 설정 */
	animation: fadeOut 0.3s ease both; /* fade 효과로 사라지는 애니메이션 설정 */
}

.event {
	font-size: 16px; /* 글꼴 크기 설정 */
	line-height: 22px; /* 줄 높이 설정 */
	letter-spacing: 0.5px; /* 글자 간격 설정 */
	padding: 2px 16px; /* 내부 여백 설정 */
	vertical-align: top; /* 위쪽 정렬 설정 */
}

.event.empty {
	color: #777; /* 색상 설정 */
}

.event-category {
	height: 10px; /* 높이 설정 */
	width: 10px; /* 너비 설정 */
	display: inline-block; /* 인라인 블록 요소로 설정 */
	margin: 6px 0 0; /* 마진 설정 */
	vertical-align: top; /* 위쪽 정렬 설정 */
	border-radius: 10px; /* 테두리 반경 설정 */
}

.event span {
	display: inline-block; /* 인라인 블록 요소로 설정 */
	padding: 0 0 0 7px; /* 내부 여백 설정 */
}
.event.dday {
    position: absolute; /* 절대 위치 설정 */
    top: 10px; /* 위쪽 여백 설정 */
    right: 10px; /* 오른쪽 여백 설정 */
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

/*화면 위에서 아래로 이동하면서 페이드 인되는 애니메이션(WebKit(Chrome, Safari 등)에서 작동)*/
@-webkit-keyframes moveFromTopFade {
  from {
    opacity: 0.3;
    height: 0px;
    margin-top: 0px;
    -webkit-transform: translateY(-100%);
  }
}


/*화면 위에서 아래로 이동하면서 페이드 인되는 애니메이션*/
@-webkit-keyframes moveToTopFade {
  to {
    opacity: 0.3;
    height: 0px;
    margin-top: 0px;
    opacity: 0.3;
    -webkit-transform: translateY(-100%);
  }
}


/*화면 위에서 위로 이동하면서 페이드 아웃되는 애니메이션(월별)*/
@-webkit-keyframes moveToTopFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(-30%) scale(0.95);
  }
}

/* 화면 아래에서 위로 이동하면서 페이드 인되는 애니메이션(월별)*/
@-webkit-keyframes moveFromTopFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(30%) scale(0.95);
  }
}


/* 화면 위에서 아래로 이동하면서 페이드 아웃되는 애니메이션(월별)*/
@-webkit-keyframes moveToBottomFadeMonth {
  to {
    opacity: 0;
    -webkit-transform: translateY(30%) scale(0.95);
  }
}

/*화면 아래에서 위로 이동하면서 페이드 인되는 애니메이션(월별)*/
@-webkit-keyframes moveFromBottomFadeMonth {
  from {
    opacity: 0;
    -webkit-transform: translateY(-30%) scale(0.95);
  }
}


/*화면에 나타나면서 서서히 나타나는 애니메이션*/
@-webkit-keyframes fadeIn {
  from {
    opacity: 0;
  }
}


/*화면에서 사라지면서 서서히 사라지는 애니메이션*/
@-webkit-keyframes fadeOut {
  to {
    opacity: 0;
  }
}


/*요소가 사라지면서 크기가 축소되는 애니메이션*/
@-webkit-keyframes fadeOutShink {
  to {
    opacity: 0;
    padding: 0px;
    height: 0px;
  }
}


</style>