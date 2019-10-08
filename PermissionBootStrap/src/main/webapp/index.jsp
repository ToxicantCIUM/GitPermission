<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <%
        String ctx=request.getContextPath();
        request.setAttribute("ctx",ctx);
    %>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <!-- Google fonts - Muli-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]-->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <!-- JavaScript files-->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/popper.js/umd/popper.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="static/vendor/chart.js/Chart.min.js"></script>
    <script src="static/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="static/js/charts-home.js"></script>
    <script src="static/js/front.js"></script>
    <script src="${pageContext.request.contextPath}/js/template.js"></script>

    <![endif]-->
</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg">
        <div class="search-panel">
            <div class="search-inner d-flex align-items-center justify-content-center">
                <div class="close-btn">关闭 <i class="fa fa-close"></i></div>
                <form id="searchForm" action="#">
                    <div class="form-group">
                        <input type="search" name="search" placeholder="What are you searching for...">
                        <button type="submit" class="submit">搜索</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <div class="navbar-header">
                <!-- Navbar Header-->
                <a href="index.jsp" class="navbar-brand">
                    <div class="brand-text brand-big visible text-uppercase"><strong
                            class="text-primary">权限</strong><strong>管理</strong></div>
                    <div class="brand-text brand-sm"><strong class="text-primary">权</strong><strong>限</strong></div>
                </a>
                <!-- Sidebar Toggle Btn  左侧的按钮-->
                <button class="sidebar-toggle"><i class="fa fa-long-arrow-left"></i></button>
            </div>

            <div class="right-menu list-inline no-margin-bottom">
                <div class="list-inline-item"><a href="#" class="search-open nav-link"><i
                        class="icon-magnifying-glass-browser"></i></a></div>
                <div class="list-inline-item dropdown"><a id="navbarDropdownMenuLink1" href="#" data-toggle="dropdown"
                                                          aria-haspopup="true" aria-expanded="false"
                                                          class="nav-link messages-toggle"><i
                        class="icon-email"></i><span class="badge dashbg-1">5</span></a>
                    <div aria-labelledby="navbarDropdownMenuLink1" class="dropdown-menu messages"><a href="#"
                                                                                                     class="dropdown-item message d-flex align-items-center">

                        <div class="profile">
                            <img src="static/img/avatar-3.jpg" alt="..." class="img-fluid">
                            <div class="status online"></div>
                        </div>

                        <div class="content">
                            <strong class="d-block">Nadia Halsey</strong>
                            <span class="d-block">lorem ipsum dolor sit amit</span>
                            <small class="date d-block">9:30am</small>
                        </div>
                    </a><a href="#" class="dropdown-item message d-flex align-items-center">
                        <div class="profile"><img src="static/img/avatar-2.jpg" alt="..." class="img-fluid">
                            <div class="status away"></div>
                        </div>
                        <div class="content"><strong class="d-block">Peter Ramsy</strong><span class="d-block">lorem ipsum dolor sit amit</span><small
                                class="date d-block">7:40am</small></div>
                    </a><a href="#" class="dropdown-item message d-flex align-items-center">
                        <div class="profile"><img src="static/img/avatar-1.jpg" alt="..." class="img-fluid">
                            <div class="status busy"></div>
                        </div>
                        <div class="content"><strong class="d-block">Sam Kaheil</strong><span class="d-block">lorem ipsum dolor sit amit</span><small
                                class="date d-block">6:55am</small></div>
                    </a><a href="#" class="dropdown-item message d-flex align-items-center">
                        <div class="profile"><img src="static/img/avatar-5.jpg" alt="..." class="img-fluid">
                            <div class="status offline"></div>
                        </div>
                        <div class="content"><strong class="d-block">Sara Wood</strong><span class="d-block">lorem ipsum dolor sit amit</span><small
                                class="date d-block">10:30pm</small></div>
                    </a><a href="#" class="dropdown-item text-center message"> <strong>See All Messages <i
                            class="fa fa-angle-right"></i></strong></a></div>
                </div>
                <!-- Tasks-->
                <div class="list-inline-item dropdown"><a id="navbarDropdownMenuLink2" href="#" data-toggle="dropdown"
                                                          aria-haspopup="true" aria-expanded="false"
                                                          class="nav-link tasks-toggle"><i
                        class="icon-new-file"></i><span class="badge dashbg-3">9</span></a>
                    <div aria-labelledby="navbarDropdownMenuLink2" class="dropdown-menu tasks-list"><a href="#"
                                                                                                       class="dropdown-item">
                        <div class="text d-flex justify-content-between"><strong>Task
                            1</strong><span>40% complete</span></div>
                        <div class="progress">
                            <div role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0"
                                 aria-valuemax="100" class="progress-bar dashbg-1"></div>

                        </div>
                    </a><a href="#" class="dropdown-item">
                        <div class="text d-flex justify-content-between"><strong>Task
                            2</strong><span>20% complete</span></div>
                        <div class="progress">
                            <div role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0"
                                 aria-valuemax="100" class="progress-bar dashbg-3"></div>
                        </div>
                    </a><a href="#" class="dropdown-item">
                        <div class="text d-flex justify-content-between"><strong>Task
                            3</strong><span>70% complete</span></div>
                        <div class="progress">
                            <div role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
                                 aria-valuemax="100" class="progress-bar dashbg-2"></div>
                        </div>
                    </a><a href="#" class="dropdown-item">
                        <div class="text d-flex justify-content-between"><strong>Task
                            4</strong><span>30% complete</span></div>
                        <div class="progress">
                            <div role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0"
                                 aria-valuemax="100" class="progress-bar dashbg-4"></div>
                        </div>
                    </a><a href="#" class="dropdown-item">
                        <div class="text d-flex justify-content-between"><strong>Task
                            5</strong><span>65% complete</span></div>
                        <div class="progress">
                            <div role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0"
                                 aria-valuemax="100" class="progress-bar dashbg-1"></div>
                        </div>
                    </a><a href="#" class="dropdown-item text-center"> <strong>See All Tasks <i
                            class="fa fa-angle-right"></i></strong></a>
                    </div>
                </div>
                <!-- Tasks end-->
                <!-- Megamenu-->
                <div class="list-inline-item dropdown menu-large"><a href="#" data-toggle="dropdown" class="nav-link">Mega
                    <i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu megamenu">
                        <div class="row">
                            <div class="col-lg-3 col-md-6"><strong class="text-uppercase">Elements Heading</strong>
                                <ul class="list-unstyled mb-3">
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Sed ut perspiciatis</a></li>
                                    <li><a href="#">Voluptatum deleniti</a></li>
                                    <li><a href="#">At vero eos</a></li>
                                    <li><a href="#">Consectetur adipiscing</a></li>
                                    <li><a href="#">Duis aute irure</a></li>
                                    <li><a href="#">Necessitatibus saepe</a></li>
                                    <li><a href="#">Maiores alias</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 col-md-6"><strong class="text-uppercase">Elements Heading</strong>
                                <ul class="list-unstyled mb-3">
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Sed ut perspiciatis</a></li>
                                    <li><a href="#">Voluptatum deleniti</a></li>
                                    <li><a href="#">At vero eos</a></li>
                                    <li><a href="#">Consectetur adipiscing</a></li>
                                    <li><a href="#">Duis aute irure</a></li>
                                    <li><a href="#">Necessitatibus saepe</a></li>
                                    <li><a href="#">Maiores alias</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 col-md-6"><strong class="text-uppercase">Elements Heading</strong>
                                <ul class="list-unstyled mb-3">
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Sed ut perspiciatis</a></li>
                                    <li><a href="#">Voluptatum deleniti</a></li>
                                    <li><a href="#">At vero eos</a></li>
                                    <li><a href="#">Consectetur adipiscing</a></li>
                                    <li><a href="#">Duis aute irure</a></li>
                                    <li><a href="#">Necessitatibus saepe</a></li>
                                    <li><a href="#">Maiores alias</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 col-md-6"><strong class="text-uppercase">Elements Heading</strong>
                                <ul class="list-unstyled mb-3">
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Sed ut perspiciatis</a></li>
                                    <li><a href="#">Voluptatum deleniti</a></li>
                                    <li><a href="#">At vero eos</a></li>
                                    <li><a href="#">Consectetur adipiscing</a></li>
                                    <li><a href="#">Duis aute irure</a></li>
                                    <li><a href="#">Necessitatibus saepe</a></li>
                                    <li><a href="#">Maiores alias</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row megamenu-buttons text-center">
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link dashbg-1"><i
                                    class="fa fa-clock-o"></i><strong>Demo 1</strong></a></div>
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link dashbg-2"><i
                                    class="fa fa-clock-o"></i><strong>Demo 2</strong></a></div>
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link dashbg-3"><i
                                    class="fa fa-clock-o"></i><strong>Demo 3</strong></a></div>
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link dashbg-4"><i
                                    class="fa fa-clock-o"></i><strong>Demo 4</strong></a></div>
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link bg-danger"><i
                                    class="fa fa-clock-o"></i><strong>Demo 5</strong></a></div>
                            <div class="col-lg-2 col-md-4"><a href="#" class="d-block megamenu-button-link bg-info"><i
                                    class="fa fa-clock-o"></i><strong>Demo 6</strong></a></div>
                        </div>
                    </div>
                </div>
                <!-- Megamenu end     -->
                <!-- 选择语言    -->
                <div class="list-inline-item dropdown">
                    <a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle">
                        <img src="static/img/flags/16/CN.png" alt="English">
                        <span class="d-none d-sm-inline-block">简体中文</span>
                    </a>
                    <div aria-labelledby="languages" class="dropdown-menu"><a rel="nofollow" href="#"
                                                                              class="dropdown-item"> <img
                            src="static/img/flags/16/DE.png" alt="English" class="mr-2"><span>German</span></a><a
                            rel="nofollow" href="#" class="dropdown-item"> <img src="static/img/flags/16/FR.png"
                                                                                alt="English"
                                                                                class="mr-2"><span>French  </span></a>
                    </div>
                </div>
                <!-- 退出               -->
                <div class="list-inline-item logout">
                    <a id="logout" href="login.jsp" class="nav-link">
                        <span class="d-none d-sm-inline">Logout </span>
                        <i class="icon-logout"></i>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>


