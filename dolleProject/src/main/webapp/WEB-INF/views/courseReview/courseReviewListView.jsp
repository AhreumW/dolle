<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스 후기 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">

	.fixedBox{
		width:306px; height:114px; background-color: #E1E1E1;
	}
	
	.innerBox{
		width:306px; height:114px; 
	}
	
	.innerBoxBG{
		background-color:#000; opacity:0.3;
 	}  
/* 	.innerTxtBoxBG{ */
/* 		color:#fff; opacity: 1; */
/* 	} */

/* 	.photoBox{ */
/* 		width:306px; height:342px; position: absolute; background-color: lightgray; */
/* 	} */
	
/* 	.reviewPhoto{ */
/* 		position: relative; height:100%; width:100%; */
/* 	} */
	
/* 	.innerTitle{ */
/* 	font: normal bold 22px Segoe UI; margin: 18px 20px 0px; display: block; */
/* 	} */
	
/* 	.innerWriter{ */
/* 	font: normal normal 14px Segoe UI; margin: 8px 20px; display: block; */
/* 	} */
	
/* 	.innerRating{ */
/* 	margin: 0px 20px; display: inline-block; width: 110px; vertical-align: middle; */
/* 	} */
	
/* 	.innerLike{ */
/* 	width:50px; display: inline-block; margin-left: 20px; */
/* 	} */
	
