<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="co.yeast.dao.AirlineDAO, co.yeast.bean.AirlineVO"%>
<html>
<head>
    <title>Edit</title>
    <!--  First, link the bootstrap framework -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/addform.css">
</head>
<body>

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">Schedule Edit</h2>
            </div>
            <div class="card-body">
                <!-- onsubmit -->
                <!-- action="index.php" -->
                <!-- method="GET" 방식으로 넘어가는 name, value 확인 -->
                <form action="../editok" method="POST" modelAttribute="u">
                    <input type="hidden" name="id" value="${u.getId()}" />
                    <div class="form-row m-b-55">
                        <div class="name">Airline Info</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group-desc">
                                        <input class="input--style-5" type="text" name="airline" id="input-airline" placeholder="ex) Korean" value="${u.getAirline()}">
                                        <label class="label--desc">Airline</label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group-desc">
                                        <input class="input--style-5" type="text" name="flightNum" id="input-flight" placeholder="ex) 11023" value="${u.getFlightNum()}">
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
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown-country" data-bs-toggle="dropdown" value="${u.getDest()}" aria-expanded="false">
                                        ${u.getDest()}
                                    </button>
                                    <input type="hidden" name="dest" class="selected-value" value="${u.getDest()}">
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
                                <input type="time" class="input--style-5" id="input-time" name="takeoffTime" value="${u.getTakeoffTime().substring(0, 5)}">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Gate</div>
                        <div class="value">
                            <div class="input-group">
                                <div class="dropdown m-r-55">
                                    <button class="btn btn-secondary dropdown-toggle" id="dropdown-alphabet" value="${u.getGateAlpha()}" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        ${u.getGateAlpha()}
                                    </button>
                                    <input type="hidden" name="gateAlpha" class="selected-value" value="${u.getGateAlpha()}">
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" data-value="A">A</a></li>
                                        <li><a class="dropdown-item" data-value="B">B</a></li>
                                        <li><a class="dropdown-item" data-value="C">C</a></li>
                                    </ul>
                                </div>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown-number" value="${u.getGateNum()}" data-bs-toggle="dropdown" aria-expanded="false">
                                        ${u.getGateNum()}
                                    </button>
                                    <input type="hidden" name="gateNum" class="selected-value" value="${u.getGateNum()}">
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
                                <input type="time" id="timeNew" class="input--style-5" name="takeoffTimeNew" value="${u.getTakeoffTimeNew().substring(0, 5)}"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row p-t-20">
                        <label class="label label--block">Remarks</label>

                        <div class="p-t-15">
                            <label class="radio-container m-r-45">Scheduled
                                <input type="radio" name="remark" value="Scheduled">
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Boarding
                                <input type="radio" name="remark" value="Boarding">
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Delayed
                                <input type="radio" id="delayedRadio" name="remark" value="Delayed">
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
                            <input type="tel" class="input--style-5" name="managerTel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex) 010-0000-0000" value="${u.managerTel != null ? u.managerTel : ""}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Note</div>
                        <div class="value">
                            <input type="text" class="input--style-5" name="note" value="${u.note != null ? u.note : ""}">
                        </div>
                    </div>

                    <div class="btn-wrapper">
                        <button class="btn btn--radius-2 btn--red" id="liveToastBtn" type="button">EDIT</button>
                    </div>
                    <!-- Toast -->
                    <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center w-100"></div>
                    <div class="toast-container position-fixed bottom-0 end-0 p-3">
                        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
                            <div class="toast-header justify-content-center">
                                <strong>Are you sure to edit ?</strong>
                            </div>
                            <div class="toast-body">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="submit" class="btn btn-primary btn-sm" id="toast-yes">Yes</button>
                                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
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

    // Dropdown default value - 데이터 베이스 연결시 추가작업 필요
    // querySelectorAll은 nodeList 형태로 반환 (VS HTMLElement)
    window.addEventListener("DOMContentLoaded", function() {
        /* 처음 값으로 셋팅
        document.querySelectorAll('.dropdown-toggle').forEach(function(item) {
          var firstItem = item.nextElementSibling.children[0].firstChild;
          item.textContent = firstItem.textContent;
        });
        */

        // New time 선택시 "delayed" 라디오버튼 자동 선택
        document.getElementById("timeNew").addEventListener("click", function (){
            document.getElementById('delayedRadio').checked = true;
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
            });
        });

        // Radio button 데이터 처리
        console.log("Remark value: ${u.getRemark()}");

        var remarkValue = '${u.getRemark()}';

        // Check the radio button based on the value of ${u.getRemark()}
        switch (remarkValue) {
            case 'Scheduled':
                document.querySelector('input[name="remark"][value="Scheduled"]').checked = true;
                break;
            case 'Boarding':
                document.querySelector('input[name="remark"][value="Boarding"]').checked = true;
                break;
            case 'Delayed':
                document.querySelector('input[name="remark"][value="Delayed"]').checked = true;
                break;
            case 'Cancelled':
                document.querySelector('input[name="remark"][value="Cancelled"]').checked = true;
                break;
            // Add more cases if needed
            default:
                // Default case if ${u.getRemark()} does not match any expected values
                break;
        }
        // 다른 값을 선택할때 처리??


        document.getElementById("liveToastBtn").addEventListener("click", function (){
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
            }else {  // 유효성검사 통과: 모든 값이 제대로 입력되었을때 페이지 이동
                // Toast창 디스플레이

                const toastLiveExample = document.getElementById('liveToast')
                const toast = new bootstrap.Toast(toastLiveExample)
                toast.show()

                // 토스트의 확인을 누르면 이동


            }

        }); // end of ("liveToastBtn").addEventListener("click")

        function validateRequired(airplaneVal,flightVal, destinationVal, timeVal, alphabetVal, numberVal){
            console.log(airplaneVal)
            console.log(flightVal)
            console.log(destinationVal)
            console.log(timeVal)
            console.log(alphabetVal)
            console.log(numberVal)
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


    });
</script>

</body>
</html>
