<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="co.yeast.dao.AirlineDAO, co.yeast.bean.AirlineVO"%>

<html>
<head>
    <title>Details</title>
    <!--  First, link the bootstrap framework -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/view.css">
</head>
<body>
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">Schedule Overview</h2>
            </div>

            <div class="card-body">
                <form method="GET" action="editform/${u.getId()}" modelAttribute="u">
                    <div class="form-row m-b-55">
                        <div class="name">Airline Info</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="col-2">
                                    <p class="input--style-5">${u.getAirline()}</p>
                                </div>
                                <div class="col-2">
                                    <p class="input--style-5">${u.getFlightNum()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Destination</div>
                        <div class="value">
                            <p class="input--style-5">${u.getDest()}</p>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Time</div>
                        <div class="value">
                            <p class="input--style-5">${u.getTakeoffTime()}</p>
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">Gate</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="col-2">
                                    <p class="input--style-5">${u.getGateAlpha()}</p>
                                </div>
                                <div class="col-2">
                                    <p class="input--style-5">${u.getGateNum()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">New Time</div>
                        <div class="value">
                            <p class="input--style-5">${takeoffTimeNew}</p>
                        </div>
                    </div>
                    <div class="form-row p-t-20">
                        <label class="label label--block">Remarks</label>
                        <div class="p-t-15">
                            <label class="radio-container m-r-45">Scheduled
                                <input type="radio" ${u.getRemark().equals("Scheduled") ? "checked" : "disabled"}>
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Boarding
                                <input type="radio" ${u.getRemark().equals("Boarding") ? "checked" : "disabled"}>
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Delayed
                                <input type="radio" ${u.getRemark().equals("Delayed") ? "checked" : "disabled"}>
                                <span class="checkmark"></span>
                            </label>
                            <label class="radio-container m-r-45">Cancelled
                                <input type="radio" ${u.getRemark().equals("Cancelled") ? "checked" : "disabled"}>
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                    <hr><br/>
                    <div class="form-row">
                        <div class="name">Manager</div>
                        <div class="value">
                            <p class="input--style-5">${managerTel}</p>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Note</div>
                        <div class="value">
                            <p class="input--style-5">${note}</p>
                        </div>
                    </div>

                    <div class="btn-wrapper">
                        <button class="btn btn--radius-2 btn--red" type="submit">EDIT</button>
                        <button class="btn btn--radius-2 btn--red" id="liveToastBtn" type="button" >DELETE</button>
                    </div>
                    <!-- Toast -->
                    <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center w-100"></div>
                    <div class="toast-container position-fixed bottom-0 end-0 p-3">
                        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
                            <div class="toast-header justify-content-center">
                                <strong>Are you sure to delete ?</strong>
                            </div>
                            <div class="toast-body">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="button" class="btn btn-primary btn-sm" id="toast-yes" onclick="location.href='deleteok/${u.getId()}'">Yes</button>
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
    // document.getElementById("deleteBtn").addEventListener("click", function() {
    //     document.getElementById("alert").style.display = "block";
    // });

    const toastTrigger = document.getElementById('liveToastBtn')
    const toastLiveExample = document.getElementById('liveToast')
    if (toastTrigger) {
        toastTrigger.addEventListener('click', () => {
            const toast = new bootstrap.Toast(toastLiveExample)

            toast.show()
        });
    }

</script>
</body>
</html>
