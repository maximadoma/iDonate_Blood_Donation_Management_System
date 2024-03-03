<?php include 'db_connect.php' ?>
<style>
    span.float-right.summary_icon {
        font-size: 3rem;
        position: absolute;
        right: 1rem;
        top: 0;
    }

    .card {
        border: none;
    }

    .donut-card,
    .table-month {
        border-radius: 8px;
        padding: 0px;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    }



    .row-stats {
        padding-top: 20px;
    }


    .imgs {
        margin: .5em;
        max-width: calc(100%);
        max-height: calc(100%);
    }

    .imgs img {
        max-width: calc(100%);
        max-height: calc(100%);
        cursor: pointer;
    }

    #imagesCarousel,
    #imagesCarousel .carousel-inner,
    #imagesCarousel .carousel-item {
        height: 60vh !important;
        background: black;
    }

    #imagesCarousel .carousel-item.active {
        display: flex !important;
    }

    #imagesCarousel .carousel-item-next {
        display: flex !important;
    }

    #imagesCarousel .carousel-item img {
        margin: auto;
    }

    #imagesCarousel img {
        width: auto !important;
        height: auto !important;
        max-height: calc(100%) !important;
        max-width: calc(100%) !important;
    }
</style>

<div class="containe-fluid">
    <div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- ?php echo "Welcome back " . $_SESSION['login_name'] . "!" ?>
                    <hr> -->

                    <!--For Dasboard Status-->

                    <h4><b>Dashboard</b></h4>
                    <hr>

                    <div class="row">
                        <div class="wrap">
                            <img class="banner" src="assets/uploads/banner_blood.png" alt="blood poster">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <div class="card">
                                <div class="card-body card-1">
                                    <div class="card-body text-dark">
                                        <span class="float-right summary_icon"><i class="fa-solid fa-user-plus"
                                                style="color: #e372a0;"></i></span>
                                        <h1><b>
                                                <?php echo $conn->query("SELECT * FROM donors")->num_rows ?>
                                            </b></h1>
                                        <p>Donors</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card">
                                <div class="card-body card-2">
                                    <div class="card-body text-dark">
                                        <span class="float-right summary_icon"><i
                                                class="fa-solid fa-hand-holding-droplet"
                                                style="color: #ffa914;"></i></span>
                                        <h1><b>
                                                <!-- $conn->query("SELECT * FROM blood_inventory where status = 1 and date(date_created) = '" . date('Y-m-d') . "' ")->num_rows ?> -->
                                                <?php echo $conn->query("SELECT * FROM blood_inventory where status = 1 ")->num_rows ?>
                                            </b></h1>
                                        <p>Donations</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card">
                                <div class="card-body card-3">
                                    <div class="card-body text-dark">
                                        <span class="float-right summary_icon"><i class="fa-solid fa-table-list"
                                                style="color: #24c292;"></i></span>
                                        <h1><b>
                                                <!-- $conn->query("SELECT * FROM requests where date(date_created) = '" . date('Y-m-d') . "' ")->num_rows ?> -->
                                                <?php echo $conn->query("SELECT * FROM requests  ")->num_rows ?>
                                            </b></h1>
                                        <p>Requests</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card">
                                <div class="card-body card-4">
                                    <div class="card-body text-dark">
                                        <span class="float-right summary_icon"><i class="fa-solid fa-circle-check"
                                                style="color: #2694e8;"></i></span>
                                        <h1><b>
                                                <!-- $conn->query("SELECT * FROM requests where date(date_created) = '" . date('Y-m-d') . "' and status = 1 ")->num_rows ?> -->
                                                <?php echo $conn->query("SELECT * FROM requests where status = 1 ")->num_rows ?>
                                            </b></h1>
                                        <p>Approved Requests</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <?php
                    $dataPoints = array();
                    $count = 0;
                    $blood_type = array("A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-");
                    foreach ($blood_type as $v) {
                        $bg_inn[$v] = 0;
                        $bg_out[$v] = 0;
                    }

                    $qry = $conn->query("SELECT * FROM blood_inventory ");
                    while ($row = $qry->fetch_assoc()) {
                        if ($row['status'] == 1) {
                            $bg_inn[$row['blood_type']] += $row['quantity'];
                        } else {
                            $bg_out[$row['blood_type']] += $row['quantity'];
                        }
                    }
                    ?>

                    <?php
                    foreach ($blood_type as $v): ?>
                        <?php
                        $dataPoints[$count]["label"] = [$v];
                        $dataPoints[$count]["y"] = [($bg_inn[$v] - $bg_out[$v])];
                        $count = $count + 1;
                        ?>
                    <?php endforeach; ?>

                   <?php

                
                $months = array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
                $dataPoints1 = array();

                // Loop through all months
                for ($i = 0; $i < count($months); $i++) {
                    $monthName = $months[$i];
                    $query = "SELECT COUNT(*) AS total_donations FROM blood_inventory WHERE MONTHNAME(date_created) = '$monthName' AND status = 1";

                    $result = mysqli_query($conn, $query);

                    if ($result->num_rows > 0) {
                        $row = mysqli_fetch_assoc($result);
                        $dataPoints1[] = array(
                            "label" => $monthName,
                            "y" => $row['total_donations']
                        );
                    } else {
                        // Handle cases where there are no donations for a month
                        $dataPoints[] = array(
                            "label" => $monthName,
                            "y" => 0
                        );
                    }
                }

                mysqli_close($conn);

               
                ?>


                    <div class="row justify-content-between row-stats">

                        <div class="col-xl-5 col-lg-5 ">
                            <div class="card donut-card">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">Inventory Stats</h6>
                                </div>

                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-7 col-lg-5">
                            <div class="card mb-4 ml-1 table-month">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">Donations Summary</h6>
                                </div>

                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <div id="chartContainer1" style="height: 370px; width: 100%;"></div>


                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!--For Dasboard Status-->


                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>



