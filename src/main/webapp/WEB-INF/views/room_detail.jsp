<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Azanda.</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="css/room_detail.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style type="text/css">
.pt {
	margin-top: -9px;
}
.mySlides {display:none;} 

.button {
	border: solid 0.5px;
	background: white;
	opacity: 1;
	border-radius: 8px;
}

.sticky {
	border: ridge 1px #000000;
	-moz-border-radius: 13px;
	-webkit-border-radius: 13px;
	border-radius: 13px;
	display: inline-block;
	position: sticky;
	top: 30px;
	width: 300px;
}

.money{
	border: 0px; 
	outline: none;
	font-weight: 600 !important;
	font-size: 22px !important;
    line-height: 26px !important;
}

._plc5prx{
	-webkit-box-flex: 1 !important;
    flex-shrink: 1 !important;
    flex-grow: 1 !important;
    white-space: normal !important;
    font-weight: 800 !important;
}

._1d3ext9m {
    padding-left: 16px !important;
    white-space: nowrap !important;
    font-weight: 800 !important;
}

#myModalP {
	dialoWidth: 600px;
}

#kkomap {
	width: 100%;
	height: 300px;
	border-radius: 10px;
}

.grid-container {
  display: grid;
  grid-gap: 5px;
  padding: 10px;
}

.grid-item {
  text-align: center;
  padding: 20px;
  border-radius : 3px;
}

.item1 {
  grid-column: 1 /span 2;;
  grid-row: 1 / span 2;
}

.item2 {
  grid-column: 3;
  grid-row: 1 ;
}
.item3{
	grid-column: 4;
    grid-row:1 ;
}

</style>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript">
function myFunction(x){
	$(".selector").flatpickr({
		  enableTime: true,
		  dateFormat: "Y-m-d H:i",
		});
}

</script>