<div class="d-flex align-items-stretch">
    <!--左边-->
    <nav id="sidebar">
        <!-- 用户头像---姓名-->
        <div class="sidebar-header d-flex align-items-center">
            <div class="avatar">
                <img src="static/img/avatar-6.jpg" alt="..." class="img-fluid rounded-circle">
            </div>
            <div class="title">
                <h1 class="h5">严斌</h1>
                <p>1243163719@qq.com</p>
            </div>
        </div>

        <!-- 菜单页-->
        <span class="heading">控制栏</span>
        <ul class="list-unstyled">

            <li class="active"><%--class="active"--%>
                <a href="/resultIndex" ><i class="icon-home"></i>主页 </a>
            </li>

            <li>
                <a href ="javascript:; " onclick='loadPage("/tablesAll")'>
                <i class="icon-grid"></i>数据表格 </a>
            </li>

            <li>
              <a  href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse">
                <i class="icon-windows"></i>Example dropdown
              </a>
                <ul  id="exampledropdownDropdown" class="collapse list-unstyled ">
                    <li><a href="#">Page</a></li>
                    <li><a href="#">Page</a></li>
                    <li><a href="#">Page</a></li>
                </ul>
            </li>

            <li>
                <a href="login.jsp"><i class="icon-logout"></i>登录页 </a>
            </li>
        </ul>