/* 	.innerComment{ */
/* 	width:50px; display: inline-block; margin-left: 10px; */
/* 	} */
	
	/*  0 318 636 954 */
	.firstCol{position: absolute;  left: 0px;}
	.secondCol{position: absolute;	left: 318px;}
	.thirdCol{position: absolute; left: 636px;}
	.forthCol{position: absolute; left: 954px;}
	
	/* 126&354 0&228 */
	.firstRow{top: 0px;}
	.secondRow{top: 318px;}
	.thirdRow{top: 636px;}
	.forthRow{top: 954px;}
	.fifthRow{top: 1272px;}
	
	
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	function pageMoveFnc(){
		var loginUser = $("#reviewMemberIdx").val();
		if(loginUser == null || loginUser.trim() == "" || loginUser.length == 0){
			alert("로그인 후 작성해주세요.");
			location.href="../auth/login.do"
		}else{
			location.href="./add.do";
		}
	}
	
	function detailPageFnc(reviewIdx){
// 		alert(reviewIdx);
		location.href="./detail.do?reviewIdx="+reviewIdx;
	}
	
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/AdminHeader.jsp" />

	<div style="width:1260px; height:130px; margin:0 auto;">
		<h1 style="font-size:30px; font-family: 대한민국정부상징체 ; margin: 55px 0px 20px 82px;">코스 후기 게시판</h1>
		<div style="width:200px; border-bottom: 4px solid #FFCC00; text-align: center; 
		margin-left:300px; padding-bottom:4px; display: inline-block;">
			<span style="font: normal bold 22px Segoe UI">혜화 명륜 마을</span>
		</div>
		<!-- 정렬선택과 검색창 -->
		<div style="float:right; height:50px; width:530px; padding-top:40px;">

				<select style="width:120px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
					<option>최신순</option>
				</select>
				<select style="width:140px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
					<option>제목+내용</option>
				</select>

			<div style="width:250px; height:31px; display:inline-block; border: 1px solid #B9B9B9; vertical-align: middle;">
				<input type="text" value="" style="width:190px; height:22px; vertical-align: middle;
						font: normal normal 14px Segoe UI; margin-left:10px; padding: 2px 0px 1px 10px;
						border: 0px;">
				<img id="searchBtn" alt="검색버튼" src="/dolleProject/resources/images/searchBtn.PNG" style="margin-top:2px; vertical-align: middle;"> 
			</div>
			
		</div>
	</div>
	
	
	<c:if test="${listSize / 4 <= 1}">
		<c:set var="listHeight" value="514"/>
	</c:if>
	<c:if test="${listSize / 4 <= 2 and listSize / 4 > 1}">
		<c:set var="listHeight" value="868"/>
	</c:if>
	<c:if test="${listSize / 4 <= 3 and listSize / 4 > 2}">
		<c:set var="listHeight" value="1222"/>
	</c:if>
	<c:if test="${listSize / 4 <= 4 and listSize / 4 > 3}">
		<c:set var="listHeight" value="1576"/>
	</c:if>
	<c:if test="${listSize / 4 <= 5 and listSize / 4 > 4}">
		<c:set var="listHeight" value="1930"/>
	</c:if>
	<div style="width:1260px; height:${listHeight}px; margin:0 auto;">
	
		<ul id="reviewList" style="position: relative;">
			<!-- 고정 박스  -->
			<li class="reviewList_li">
				<div class="fixedBox firstCol firstRow"> 
				</div>	
				<span class="innerBox firstCol firstRow">	
				</span>
			</li>
			<c:if test="${listSize > 2}">
				<li class="reviewList_li">
					<div class="fixedBox thirdCol firstRow">
					</div>
					<span class="innerBox thirdCol firstRow">
					</span>
				</li>
			</c:if>
			
			
			<c:forEach var="reviewVo" items="${reviewList}" varStatus="listIndex">
			<!-- 상세 게시글  -->
			<!-- 행렬 개수 -->
					
					<c:if test="${listIndex.count >= 1 and listIndex.count <= 4}">
						<c:set var="rowNum" value="1"/>
					</c:if>
					<c:if test="${listIndex.count >= 5 and listIndex.count <= 8}">
						<c:set var="rowNum" value="2"/>
					</c:if>
					<c:if test="${listIndex.count >= 9 and listIndex.count <= 12}">
						<c:set var="rowNum" value="3"/>
					</c:if>
					<c:if test="${listIndex.count >= 13 and listIndex.count <= 16}">
						<c:set var="rowNum" value="4"/>
					</c:if>
					
					<c:if test="${listIndex.count % 4 == 1}">
						<c:set var="leftPosition" value="0"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354) + 126}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 354}"/>
					</c:if> 
					<c:if test="${listIndex.count % 4 == 2}"> 
						<c:set var="leftPosition" value="318"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354)}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 228}"/>
					</c:if>
					<c:if test="${listIndex.count % 4 == 3}">
						<c:set var="leftPosition" value="636"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354) + 126}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 354}"/>
					</c:if>
					<c:if test="${listIndex.count % 4 == 0}">
						<c:set var="leftPosition" value="954"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354)}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 228}"/>
					</c:if> 
					
					
					<li class="reviewList_li" onclick="detailPageFnc(${reviewVo.reviewIdx});">
						<div class="photo_Box"
							style="width:306px; height:342px; position: absolute; top:${TopPosition1}px; left:${leftPosition}px;
							background-color: lightgray;">
							<img alt="review_photo" src="<c:url value='/img/${reviewVo.fileStoredName}'/>" style="position: relative; height:100%; width:100%;">
						</div>
						<span class="innerBox" style="width:306px; height:114px; position: absolute; top:${TopPosition2}px; left:${leftPosition}px; 
							background-color: #000; opacity: 0.3;">			
						</span>
						<span class="innerBox_txt" style="width:306px; height:114px; position: absolute; top:${TopPosition2}px; left:${leftPosition}px; 
							color:#fff; opacity: 1;">
							<span style="font: normal bold 22px Segoe UI; margin: 18px 20px 0px; display: block;">
								${reviewVo.reviewTitle}
							</span>
							<span style="font: normal normal 14px Segoe UI; margin: 8px 20px; display: block;">
								${reviewVo.memberNickname}
							</span>
							<span style="margin: 0px 20px; display: inline-block; width: 120px; vertical-align: middle;">
								<c:forEach var="starNum" begin="1" end="${reviewVo.reviewRating}" step="1">
									<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
										style="width:16px; height:16px; vertical-align: middle;">
								</c:forEach>
								<c:if test="${reviewVo.reviewRating != 5}">
									<c:forEach var="starNum" begin="1" end="${5 - reviewVo.reviewRating}" step="1">
										<img alt="별_blank" src="/dolleProject/resources/images/starBlank.png" 
											style="width:18px; height:16.5px; vertical-align: middle;">
									</c:forEach>
								</c:if>
							</span>
							<span style="width:50px; display: inline-block; margin-left: 20px;">
								<img alt="Icon_heart" src="/dolleProject/resources/images/IconHeart.png"
									style="width: 16px; vertical-align: middle;">
								<span style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewVo.reviewLikeCount}</span>		
							</span>		
							<span style="width:50px; display: inline-block; margin-left: 10px;">
								<img alt="Icon_comment" src="/dolleProject/resources/images/IconComment.png"
									style="width: 16px; vertical-align: middle;">
								<span style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewVo.commentCount}</span>	
							</span>
						</span>
					</li>
				
			
<%-- 				</c:forEach> --%>
<%-- 			</c:forEach> --%>
			</c:forEach>
		</ul>
		
	</div>
	
	<!-- 페이징 버튼 -->
	<div style="width:1260px; height:205px; margin:0 auto; text-align: center; 
		padding-top: 30px; box-sizing: border-box;">
		<ul id="paging_group" style="width: 600px; display: inline-block; margin-left: 165px;">
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
					style="width: 55%;">
			</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" 
					style="width: 40%;">
			</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">1</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">2</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">3</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">4</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">5</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" 
					style="width: 42%;">
			</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" 
					style="width: 55%;">
			</li>
		</ul>
		<input id="reviewMemberIdx" type="hidden" value="${_memberVo_.no}">
		<button onclick="pageMoveFnc();"
			style="width:200px; height:45px; font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; float:right; border:0px; margin-right: 20px;">
			글쓰기
		</button>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>