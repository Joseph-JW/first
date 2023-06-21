<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>도서관안내</title>

<link rel="stylesheet" href="../resources/board/guide.css">



<script type="text/javascript">

</script>

<div id="contents">
	<div id="guide_1">
	    <span class="font-underline">도서관안내</span>
	</div>
	<div id="guide_2">
	
	</div>
	<div id="guide_3">
		<div id="map">
			<div id="map_title">
				<h2>오시는 길</h2>
			</div>
			<div id="map_content">
			
			</div>
		</div>
	</div>

	<div id="guide_4">

	</div>
</div>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1cf556a5ce244fe3d1c3ad1ce741bda7"></script>

<script>
var mapContainer = document.getElementById('map_content'), // 지도를 표시할 div 
mapOption = { 
	center: new kakao.maps.LatLng(35.868347, 128.601671), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.868347, 128.601671); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
	position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">대구광역시립 중앙도서관 <br><a href="https://map.kakao.com/link/map/대구광역시립 중앙도서관, 35.868347, 128.601671" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/대구광역시립 중앙도서관,35.868347, 128.601671" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(35.868347, 128.601671); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
	position : iwPosition, 
	content : iwContent 
});

// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker);


</script>

<%@ include file="../include/footer.jsp" %>