</head>
<body>

	<!--================ Header =================-->
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<div class="hero-wrap"
		style="background-image: url('images/bg_5.jpg'); height: 100px;">
	</div>
	<!--================ End Header =================-->

	<input type="hidden" value="${roomInfo.room.addr}" id="addr">
	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<!--================ 숙소 정보 =================-->
			<div class="col-lg-12">
				<h2><b>${roomInfo.room.room_name}</b></h2>
				<c:set var="addrbefore" value="${roomInfo.room.addr}" />
				<c:set var="addrsi" value="${fn:split(addrbefore,' ')[0]}"></c:set>
				<c:set var="addrgu" value="${fn:split(addrbefore,' ')[1]}"></c:set>
				<p>
					${addrgu}, ${addrsi}
				</p>
			</div>
			<div class="col-md-12"><!-- 숙소 사진 -->
			<div class="w3-display-container">
				<div class="grid-container">
					<div class="grid-item item1">사진1</div>
					<div class="grid-item item2">사진2</div>
					<div class="grid-item item3">사진3</div>
					<div class="grid-item item4">사진4</div>
					<div class="grid-item item5">사진5</div>
				</div>
				<div class="w3-display-bottomright w3-container">
					<input class="button" type="button" value="전체사진보기" onclick="document.getElementById('id01').style.display='block'"/>
				</div>
				
					
				</div>
			</div><!-- 숙소사진끝 -->
			<div class="row">
				<div class="col-lg-8">

					<!-- 숙소 이름 -->
					<section class="col-md-12 hotel-single mb-4 mt-4">
						<div>
							
							<h2><b>${hostInfo.name}님이 호스팅하는 ${roomInfo.room.r_type}전체</b></h2>
							<div>
								<span>최대 인원 ${roomInfo.room.person}명</span> 
								<span aria-hidden="true"> · </span> 
								<span>침실 ${roomInfo.room.bed_room}개</span>
								<span aria-hidden="true"> · </span> 
								<span>침대 ${roomInfo.room.bed}개</span> 
								<span aria-hidden="true"> · </span> 
								<span>욕실 ${roomInfo.room.bath_room}개</span>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-1 mt-2 pl-3">
								<i class="fa fa-home" style="font-size: 30px;"></i>
							</div>
							<div class="col-md-11 mt-2">
								<h5>${roomInfo.room.r_type} 전체</h5>
								<p class="pt">${roomInfo.room.r_type}전체를 단독으로 사용하시게 됩니다.</p>
							</div>

							<div class="col-md-1 mt-2 pl-3">
								<i class="fa fa-door-open" style="font-size: 25px;"></i>
							</div>
							<div class="col-md-11 mt-2">
								<h5>체크인</h5>
								<p class="pt">${roomInfo.room.checkin}을(를) 이용해 체크인 하세요</p>
							</div>

							<div class="col-md-1 mt-2 pl-3">
								<i class="fa fa-calendar" style="font-size: 28px;"></i>
							</div>
							<div class="col-md-11 mt-2">
								<h5>환불 정책</h5>
								<p class="pt">체크인 30일 전까지 취소하시면 전액이 환불됩니다.</p>
							</div>
						</div>
					</section>

					<hr>
					<!-- 집정보 -->
					<section class="col-md-12 hotel-single mb-4 mt-4">
						<div>
							<pre>${roomInfo.intro.context}</pre>
						</div>
					</section>
					<hr>

					<!-- 편의시설 -->
					<section class="col-md-12 hotel-single mb-4 mt-4">
						<h2>편의시설</h2>


						<button type="button" class="button" data-toggle="modal" data-target="#myModalP">편의시설 모두 보기</button>
						<!-- Modal -->
						<div class="modal fade" id="myModalP" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h2>편의시설</h2>
										<button type="button" class="close" data-dismiss="modal">×</button>
									</div>
									<div class="modal-body">
										<p>Some text in the modal.</p>
									</div>

								</div>

							</div>
						</div>

					</section>
				</div>
				<section class="col-lg-4 sidebar mt-5">
					<div class="sticky">
						<div class="col-lg-12 mt-4 mb-4">
							<form action="pay.do">
							<div>
								<input type="text" class="money" name="perPrice" readonly="readonly" value="&#8361; ${roomInfo.room.price}"><small>/박</small>
							</div>
								<div class="_poaz3m" style="border-radius: 8px;"><!-- 체크인 및 인원선택박스 -->
									<div class="_jro6t0">
										<div class="_zdxht7">
											<div class="_e296pg" style="flex: 1 1 0%;">
												<div class="_sbmagf"
													style="background: none; border-radius: 8px 8px 0px 0px; top: 0px; left: 0px; right: 0px; bottom: -1px;"></div>
												<div class="_11wiged"
													aria-label="날짜 변경하기; 체크인: undefined; 체크아웃: undefined"
													aria-invalid="false" role="button" tabindex="0">
													<div class="_1acx77b">
														<div class="_7eq2v2">체크인</div>
														<div class="_1ygdnkvm">날짜 추가</div>
													</div>
													<div class="_14tl4ml5">
														<div class="_7eq2v2">체크아웃</div>
														<div class="_1ygdnkvm">날짜 추가</div>
													</div>
												</div>
												<div class="_t26glb"
													style="top: 0px; left: 0px; right: 0px; bottom: -1px; border-radius: 8px 8px 0px 0px; border-color: rgb(176, 176, 176); border-width: 1px; z-index: 0;"></div>
											</div>
										</div>
									</div>
									<div class="_jro6t0">
										<div class="_bp34sw">
											<div class="_e296pg" style="flex: 1 1 0%;">
												<div class="_sbmagf" style="background: none; border-radius: 0px 0px 8px 8px; top: 0px; left: 0px; right: 0px; bottom: -1px;"></div>
												<div class="_11wiged" aria-expanded="false" aria-haspopup="true"
													aria-labelledby="guests-label GuestPicker-book_it-trigger"
													aria-disabled="false" role="button" tabindex="0">
													<label for="GuestPicker-book_it-trigger" class="_1x080uh">
													<div class="_7eq2v2">인원</div>
													<div class="_1wo1vgi" id="GuestPicker-book_it-trigger" aria-invalid="false" aria-disabled="false">
															<div class="_1ir6ymk">
																<span>게스트 1명</span>
															</div>
														</div></label>
													<div class="_vgx32s">
														<svg viewBox="0 0 18 18" role="presentation"
															aria-hidden="true" focusable="false"
															style="height: 16px; width: 16px; display: block; fill: currentcolor;">
															<path
																d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z"
																fill-rule="evenodd"></path></svg>
													</div>
												</div>
												<div class="_t26glb"
													style="top: 0px; left: 0px; right: 0px; bottom: -1px; border-radius: 0px 0px 8px 8px; border-color: rgb(176, 176, 176); border-width: 1px; z-index: 0;"></div>
											</div>
											<div></div>
										</div>
									</div>
								</div><!-- 체크인 및 인원선택박스 -->
								<div class="col-lg-12 mt-2">
									<input type="submit" value="예약하기" class="btn btn-primary py-2" style="border-radius: 3px; width: 100%;">
								</div>

								<hr>
								<div>
									<span class="_plc5prx">총 합계</span>
									<span><input class="money _1d3ext9m" type="text" name="totalPrice" value="&#8361; " readonly="readonly"></span>
								</div>
							</form>

						</div>
					</div>

				</section>

			</div>
			<hr>
			<div class="row">
				<section class="col-lg-12" style="position: relative;">
					<!-- 위치 -->
					<h2 class="pl-3">위치</h2>

					<div id="kkomap" style="width: 100%; height: 500px;"></div>
					<c:set var="addrbefore" value="${roomInfo.room.addr}" />
					<c:set var="addrsi" value="${fn:split(addrbefore,' ')[0]}"></c:set>
					<c:set var="addrgu" value="${fn:split(addrbefore,' ')[1]}"></c:set>
					<p class="mt-4">
						<b>${addrgu}, ${addrsi}</b>
					</p>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37eab138db2d17be2dbaeea4157c0d35&libraries=services"></script>
					<!-- services,cluster,drawing 라이브러리 불러오기 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
					<script type="text/javascript">
						var address = document.getElementById('addr').value;
						
						var mapContainer = document.getElementById('kkomap'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							level : 3// 지도의 확대 레벨
						};
					
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						var imageSrc = 'images/icons/map_house.ico', // 마커이미지의 주소입니다    
						imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
						imageOption = {
							offset : new kakao.maps.Point(27, 69)
						}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc,
								imageSize, imageOption), markerPosition = new kakao.maps.LatLng(
								37.54699, 127.09598); // 마커가 표시될 위치입니다
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(address, function(
								result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									image : markerImage

								});
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}

						});
					</script>
					<hr>
					<!--  -->

				</section>
			</div>
			<!--================ 숙소 정보 끝 =================-->
		</div>
	</section>

	<!--================ Footer =================-->
	<div>
		<jsp:include page="footer.jsp" />
	</div>
	<!--================ End Footer =================-->
</body>
</html>