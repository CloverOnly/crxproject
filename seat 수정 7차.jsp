<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
    Integer userid = (Integer) session.getAttribute("userid");
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>좌석 선택</title>
    <style>
        body {
            margin: 0;
        }
        .seat-container {
            display: inline-block;
            list-style: none;
            padding: 0;
            margin: 0 5px;
        }
		.seat-button {
		    margin: 4px;
		    position: relative;
		    background: url(../img/seat1.jpg) no-repeat center center;
		    background-size: 65%;
		    width: 63px;
		    height: 60px;
		    border: none;
		    cursor: pointer;
		    text-align: center;
		}
        /* 선택된 좌석 이미지 */
        .seat-button.selected {
            background: url('../img/seat2.jpg') no-repeat center center;
            background-size: 63%; !important;
        }
        .seat-button.disabled {
            cursor: not-allowed;
            background-image: url('seat3.jpg');
            background-size: 63%; !important;
        }
        .seat-button label {
            position: absolute;
            left: 59%;
            transform: translateX(-50%);
            color: black;
            font-size: 14px;
            font-weight: bold;
            top: 27px;
        }
        .line {
            border: solid 2px green;
        }
        .seatAll {
            border-width: 10px 5px 5px 5px;
            border-style: solid;
            border-color: green;
        }
        .seatTitle {
            background: green;
            color: white;
            width: 100%;
            height: 60px;
            text-align: center;
            line-height: 60px;
            margin: 1;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .uall {
            margin: -14px;
        }
        .hoBa {
            background: url(../img/train.png) no-repeat center center;
            background-size: cover;
            height: 110px;
        }
        .ho {
            list-style: none;
            display: inline-block;
        }
        .hocha {
            position: relative;
            background: url(../img/ss.jpg) no-repeat center center;
            background-size: cover;
            width: 111px;
            height: 48px;
            border: none;
            cursor: pointer;
            text-align: center;
            top: 48px;
            right: -85%;
        }
        /* 선택된 호차의 이미지 */
        .hocha.selected {
            background: url('../img/ss2.jpg') no-repeat center center;
            background-size: cover;
        }
        a:hover .hocha {
            background-image: url('../img/ss2.jpg');
            background-size: cover;
        }
        .ho label {
            position: absolute;
            left: 38%;
            color: black;
            font-size: 14px;
            font-weight: bold;
            top: 14px;
        }
        .line2 {
            position: relative;
            width: 820px;
            height: 1px;
            background: repeating-linear-gradient(to right, 
                black 0%, 
                black 2px, 
                transparent 2px, 
                transparent 4px
            );
            background-size: 4px 100%;
            color: green;
            margin: 24px;
        }
        .cre {
            position: relative;
            left: 99%;
            top: -15px;
            font-size: 21px;
            background-repeat: repeat-x;
            color: green;
        }
        #seatReservation {
            background: green;
            color: white;
            border: 1px solid green;
            border-radius: 12px;
            padding: 10px;
            position: absolute;
            bottom: 138px;
            right: 15px
        }
        .butt {
            text-align: center;
        }
        .tli {
            font-size: 12px;
        }
        .fie {
            width: 950px;
        }
        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .inf {
            float: right;
        }
		.section {
		    margin: 9px;
		}
		.first-row {
			margin: 0px;
		}
    </style>
    <meta name="viewport" content="width=1000">
    
    <script>
        let selectedHocha = '';
        let selectedSeats = [];
        let totalCount = 0;
        let totalAdultCharge = 0;
        let totalChildCharge = 0;
        let totalDiscount = 0;

		function generateSeats() {
		    // 각 섹션에 대한 좌석 생성
		    const sections = [
		        { id: 'section1', seats: generateSeatsForSection(1) },
		        { id: 'section2', seats: generateSeatsForSection(2) },
		        { id: 'section3', seats: generateSeatsForSection(3) },
		        { id: 'section4', seats: generateSeatsForSection(4) },
		        { id: 'section5', seats: generateSeatsForSection(5) },
		        { id: 'section6', seats: generateSeatsForSection(6) }
		    ];

		    sections.forEach(section => {
		        const sectionElement = document.getElementById(section.id);
		        if (sectionElement) {
		            sectionElement.innerHTML = ''; // 기존 내용 제거
		            
		            // 0번째 인덱스의 좌석을 별도로 감싸기
		            const firstRowDiv = document.createElement('div');
		            firstRowDiv.className = 'first-row'; 

		            const firstRowSeats = section.seats.slice(0, 12); // 첫 줄 (A열) 좌석
		            firstRowSeats.forEach(seat => {
		                const seatContainer = document.createElement('li');
		                seatContainer.className = 'seat-container';

		                const seatButton = document.createElement('button');
		                seatButton.className = 'seat-button';
		                seatButton.value = seat;
		                seatButton.onclick = () => abcdSeat(seatButton);

		                const seatLabel = document.createElement('label');
		                seatLabel.innerText = seat;

		                seatButton.appendChild(seatLabel);
		                seatContainer.appendChild(seatButton);
		                firstRowDiv.appendChild(seatContainer);
		            });

		            sectionElement.appendChild(firstRowDiv); // 첫 줄 추가

		            // 나머지 좌석 추가
		            const otherSeats = section.seats.slice(12);
		            otherSeats.forEach(seat => {
		                const seatContainer = document.createElement('li');
		                seatContainer.className = 'seat-container';

		                const seatButton = document.createElement('button');
		                seatButton.className = 'seat-button';
		                seatButton.value = seat;
		                seatButton.onclick = () => abcdSeat(seatButton);

		                const seatLabel = document.createElement('label');
		                seatLabel.innerText = seat;

		                seatButton.appendChild(seatLabel);
		                seatContainer.appendChild(seatButton);
		                sectionElement.appendChild(seatContainer);
		            });
		        }
		    });
		}


		function generateSeatsForSection(sectionNumber) {
		    const seatGrid = 			[
			    // A열 좌석
			    ['1A', '2A', '3A', '4A', '5A', '6A', '7A', '8A', '9A', '10A', '11A', '12A'],
			    // B열 좌석
			    ['1B', '2B', '3B', '4B', '5B', '6B', '7B', '8B', '9B', '10B', '11B', '12B'],
			    // C열 좌석
			    ['1C', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', '10C', '11C', '12C'],
			    // D열 좌석
			    ['1D', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', '10D', '11D', '12D']
			];

		    let seats = [];
		    for (let i = 0; i < seatGrid.length; i++) {
		        for (let j = 0; j < seatGrid[i].length; j++) {
		            seats.push(seatGrid[i][j]);
		        }
		    }
		    return seats;
		}


        window.addEventListener('load', function() {
            setFormValues();
            generateSeats();  // 좌석 생성 함수 호출
        });
        
        function toggleSeat(sectionId, buttonElement) {
            document.querySelectorAll('.hocha').forEach(function(button) {
                button.classList.remove('selected');
            });

            document.querySelectorAll('.section').forEach(function(section) {
                section.style.display = 'none';
            });

            buttonElement.classList.add('selected');
            selectedHocha = buttonElement.value;

            const section = document.getElementById(sectionId);
            if (section) {
                section.style.display = 'block';
            }

            updateSelectionInfo();
        }

		function abcdSeat(buttonElement) {
		    console.log('Selected seat value:', buttonElement.value); // 좌석 값 로그 출력

		    const isSelected = buttonElement.classList.contains('selected');
		    
		    if (!isSelected && selectedSeats.length < totalCount) {
		        buttonElement.classList.add('selected');
		        selectedSeats.push(buttonElement.value);
		    } else if (isSelected) {
		        buttonElement.classList.remove('selected');
		        selectedSeats = selectedSeats.filter(seat => seat !== buttonElement.value);
		    }

		    updateSelectionInfo();
		}

        function updateSelectionInfo() {
            const seatCheck = document.getElementById('sitCheck');
            const hocha = document.getElementById('sitHo');

            if (selectedSeats.length > 0) {
                seatCheck.innerText = selectedSeats.join(', ');
                hocha.innerText = selectedHocha;
                hocha.style.display = 'inline';
            } else {
                seatCheck.innerText = '';
                hocha.innerText = '';
                hocha.style.display = 'none';
            }
        }

        function setFormValues() {
            var startname = window.opener.document.getElementById('depplacename').value;
            var endname = window.opener.document.getElementById('arrplacename').value;
            var seatType = window.opener.document.getElementById('seatType').value;
            var startdate = window.opener.document.getElementById('formattedDate').value;
            var trainType = window.opener.document.querySelector('input[name="flexRadioDefault"]:checked').value;
            var personnelCount = parseInt(window.opener.document.getElementById('hiddenPersonnel').value, 10) || 0;
            var childCount = parseInt(window.opener.document.getElementById('hiddenChild').value, 10) || 0;
            totalCount = personnelCount + childCount;

            var queryString = window.location.search;
            var urlParams = new URLSearchParams(queryString);

            var trainno = urlParams.get('trainno');
            var depTime = urlParams.get('depTime');
            var arrTime = urlParams.get('arrTime');
            var duration = urlParams.get('duration');
            var userid = urlParams.get('userid');
            var adultcharge = parseFloat(urlParams.get('adultcharge')) || 0;

            totalAdultCharge = adultcharge * personnelCount;
            var discountedAdultCharge = adultcharge * 0.9;
            totalChildCharge = discountedAdultCharge * childCount;

            var endCharge = totalAdultCharge + totalChildCharge;
            totalDiscount = (adultcharge - discountedAdultCharge) * childCount;
            var totalCharge = adultcharge * totalCount;

            totalAdultCharge = isValidNumber(totalAdultCharge) ? totalAdultCharge : 0;
            totalChildCharge = isValidNumber(totalChildCharge) ? totalChildCharge : 0;
            endCharge = isValidNumber(endCharge) ? endCharge : 0;
            totalCharge = isValidNumber(totalCharge) ? totalCharge : 0;
            totalDiscount = isValidNumber(totalDiscount) ? totalDiscount : 0;

            document.getElementById('startname').value = startname;
            document.getElementById('endname').value = endname;
            document.getElementById('seatType').value = seatType;
            document.getElementById('startdate').value = startdate;
            document.getElementById('trainType').value = trainType;
            document.getElementById('personnelCount').value = personnelCount;
            document.getElementById('childCount').value = childCount;
            document.getElementById('trainno').value = trainno;
            document.getElementById('depTime').value = depTime;
            document.getElementById('arrTime').value = arrTime;
            document.getElementById('duration').value = duration;
            document.getElementById('totalAdultCharge').value = totalAdultCharge;
            document.getElementById('totalChildCharge').value = totalChildCharge;
            document.getElementById('endCharge').value = endCharge;
            document.getElementById('totalCharge').value = totalCharge;
            document.getElementById('totalDiscount').value = totalDiscount;
            document.getElementById('userid').value = userid;

        }

        function isValidNumber(value) {
            return !isNaN(value) && isFinite(value);
        }

        window.addEventListener('load', function() {
            setFormValues();
            generateSeats();  
        });

        window.onload = function() {
            const firstSectionButton = document.querySelector('.hocha[data-section="section1"]');
            if (firstSectionButton) {
                toggleSeat('section1', firstSectionButton);
            }
        };

        async function seatForm(event) {
            updateSelectionInfo();
            setFormValues();

            if (selectedSeats.length < totalCount) {
                alert('선택된 좌석이 인원수보다 적습니다. 인원수에 맞는 좌석을 선택해 주세요.');
                if (event) {
                    event.preventDefault(); // 폼 제출을 방지합니다.
                }
                return;
            }

            // 폼 데이터 설정
            document.getElementById('selectedSeats').value = selectedSeats.join(',');
            document.getElementById('hocha').value = selectedHocha || '';

            // 폼 데이터를 FormData 객체로 변환
            var formData = new FormData(document.getElementById('seatForm'));

            try {
                // 비동기 요청을 통해 폼 데이터를 서버로 전송
                const response = await fetch('seat.do', {
                    method: 'POST',
                    body: formData
                });

                // 서버 응답 확인
                if (response.ok) {
                    if (window.opener) {
                        window.opener.location.href = 'reservation.do';
                        window.close();
                    } else {
                        window.location.href = 'reservation.jsp';
                    }
                } else {
                    throw new Error('서버 응답 오류');
                }
            } catch (error) {
                console.error('폼 제출 실패:', error);
                alert('폼 제출에 실패했습니다. 다시 시도해 주세요.');
            }
        }

    </script>
</head>
<body>
    <div class="seatTitle">    
        <h2>좌석 선택</h2>
    </div>
    <div class="seatAll">
        <ul class="tli">
            <li>요청하신 승객 명의 원하시는 좌석을 선택하여 주십시오.</li>
            <li>발매가 가능한 좌석을 선택하실 수 있습니다.</li>
            <li>원하시는 좌석을 선택 후 <strong>[선택좌석 예약하기]</strong> 버튼을 클릭하시면 예약이 완료됩니다.</li>
            <li>원하지 않는 좌석이 선택된 경우에는 좌석을 한번 더 클릭하시면 취소됩니다.</li>
        </ul>
        <div class="centered-container">
            <fieldset class="fie">
                <ul class="hoBa">
                    <li class="ho">
                        <button class="hocha" data-section="section1" value="1호차" onclick="toggleSeat('section1', this)">
                            <label>1호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" data-section="section2" value="2호차" onclick="toggleSeat('section2', this)">
                            <label>2호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" data-section="section3" value="3호차" onclick="toggleSeat('section3', this)">
                            <label>3호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" data-section="section4" value="4호차" onclick="toggleSeat('section4', this)">
                            <label>4호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" data-section="section5" value="5호차" onclick="toggleSeat('section5', this)">
                            <label>5호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" data-section="section6" value="6호차" onclick="toggleSeat('section6', this)">
                            <label>6호차</label>
                        </button>
                    </li>
                </ul>
            </fieldset>
        </div>
        
        <br>
        <div class="inf">
            <span><span style="color: green;">■</span> 선택좌석</span> <span><span style="color: gray;">■</span> 선택불가</span> <span>□ 선택가능</span>
        </div>
        <br>
		<ul class="line"></ul>
        <div id="section1" class="section" style="display: block;"></div>
        <div id="section2" class="section" style="display: none;"></div>
        <div id="section3" class="section" style="display: none;"></div>
        <div id="section4" class="section" style="display: none;"></div>
        <div id="section5" class="section" style="display: none;"></div>
        <div id="section6" class="section" style="display: none;"></div>
		<ul class="line"></ul>
		
		<br>
        <div>
            <span>현재 선택된 좌석:</span> <strong id="sitHo"></strong> <strong id="sitCheck"></strong>
        </div>
        
        <form id="seatForm" action="seat.do" method="post">
            <input type="hidden" id="startname" name="startname" />
            <input type="hidden" id="endname" name="endname" />
            <input type="hidden" id="seatType" name="seatType" />
            <input type="hidden" id="startdate" name="startdate" />
            <input type="hidden" id="trainType" name="trainType" />
            <input type="hidden" id="personnelCount" name="personnelCount" />
            <input type="hidden" id="childCount" name="childCount" />
            <input type="hidden" id="trainno" name="trainno" />
            <input type="hidden" id="depTime" name="depTime" />
            <input type="hidden" id="arrTime" name="arrTime" />
            <input type="hidden" id="duration" name="duration" />
            <input type="hidden" id="selectedSeats" name="selectedSeats" />
            <input type="hidden" id="hocha" name="hocha" />
            <input type="hidden" id="totalAdultCharge" name="totalAdultCharge" />
            <input type="hidden" id="totalChildCharge" name="totalChildCharge" />
            <input type="hidden" id="endCharge" name="endCharge" />
            <input type="hidden" id="totalCharge" name="totalCharge" />
            <input type="hidden" id="totalDiscount" name="totalDiscount" />
            <input type="hidden" id="userid" name="userid" />    
            
            <button id="seatReservation" type="button" onclick="seatForm()">좌석 예매하기</button>
        </form>

        <br>
    </div>         
</body>
</html>
