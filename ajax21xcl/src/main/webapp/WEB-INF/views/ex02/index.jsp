<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>第二個練習</title>
<script>
	var dataArea = null;
	window.onload = function() {
		var btn21 = document.getElementById("btn21");
		var btn22 = document.getElementById("btn22");
		var btn23 = document.getElementById("btn23");
		dataArea = document.getElementById("dataArea");
		var key = 2;
		
		btn23.onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					showReq03Result(xhr.responseText);
				}
			}
			xhr.open('GET', "<c:url value = '/ex02req03' />", true);
			xhr.send();
		}
		
		btn22.onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					showReq02Result(xhr.responseText);
				}
			}
			xhr.open('GET', "<c:url value = '/ex02req02' />" + "/" + key, true);
			xhr.send();
		}
		
		btn21.onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					showReq01Result(xhr.responseText);
				}
			}
			xhr.open('GET', "<c:url value = '/ex02req01' />", true);
			xhr.send();
		}
		
	}
	
	function showReq01Result(result){
		dataArea.innerHTML = "<font color='red' >" + result + "</font>";
	}
	
	function showReq02Result(employee){
		var empObj = JSON.parse(employee);
		var response = "<table border='1'>" ;
		response += "<th colspan='2'>員工基本資料</th>"; 
		response += "<tr><td>員工編號</td><td>" +  empObj.id  + "</td></tr>"; 
		response += "<tr><td>員工姓名</td><td>" +  empObj.name  + "</td></tr>"; 
		response += "</table>";
		dataArea.innerHTML = response;
	}
	
	function showReq03Result(employees){
		alert(employees);
		var empObj = JSON.parse(employees);
		var response = "<talbe border='1'>";
		
		dataArea.innerHTML = response;
	}
	
</script>
</head>
<body>
	<div align='center'>
		<h3>開心做練習二</h3>
		<hr>
		<button id='btn21'>傳回單一字串: 現在本地時間</button>
		<button id='btn22'>傳回單一物件: Employee</button>
		<button id='btn23'>傳回多個物件: List<Empolyee></button>
		<!--    <button id='btn23'>回應為多個物件</button> -->
		<hr>
		<div id='dataArea'>&nbsp;</div>
		<hr>
		<a href="/">回前頁-A NG</a> <a href="<c:url value='/'  />">回前頁-B</a>
	</div>
</body>
</html>