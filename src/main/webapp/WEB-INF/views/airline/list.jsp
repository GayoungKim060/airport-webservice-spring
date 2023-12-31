<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="co.yeast.dao.AirlineDAO, co.yeast.bean.AirlineVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HAN Airport</title>
    <link rel="stylesheet" href="/css/posts.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<!-- HEADER -->
<header class="p-3 text-bg-dark d-flex flex-wrap justify-content-between align-item-center" >
    <div id="menu-wrapper" class="">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/img/logo_seagull.png" class="logo-seagull"/>
                HAN Airport
            </a></li>
        </ul>
    </div>

    <div id="header-clock" class="d-flex ">
        <div class="m-2 " id="date"></div>
        <div class="m-2 " id="time"></div>
        <div class="m-2 d-none " id="area">Seoul</div>
    </div>

    <div id="user-wrapper" class="text-end d-flex flex-row">
        <button type="button" class="btn btn-light m-1"><img src="/img/icon_settings.png"></button>
        <button type="button" class="btn btn-light m-1"><img src="/img/icon_alarm.png"></button>
        <button type="button" class="btn btn-light m-1"><img src="/img/icon_user.png"></button>
    </div>
</header>

<!-- TABLE -->
<div class="col-12 col-sm-12 col-md-12">
    <div class="card">
        <div class="card-header">
            <div id="card-header-left" class="d-flex flex-wrap justify-content-between" >
                <h2 class="">Departures</h2>
                <%--   Search Form   --%>
                <form action="searchtext" id="form-searchtext" method="GET">
                    <div class="search-wrapper ">
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownButton" data-bs-toggle="dropdown" aria-expanded="false">
                                Type
                            </button>
                            <input type="hidden" id="hiddenType" name="searchType" value="">
                            <ul class="dropdown-menu" id="dropdownMenu">
                                <li><a class="dropdown-item" href="#" data-value="Airline">Airline</a></li>
                                <li><a class="dropdown-item" href="#" data-value="FlightNum">Flight Number</a></li>
                                <li><a class="dropdown-item" href="#" data-value="Dest">Destination</a></li>
                                <li><a class="dropdown-item" href="#" data-value="GateAlpha">Gate</a></li>
                            </ul>
                        </div>
                        <input type="search" class="text-bg-white " id="search-input" placeholder="search" aria-label="Search" name="keyword">
                        <img src="/img/icon_search_delete.png" class="btn-clear">
                    </div>
                </form>
            </div>
            <%--   Search Form   --%>
            <form action="searchRemark" method="POST" id="form-searchRemark">
                <div id="card-header-right" class="d-flex flex-wrap justify-content-around align-items-baseline" >
                    <input type="hidden" id="hiddenRemark" name="remark" value="">
                    <div class="badge-wrapper">
                        <span class="badge rounded-pill text-bg-primary fs-6" id="boardingBadge" onclick="sort('Boarding')">Boarding</span>
                        <span class="badge rounded-pill text-bg-warning text-white fs-6" id="delayedBadge" onclick="sort('Delayed')">Delayed</span>
                        <span class="badge rounded-pill text-bg-danger fs-6" id="cancelledBadge" onclick="sort('Cancelled')">Cancelled</span>
                        <span class="badge rounded-pill text-bg-dark fs-6" id="scheduledBadge"onclick="sort('Scheduled')">Scheduled</span>
                    </div>

                    <button type="button" class="btn btn-outline-dark me-2" onclick="location.href='add'">Add</button>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="media-list position-relative">
                <div class="table-responsive" id="project-team-scroll" tabindex="1" style="height: 400px; overflow: scroll; outline: none;">
                    <table class="table table-hover table-xl">
                        <thead>
                        <tr>
                            <th class="text-center">NO</th>
                            <th></th>
                            <th>Airline</th>
                            <th class="text-center">Flight</th>
                            <th>Destination</th>
                            <th class="text-center">Time</th>
                            <th class="text-center">Gate</th>
                            <th class="text-center">New Time</th>
                            <th class="text-center">Remarks</th>
                            <th class="text-center">Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="u" varStatus="status">
                            <tr onclick="location.href='view?id=${u.getId()}'">
                                <td class="text-truncate text-center">${u.getId()}</td>
                                <td><img src="/img/logo_${u.getAirline()}.png" alt="airlineLogo"></td>
                                <td class="text-truncate">
                                        ${u.getAirline()} AIR
                                </td>
                                <td class="text-truncate text-center">${u.getFlightName()} ${u.getFlightNum()}</td>
                                <td class="text-truncate">${u.getDest()}</td>
                                <td class="text-truncate text-center">${u.getTakeoffTime()}</td>
                                <td class="text-truncate text-center">${u.getGateAlpha()}${u.getGateNum()}</td>

                                <%--   <td class="text-truncate text-center">${u.getTakeoffTimeNew().substring(0, 5) eq "null:" ? '' : u.getTakeoffTimeNew().substring(0,5)}</td>   --%>
                                <%--    JSTL에서는 loop.index로 현재 인덱스에 접근할 수 있습니다.     --%>
                                <td class="text-truncate text-center">${formattedTime[status.index]}</td>

                                <c:choose>
                                    <c:when test="${u.getRemark() eq 'Boarding'}">
                                        <td class="text-truncate"><div class="text boarding text-center">${u.getRemark()}</div></td>
                                    </c:when>
                                    <c:when test="${u.getRemark() eq 'Delayed'}">
                                        <td class="text-truncate"><div class="text delayed text-center">${u.getRemark()}</div></td>
                                    </c:when>
                                    <c:when test="${u.getRemark() eq 'Cancelled'}">
                                        <td class="text-truncate"><div class="text cancelled text-center">${u.getRemark()}</div></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="text-truncate"><div class="text text-center">${u.getRemark()}</div></td>
                                    </c:otherwise>
                                </c:choose>

                                <td class="text-truncate text-center">
                                    <a href="editform/${u.getId()}"><img src="/img/icon_editor.png" alt="edit" class="m-r-14"></a>
                                    <%-- confirm창 후 넘어가기? js로 처리해야하는데 tr list때문에 적용안됨 --%>
                                    <a href="deleteok/${u.getId()}"><img src="/img/icon_delete.png" alt="delete"></a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Pagination: paging, pager -->
        <div class="d-flex justify-content-center">
            <nav aria-label="...">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <span class="page-link">Previous</span>
                    </li>
                    <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
                    <li class="page-item" ><span class="page-link">2</span></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top text-bg-dark">
    <div class="col-md-4 d-flex align-items-center">
        <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
        </a>
        <div class="d-inline-block">
            <span class="mb-3 mb-md-0 text-body-secondary">2023 Handong in Pohang, Republic of Korea, Univ </span>
            <a href="https://www.handong.edu/kor/"><img src="/img/icon_univ.png" style="width: 20px; background: white"></a>
        </div>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
    </ul>