<%--        <span class="heading">Extras</span>
        <ul class="list-unstyled">
            <li><a href="#"> <i class="icon-settings"></i>Demo </a></li>
            <li><a href="#"> <i class="icon-writing-whiteboard"></i>Demo </a></li>
            <li><a href="#"> <i class="icon-chart"></i>Demo </a></li>
        </ul>--%>
    </nav>


    <!-- 右边主体-->
    <div class="page-content">
<%--        <div class="page-header">
            <div class="container-fluid">
                <h2 class="h5 no-margin-bottom">仪表盘</h2>
            </div>
        </div>
        <section class="no-padding-top no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-user-1"></i></div><strong>新用户</strong>
                                </div>
                                <div class="number dashtext-1">27</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-contract"></i></div><strong>新项目</strong>
                                </div>
                                <div class="number dashtext-2">375</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-paper-and-pencil"></i></div><strong>新单据</strong>
                                </div>
                                <div class="number dashtext-3">140</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-writing-whiteboard"></i></div><strong>所有项目</strong>
                                </div>
                                <div class="number dashtext-4">41</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-4"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="bar-chart block no-margin-bottom">
                            <canvas id="barChartExample1"></canvas>
                        </div>
                        <div class="bar-chart block">
                            <canvas id="barChartExample2"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="line-cahrt block">
                            <canvas id="lineCahrt"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="stats-2-block block d-flex">
                            <div class="stats-2 d-flex">
                                <div class="stats-2-arrow low"><i class="fa fa-caret-down"></i></div>
                                <div class="stats-2-content"><strong class="d-block">5.657</strong><span class="d-block">Standard Scans</span>
                                    <div class="progress progress-template progress-small">
                                        <div role="progressbar" style="width: 60%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template progress-bar-small dashbg-2"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="stats-2 d-flex">
                                <div class="stats-2-arrow height"><i class="fa fa-caret-up"></i></div>
                                <div class="stats-2-content"><strong class="d-block">3.1459</strong><span class="d-block">Team Scans</span>
                                    <div class="progress progress-template progress-small">
                                        <div role="progressbar" style="width: 35%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template progress-bar-small dashbg-3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="stats-3-block block d-flex">
                            <div class="stats-3"><strong class="d-block">745</strong><span class="d-block">Total requests</span>
                                <div class="progress progress-template progress-small">
                                    <div role="progressbar" style="width: 35%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template progress-bar-small dashbg-1"></div>
                                </div>
                            </div>
                            <div class="stats-3 d-flex justify-content-between text-center">
                                <div class="item"><strong class="d-block strong-sm">4.124</strong><span class="d-block span-sm">Threats</span>
                                    <div class="line"></div><small>+246</small>
                                </div>
                                <div class="item"><strong class="d-block strong-sm">2.147</strong><span class="d-block span-sm">Neutral</span>
                                    <div class="line"></div><small>+416</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="drills-chart block">
                            <canvas id="lineChart1"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="user-block block text-center">
                            <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid">
                                <div class="order dashbg-2">1st</div>
                            </div><a href="#" class="user-title">
                            <h3 class="h5">Richard Nevoreski</h3><span>@richardnevo</span></a>
                            <div class="contributions">950 Contributions</div>
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>150</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>340</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>460</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="user-block block text-center">
                            <div class="avatar"><img src="img/avatar-4.jpg" alt="..." class="img-fluid">
                                <div class="order dashbg-1">2nd</div>
                            </div><a href="#" class="user-title">
                            <h3 class="h5">Samuel Watson</h3><span>@samwatson</span></a>
                            <div class="contributions">772 Contributions</div>
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>80</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>420</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>272</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="user-block block text-center">
                            <div class="avatar"><img src="img/avatar-6.jpg" alt="..." class="img-fluid">
                                <div class="order dashbg-4">3rd</div>
                            </div><a href="#" class="user-title">
                            <h3 class="h5">Sebastian Wood</h3><span>@sebastian</span></a>
                            <div class="contributions">620 Contributions</div>
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>150</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>280</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>190</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">
                        <div class="col-lg-4 d-flex align-items-center">
                            <div class="order">4th</div>
                            <div class="avatar"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block">Tomas Hecktor</strong><span class="d-block">@tomhecktor</span></a>
                        </div>
                        <div class="col-lg-4 text-center">
                            <div class="contributions">410 Contributions</div>
                        </div>
                        <div class="col-lg-4">
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>110</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>200</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>100</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">
                        <div class="col-lg-4 d-flex align-items-center">
                            <div class="order">5th</div>
                            <div class="avatar"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block">Alexander Shelby</strong><span class="d-block">@alexshelby</span></a>
                        </div>
                        <div class="col-lg-4 text-center">
                            <div class="contributions">320 Contributions</div>
                        </div>
                        <div class="col-lg-4">
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>150</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>120</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>50</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">
                        <div class="col-lg-4 d-flex align-items-center">
                            <div class="order">6th</div>
                            <div class="avatar"> <img src="img/avatar-6.jpg" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block">Arther Kooper</strong><span class="d-block">@artherkooper</span></a>
                        </div>
                        <div class="col-lg-4 text-center">
                            <div class="contributions">170 Contributions</div>
                        </div>
                        <div class="col-lg-4">
                            <div class="details d-flex">
                                <div class="item"><i class="icon-info"></i><strong>60</strong></div>
                                <div class="item"><i class="fa fa-gg"></i><strong>70</strong></div>
                                <div class="item"><i class="icon-flow-branch"></i><strong>40</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="margin-bottom-sm">
            <div class="container-fluid">
                <div class="row d-flex align-items-stretch">
                    <div class="col-lg-4">
                        <div class="stats-with-chart-1 block">
                            <div class="title"> <strong class="d-block">Sales Difference</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="row d-flex align-items-end justify-content-between">
                                <div class="col-5">
                                    <div class="text"><strong class="d-block dashtext-3">$740</strong><span class="d-block">May 2017</span><small class="d-block">320 Sales</small></div>
                                </div>
                                <div class="col-7">
                                    <div class="bar-chart chart">
                                        <canvas id="salesBarChart1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="stats-with-chart-1 block">
                            <div class="title"> <strong class="d-block">Visit Statistics</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="row d-flex align-items-end justify-content-between">
                                <div class="col-4">
                                    <div class="text"><strong class="d-block dashtext-1">$457</strong><span class="d-block">May 2017</span><small class="d-block">210 Sales</small></div>
                                </div>
                                <div class="col-8">
                                    <div class="bar-chart chart">
                                        <canvas id="visitPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="stats-with-chart-1 block">
                            <div class="title"> <strong class="d-block">Sales Activities</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="row d-flex align-items-end justify-content-between">
                                <div class="col-5">
                                    <div class="text"><strong class="d-block dashtext-2">80%</strong><span class="d-block">May 2017</span><small class="d-block">+35 Sales</small></div>
                                </div>
                                <div class="col-7">
                                    <div class="bar-chart chart">
                                        <canvas id="salesBarChart2"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="checklist-block block">
                            <div class="title"><strong>To Do List</strong></div>
                            <div class="checklist">
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-1" name="input-1" class="checkbox-template">
                                    <label for="input-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-2" name="input-2" checked class="checkbox-template">
                                    <label for="input-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-3" name="input-3" class="checkbox-template">
                                    <label for="input-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-4" name="input-4" class="checkbox-template">
                                    <label for="input-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-5" name="input-5" class="checkbox-template">
                                    <label for="input-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                                <div class="item d-flex align-items-center">
                                    <input type="checkbox" id="input-6" name="input-6" class="checkbox-template">
                                    <label for="input-6">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="messages-block block">
                            <div class="title"><strong>New Messages</strong></div>
                            <div class="messages"><a href="#" class="message d-flex align-items-center">
                                <div class="profile"><img src="img/avatar-3.jpg" alt="..." class="img-fluid">
                                    <div class="status online"></div>
                                </div>
                                <div class="content">   <strong class="d-block">Nadia Halsey</strong><span class="d-block">lorem ipsum dolor sit amit</span><small class="date d-block">9:30am</small></div></a><a href="#" class="message d-flex align-items-center">
                                <div class="profile"><img src="img/avatar-2.jpg" alt="..." class="img-fluid">
                                    <div class="status away"></div>
                                </div>
                                <div class="content">   <strong class="d-block">Peter Ramsy</strong><span class="d-block">lorem ipsum dolor sit amit</span><small class="date d-block">7:40am</small></div></a><a href="#" class="message d-flex align-items-center">
                                <div class="profile"><img src="img/avatar-1.jpg" alt="..." class="img-fluid">
                                    <div class="status busy"></div>
                                </div>
                                <div class="content">   <strong class="d-block">Sam Kaheil</strong><span class="d-block">lorem ipsum dolor sit amit</span><small class="date d-block">6:55am</small></div></a><a href="#" class="message d-flex align-items-center">
                                <div class="profile"><img src="img/avatar-5.jpg" alt="..." class="img-fluid">
                                    <div class="status offline"></div>
                                </div>
                                <div class="content">   <strong class="d-block">Sara Wood</strong><span class="d-block">lorem ipsum dolor sit amit</span><small class="date d-block">10:30pm</small></div></a><a href="#" class="message d-flex align-items-center">
                                <div class="profile"><img src="img/avatar-1.jpg" alt="..." class="img-fluid">
                                    <div class="status online"></div>
                                </div>
                                <div class="content">   <strong class="d-block">Nader Magdy</strong><span class="d-block">lorem ipsum dolor sit amit</span><small class="date d-block">9:47pm</small></div></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="stats-with-chart-2 block">
                            <div class="title"><strong class="d-block">Credit Sales</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="piechart chart">
                                <canvas id="pieChartHome1"></canvas>
                                <div class="text"><strong class="d-block">$2.145</strong><span class="d-block">Sales</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="stats-with-chart-2 block">
                            <div class="title"><strong class="d-block">Channel Sales</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="piechart chart">
                                <canvas id="pieChartHome2"></canvas>
                                <div class="text"><strong class="d-block">$7.784</strong><span class="d-block">Sales</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="stats-with-chart-2 block">
                            <div class="title"><strong class="d-block">Direct Sales</strong><span class="d-block">Lorem ipsum dolor sit</span></div>
                            <div class="piechart chart">
                                <canvas id="pieChartHome3"></canvas>
                                <div class="text"><strong class="d-block">$4.957</strong><span class="d-block">Sales</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
    <%--尾部--%>
    <footer class="footer">
        <div class="footer__block block no-margin-bottom">
            <div class="container-fluid text-center">
                <p class="no-margin-bottom">Copyright &copy; 2019.Company name All rights reserved.<a
                        target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            </div>
        </div>
    </footer>
    </div>
</div>


<script>
/*    $(function(){
        $("[name=one]").click(function(){
         /!*alert(this.id);*!/
            //this可以获取当前点击按钮的id
            if(this.className.indexOf('active')==-1){
                this.className="active";
                this.style="color: #DB6574;"
            }else{
                /!*this.className="active";*!/
                this.style="color: #000000;"
            }
        })
/!*        $("[name=one]").blur(function(){
            this.className="btn-my btn";
            this.style="color: #000000;";
        })*!/

    });*/
    function loadPage(url) {
        $.ajax({
            type: "POST",
            url: url,
            async: true,
            dataType: "html",
            contentType: 'application/json; charset=utf-8',
            success: function (html) {
                $('.page-content').html(html);
            }
        });
    }
</script>

</body>
</html>