<script>

    window.onload = function () {

        CanvasJS.addColorSet("bloodColors",
            [
                "#8C2B34",
                "#F25C78",
                "#F2B2AC",
                "#D93636",
                "#F2DAAC",
                "#40D2EE",
                "#26BFBF",
                "#FFD747"
            ]);


        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            colorSet: "bloodColors",
            data: [{
                type: "doughnut",
                indexLabel: "{label} ({y})",
                dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
            }],

            credits: {
                enabled: false
            }

        });


        var chart1 = new CanvasJS.Chart("chartContainer1", {
            animationEnabled: true,
            theme: "light3",

            axisY: {
                title: "Number of Donations"
            },
            data: [{
                type: "bar",
                dataPoints: <?php echo json_encode($dataPoints1, JSON_NUMERIC_CHECK); ?>
            }]
        });

        chart.render();
        chart1.render();


    }




    $('#manage-records').submit(function (e) {
        e.preventDefault()
        start_load()
        $.ajax({
            url: 'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function (resp) {
                resp = JSON.parse(resp)
                if (resp.status == 1) {
                    alert_toast("Data successfully saved", 'success')
                    setTimeout(function () {
                        location.reload()
                    }, 800)

                }

            }
        })
    })
    $('#tracking_id').on('keypress', function (e) {
        if (e.which == 13) {
            get_person()
        }
    })
    $('#check').on('click', function (e) {
        get_person()
    })
    function get_person() {
        start_load()
        $.ajax({
            url: 'ajax.php?action=get_pdetails',
            method: "POST",
            data: { tracking_id: $('#tracking_id').val() },
            success: function (resp) {
                if (resp) {
                    resp = JSON.parse(resp)
                    if (resp.status == 1) {
                        $('#name').html(resp.name)
                        $('#address').html(resp.address)
                        $('[name="person_id"]').val(resp.id)
                        $('#details').show()
                        end_load()

                    } else if (resp.status == 2) {
                        alert_toast("Unknow tracking id.", 'danger');
                        end_load();
                    }
                }
            }
        })
    }

</script>