</footer>
<!-- Bootstrap JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
    const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
    const hiddenType = document.getElementById('hiddenType');
    const formSearchText = document.getElementById('form-searchtext');

    var dropdownButton = document.getElementById('dropdownButton');
    document.querySelectorAll('.dropdown-item').forEach(function (item) {
        item.addEventListener('click', function () {
            var selectedValue = this.getAttribute('data-value');

            dropdownButton.textContent = selectedValue;
            hiddenType.value = selectedValue.toLowerCase();

            // 선택한 아이템의 값을 버튼의 value 속성에 업데이트
            console.log(hiddenType.value);
            console.log()
        });
    });

    const inputSearch = document.getElementById('search-input');

    // 'myInput' 엘리먼트에 대해 'keydown' 이벤트 리스너를 등록합니다.
    inputSearch.addEventListener('keydown', function (event) {
        // event.key를 통해 눌린 키의 값에 접근할 수 있습니다.
        if (event.key === 'Enter') {
            // 엔터 키가 입력되었을 때 실행할 동작을 여기에 추가합니다.
            document.getElementById('form-searchtext').submit();
        }
    });

    const hiddenRemark = document.getElementById('hiddenRemark');
    // sort 함수 정의
    function sort(parameter) {
        hiddenRemark.value = parameter;
        document.getElementById('form-searchRemark').submit();
    }

    // window.ready
    window.onload = function (){

        // Badge 클릭시 해당 카테고리만 디스플레이

        // clear 이미지 클릭시 부모 내용 삭제
        const btnClear = document.querySelectorAll('.btn-clear');
        btnClear.forEach(function(btn){
            btn.addEventListener('click', function(){
                btn.parentNode.querySelector('input').value = "";
            })
        })

        // header clock
        window.setInterval(ut, 500);
        function ut() {
            var d = new Date();
            document.getElementById("time").innerHTML = d.toLocaleTimeString();
            document.getElementById("date").innerHTML = d.toLocaleDateString();
            document.getElementById("area").classList.remove('d-none');
        }

        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deleteok/' + id;
            //  아무것도 안해주면 <tr onclick>이 적용되서 view페이지로 넘어감, reload 해줘야함
            window.location.reload();
        }
    };

</script>
</body>
</html>
