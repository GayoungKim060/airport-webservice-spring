<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!--  First, link the bootstrap framework -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/addform.css">
    <title>form.html</title>
</head>
<body>
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">Schedule Registration</h2>
            </div>
            <div class="card-body">
                <!-- onsubmit -->
                <!-- action="index.php" -->
                <!-- method="GET" 방식으로 넘어가는 name, value 확인 -->
                <form action="addok" id="form" method="POST" name="submitForm">
                    <div class="form-row m-b-55">
                        <div class="name">Airline Info</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group-desc">
                                        <input class="input--style-5" type="text" id="input-airline" name="airline" placeholder="ex) Korean" required>
                                        <label class="label--desc">Airline</label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group-desc">
                                        <input class="input--style-5" type="text" id="input-flight" name="flightNum" placeholder="ex) 11023" required>
                                        <label class="label--desc">Flight</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Destination</div>
                        <div class="value">
                            <div class="input-group">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown-country" data-bs-toggle="dropdown" aria-expanded="false">
                                        Country
                                    </button>
                                    <input type="hidden" name="dest" class="selected-value" value="">
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" data-value="New York">New York</a></li>
                                        <li><a class="dropdown-item" data-value="Berlin">Berlin</a></li>
                                        <li><a class="dropdown-item" data-value="Paris">Paris</a></li>
                                        <li><a class="dropdown-item" data-value="Roman">Roman</a></li>
                                        <li><a class="dropdown-item" data-value="Los Angeles">Los Angeles</a></li>
                                        <li><a class="dropdown-item" data-value="Pyongyang">Pyongyang</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Time</div>
                        <div class="value">
                            <div class="input-group">
                                <input type="time" class="input--style-5" id="input-time" name="takeoffTime" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Gate</div>
                        <div class="value">
                            <div class="input-group">
                                <div class="dropdown m-r-55">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown-alphabet" data-bs-toggle="dropdown" aria-expanded="false">
                                        Alphabet
                                    </button>
                                    <input type="hidden" name="gateAlpha" class="selected-value" value="">
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" data-value="A">A</a></li>
                                        <li><a class="dropdown-item" data-value="B">B</a></li>
                                        <li><a class="dropdown-item" data-value="C">C</a></li>
                                    </ul>
                                </div>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown-number" data-bs-toggle="dropdown" aria-expanded="false">
                                        Number
                                    </button>
                                    <input type="hidden" name="gateNum" class="selected-value" value="">
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" data-value="1">1</a></li>
                                        <li><a class="dropdown-item" data-value="2">2</a></li>
                                        <li><a class="dropdown-item" data-value="3">3</a></li>
                                        <li><a class="dropdown-item" data-value="4">4</a></li>
                                        <li><a class="dropdown-item" data-value="5">5</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">New Time</div>
                        <div class="value">
                            <div class="input-group">
                                <input type="time" class="input--style-5" id="input-new-time" name="takeoffTimeNew"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row p-t-20">
                        <label class="label label--block" id="remark">Remarks</label>
                        <div class="p-t-15">
                            <label class="radio-container m-r-45">Scheduled
                                <input type="radio" name="remark" value="Scheduled" required checked>
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Boarding
                                <input type="radio" name="remark" value="Boarding">
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Delayed
                                <input type="radio" name="remark" value="Delayed">
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Cancelled
                                <input type="radio" name="remark" value="Cancelled">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                    <hr><br/>
                    <div class="form-row">
                        <div class="name">Manager</div>
                        <div class="value">
                            <input type="tel" class="input--style-5" name="managerTel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex) 010-0000-0000">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Note</div>
                        <div class="value">
                            <input type="text" class="input--style-5" name="note" value="">
                        </div>
                    </div>

                    <div class="btn-wrapper">
                        <button class="btn btn--radius-2 btn--red" id="liveAlertBtn" type="submit">ADD</button>
                    </div>

                    <!-- alert-success -->
                    <div id="liveAlert" class="alert alert-primary invisible position-fixed bottom-0 end-0 p-3 " role="alert" >
                        <h4 class="alert-heading">The data was successfully added</h4>
                        <p class="mb-0">Move main page after <span id="countdown" class="fw-bold">3</span> seconds</p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    // onload는 모든 요소가 DOM 트리 생성 후 리소스 모두 불러온 후 실행, DOMContentLoaded는 리소스 기다리지 않음
    window.onload = function (){
        // airline input 이벤트 처리
        const inputAirline = document.getElementById("input-airline");
        inputAirline.addEventListener("input", function() {
            const alphaRegex = /^[a-zA-Z]+$/;                   // 알파벳만 허용하는 정규 표현식

            if (inputAirline.value.trim() === "") {
                inputAirline.style.backgroundColor = "#E5E5E5";
            } else if (!alphaRegex.test(inputAirline.value.trim())) {
                inputAirline.style.backgroundColor = "#ff4b5a"; // 입력값이 알파벳만으로 이뤄지지 않은 경우 배경색을 빨간색으로 변경
            } else {
                inputAirline.style.backgroundColor = "skyblue"; // 규칙에 맞는 경우
            }
        });

        // flightNum input 이벤트처리
        const inputFlight = document.getElementById("input-flight");
        inputFlight.addEventListener("input", function() {
            const numericRegex = /^\d{5}$/;     // 5자리 숫자만 허용하는 정규 표현식

            if (inputFlight.value.trim() === "") {
                inputFlight.style.backgroundColor = "#E5E5E5";
            } else if (!numericRegex.test(inputFlight.value.trim())) {
                inputFlight.style.backgroundColor = "#ff4b5a"; // 입력값이 알파벳만으로 이뤄지지 않은 경우 배경색을 빨간색으로 변경
            } else {
                inputFlight.style.backgroundColor = "skyblue"; // 규칙에 맞는 경우
            }
        });

        // country,gate 유효성 검사- 색상 변경, input 타입 생성하여 데이터 생성
        const dropdownItems = document.querySelectorAll(".dropdown-item");
        dropdownItems.forEach(item => {
            item.addEventListener("click", function() {
                let dropdownButton = this.closest('.dropdown').querySelector('.dropdown-toggle');

                if(dropdownButton.id == 'dropdown-country'){
                    document.getElementById('dropdown-country').value = item.innerHTML;
                }else if(dropdownButton.id == 'dropdown-alphabet'){
                    document.getElementById('dropdown-alphabet').value = item.innerHTML;
                }else if(dropdownButton.id == 'dropdown-number'){
                    document.getElementById('dropdown-number').value = item.innerHTML;
                }else{}

                dropdownButton.style.backgroundColor = "skyblue";
                dropdownButton.style.border = "none";
            });
        });

        // time 유효성 검사- 색상변경
        const timeInput = document.getElementById("input-time");
        timeInput.addEventListener("change", function() {
            if (timeInput.value !== "") {       // 입력값이 존재하면
                timeInput.style.backgroundColor = "skyblue";
            }
        });
        // newtime 유효성 검사- 선택시 scheduled, cancelled 선택 못함 TODO
        let timeNew= document.getElementById("input-new-time");
        timeNew.addEventListener("change", function() {
            if (timeNew.value !== "") {         // 입력값이 존재하면
                timeNew.style.backgroundColor = "skyblue";
            }
        });

        // radio 유효성 검사- delayed선택시 new time을 선택해야함
        const radioEle = document.getElementsByName("remark");
        radioEle.forEach(item => {
            item.addEventListener("click", function (){
                // TODO validation check to radio
            });
        });


        // submit 역할 button 눌렀을때 이벤트 처리
        document.getElementById("liveAlertBtn").addEventListener("click", function () {
            let airplaneVal = document.getElementById("input-airline").value.trim();
            let flightVal = document.getElementById("input-flight").value.trim();
            let destinationVal = document.getElementById("dropdown-country").value.trim();
            let timeVal = document.getElementById("input-time").value.trim();
            let alphabetVal = document.getElementById("dropdown-alphabet").value.trim();
            let numberVal = document.getElementById("dropdown-number").value.trim();
            //let radioVal = document.querySelector('input[type=radio]:checked').value;

            // 전체 input 유효성 검사 -> onsubmit 활용 가능
            if(!validateRequired(airplaneVal,flightVal, destinationVal, timeVal, alphabetVal, numberVal)) {
                // 입력항목을 선택하지 않은 요소가 있는 경우 (value값이 없는 경우)
                alert('Required field is not filled')
            }else if(!validateForm(airplaneVal, flightVal)){
                // 입력항목이 잘못된 형식으로 입력된 경우
                alert('Invalid field exists')
            }else{  // 유효성검사 통과: 모든 값이 제대로 입력되었을때 페이지 이동
                const alert = document.querySelector("#liveAlert");
                alert.classList.remove("invisible");

                let countdown = 3; // 3초 카운트다운 시작
                const countdownElement = document.getElementById('countdown');

                // 3초 설정 setTimeout(function () {  }, 3000);
                // 1초마다 카운트다운 갱신
                const countdownInterval = setInterval(function () {
                    countdown--;
                    countdownElement.innerText = `${countdown}`;
                    if (countdown <= 0) {
                        // form 정보 전송
                        document.getElementById('form').submit();
                        // 카운트다운이 끝나면 메인 페이지로 이동하고 인터벌을 제거
                        // window.location.href = "view.jsp";
                        clearInterval(countdownInterval);
                    }
                }, 1000);
            }

        }); // end of ("liveAlertBtn").addEventListener("click")

        function validateRequired(airplaneVal,flightVal, destinationVal, timeVal, alphabetVal, numberVal){
            if(airplaneVal.length>0 && flightVal.length>0 && destinationVal.length>0 && timeVal.length>0
                && alphabetVal.length>0 && numberVal.length>0 ){
                return true;
            }else return false;
        }

        function validateForm(airplaneVal, flightVal){
            const alphaRegex = /^[a-zA-Z]+$/;   // 알파벳만 허용하는 정규 표현식
            const numericRegex = /^\d{5}$/;     // 5자리 숫자만 허용하는 정규 표현식

            if(alphaRegex.test(airplaneVal) && numericRegex.test(flightVal)){
                return true;
            }else return false;
        }

        // Dropdown 아이템을 클릭할 때 선택된 값을 해당 버튼에 표시
        document.querySelectorAll('.dropdown-item').forEach(function(item) {
            item.addEventListener('click', function() {
                var selectedValue = this.getAttribute('data-value');
                var dropdownButton = this.closest('.dropdown').querySelector('.dropdown-toggle');

                dropdownButton.textContent = selectedValue;

                // name, value 값 설정
                var selectedHidden = this.closest('.dropdown').querySelector('.selected-value');
                selectedHidden.value = selectedValue;
            });
        });


        // input 태그에 blur 이벤트를 추가하여 시간 형식을 조작
        var inputTime = document.getElementById('input-time');
        var inputTimeNew = document.getElementById('input-new-time');
        if (inputTime || inputTimeNew) {
            inputTime.addEventListener('blur', function () {
                // 현재 입력된 값을 가져옴
                var currentTime = this.value;

                // 만약 값이 비어있다면 아무 것도 하지 않음
                if (!currentTime) {
                    return;
                }

                // 시간을 HH:mm:00 형식으로 변환
                this.value = currentTime + ':00';
                console.log(this.value);
            });

            inputTimeNew.addEventListener('blur', function () {
                // 현재 입력된 값을 가져옴
                var currentTimeNew = this.value;

                // 만약 값이 비어있다면 아무 것도 하지 않음
                if (!currentTimeNew) {
                    return;
                }

                // 시간을 HH:mm:00 형식으로 변환
                this.value = currentTimeNew + ':00';
                console.log(this.value);
            });
        }
    }; // END OF "window.onload"

</script>
</body>
</html>
