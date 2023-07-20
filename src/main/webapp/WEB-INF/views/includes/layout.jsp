<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/includes/css/style.css">
</head>

<body style="overflow-x: hidden;">
   <div class="wrapper d-flex align-items-stretch">
      <section id="aside">
         <tiles:insertAttribute name="aside" />
      </section>

      <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">
         <header id="header">
            <tiles:insertAttribute name="header" />
         </header>
         <div id="main_content">
            <section id="body">
               <tiles:insertAttribute name="body" />
            </section>
         </div>
      </div>


   </div>
</body>
</html>