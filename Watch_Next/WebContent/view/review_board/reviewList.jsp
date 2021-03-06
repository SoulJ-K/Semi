<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, review.model.vo.*"  %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String sk = null;
	String sv = null;
	String sk2 = null;
	if(request.getAttribute("sk2") != null && request.getAttribute("sv") != null && request.getAttribute("sk") != null){
		sk = (String)request.getAttribute("sk");
		sv = (String)request.getAttribute("sv");
		sk2 = (String)request.getAttribute("sk2");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<%@ include file="/view/layout/import.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link type="text/css" href="/Watch_Next/Resources/css/review_list.css" rel="stylesheet" >
<style>
	.subnav li {width: 120px;}
	.popimg{width:30px; height:30px;}
	
	/*사이드바 */
#sidebar{
	position: fixed;
	width: 100px;
	height: 700px;
	left: 94%;
	top: 15%;
}
#sidebar a{
	color: #545357;
}
#mlink{
	border: 1px solid;
 	width: 80px; 
	height: 80px;
	margin-bottom: 4px;
}
#topbtn{
	text-align: center;
	font-weight: bold;
	background-color: yellow;
}

#footer{margin-top: -1.4%;}
</style>
</head>
<body>
<%@ include file="/view/layout/Header.jsp" %>
<br clear="all">

<div id="sidebar">
	<table>
		<tr>
			<td><a href="https://play.watcha.net/" target="_blank"><img src="Resources/images/왓챠.png" id="mlink" class="mwha"></a></td>
		</tr>
		<tr>
			<td><a href="https://www.netflix.com/kr/" target="_blank"><img src="Resources/images/넷플릭스.png" id="mlink" class="mnet"></a></td>
		</tr>
		<tr>
			<td><a href="https://movie.naver.com/" target="_blank"><img src="Resources/images/네이버 영화.png" id="mlink" class="mnav"></a></td>
		</tr>
		<tr>
			<td><a href="#" target="_self"><img src="Resources/images/top.png" id="mlink" ></a></td>
		</tr>
	
	</table>
</div>


<section>

	<!-- 리뷰 게시판 목록 -->
<br clear="all">

<div id="reviewList">
	<h2 style="margin-top: 10%; margin-bottom: 2%;"><strong>리뷰 게시판</strong></h2>
	<hr class="hline">
	
	
	<table id="rvtable" >
	<tr>
		<th id="num">번호</th>
		<th id="rlcategory">말머리</th>
		<th id="title">리뷰 제목</th>
		<th id="popcorn">팝콘 점수</th>
		<th id="date">날짜</th>
		<th id="writer">글쓴이</th>
		<th id="hits">조회</th>
	</tr>
	<% if(list.isEmpty()){ %>
	<tr>
		<td colspan="7" style="height: 330px; font-size: 30px" >조회된 리스트가 없습니다.</td>
	</tr>
	<% } else{ 
		for(Review r : list){ 
	%>
	<tr>
		<td><%= r.getbNo() %></td>
		<td>
		<%if( r.getSpo().trim().equals("Y")) { %>
			스포있음
		<%} else { %>
			스포없음
		<% } %>	
		
		</td>
		<td align="left">[ <%= r.getmTitle() %> ] <%= r.getbTitle() %></td>
		<td align="middle">
			<% if(r.getPopcorn() ==1) { %>
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
			<%} else if(r.getPopcorn() ==2) { %>
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
			<%} else if(r.getPopcorn() ==3) { %>
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
			<%} else if(r.getPopcorn() ==4) { %>
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
			<%} else if(r.getPopcorn() ==5) { %>
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
				<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
			<%} %>
			
		
		</td>
		<td><%= r.getbDate() %></td>
		<td><%= r.getbWriter() %></td>
		<td><%= r.getbCount() %></td>
	</tr>
			<% }
		      }%>
		

	</table>
	
</div>

<!-- 페이징 -->
	<div class="pagingArea" align="center">
	<!-- 맨 처음으로 -->
		<%if(request.getAttribute("sk2") != null && request.getAttribute("sv") != null && request.getAttribute("sk") != null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=1&sk=<%=sk%>&sv=<%=sv%>&sk2=<%=sk2%>'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= currentPage - 1 %>&sk=<%=sk%>&sv=<%=sv%>&sk2=<%=sk2%>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			
			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else { %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= p %>&sk=<%=sk%>&sv=<%=sv%>&sk2=<%=sk2%>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= currentPage + 1 %>&sk=<%=sk%>&sv=<%=sv%>&sk2=<%=sk2%>'">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', 'true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= maxPage %>&sk=<%=sk%>&sv=<%=sv%>&sk2=<%=sk2%>'">&gt;&gt;</button>
		<% }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			
			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else { %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= currentPage + 1 %>'">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', 'true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.rv?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		<% } %>
	</div>



<!-- 글쓰기 -->
<% if(loginUser != null){ %>
	<input id="write" type="button" value="글쓰기"
		   onclick="location.href='<%= request.getContextPath() %>/view/review_board/reviewWrite.jsp'">
<% } %>

<!-- 검색 -->
<br clear="left">

<div id="searchDiv">
<form id="searchForm" action="<%=request.getContextPath() %>/list.rv" method="get">
	<select id="searchType" name="sk">
		<option ${(param.sk=="전체")?"selected":""} value="전체">전체</option>
		<option ${(param.sk=="영화제목")?"selected":""} value="영화제목">영화제목</option>
		<option ${(param.sk=="리뷰제목")?"selected":""} value="리뷰제목">리뷰제목</option>
		<option ${(param.sk=="작성자")?"selected":""} value="작성자">작성자</option>
		<option ${(param.sk=="내용")?"selected":""} value="내용">내용</option>
	</select>
	<select id="selectSpo" name="sk2">
		<option ${(param.sk2=="스포선택")?"selected":""} value="스포선택">스포선택</option>
		<option ${(param.sk2=="Y")?"selected":""} value="Y">스포있음</option>
		<option ${(param.sk2=="N")?"selected":""} value="N">스포없음</option>	
	</select>&nbsp;&nbsp;

	<input id="blank" name="sv" type="text" size="35" id="searchText" value="${param.sv}">&nbsp;
	<input id="botSearch" type="submit" value="검색"/>
</form>
</div>

</section>

<script>
	
	$(function(){
		$('#reviewList td').mouseenter(function(){
			$(this).parent().css('cursor', 'pointer');
		}).click(function(){
			var rv = $(this).parent().children().eq(0).text();
			
			if('<%= loginUser %>' != 'null' && rv != '조회된 리스트가 없습니다.'){
				location.href="<%= request.getContextPath() %>/detail.rv?rv="+rv;
			} else if('<%= loginUser %>' != 'null' && rv == '조회된 리스트가 없습니다.'){
				alert('리스트가 없습니다!');
			} else{
				alert('로그인 해주세요^^');
			}
			
		});
	});
	
	
	
</script>



<%@ include file="/view/layout/footer.jsp" %>
<script src="<%=request.getContextPath() %>/Resources/js/Header.js"></script>
</body>
</html>