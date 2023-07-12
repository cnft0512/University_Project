<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/includes/css/style.css">
		
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
	<!--  
            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
		-->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto"">
              	 <li>
                    <a class="nav-link" href="/student/info">${mVo.name}님</a>
                </li>
                <li>
                    <a class="nav-link" href="#">대학 홈페이지</a>
                </li>
                <li>
                    <a class="nav-link" href="#">식단표</a>
                </li>
                <li>
                    <a class="nav-link" href="/logout">로그아웃</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
</body>
</html>