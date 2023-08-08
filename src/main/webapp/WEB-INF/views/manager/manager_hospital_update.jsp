<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
  <title>펫캐어피디아 | 수정하기</title>
  <link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
  <link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
  <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
  <script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7reerlqgi2&submodules=geocoder"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        $(document).ready(function () {
            $(".header-menu").css('background','#FFB3BD');
            $(".footer-menu").css('background','#FFF2F4');
            $("#btnMainSearch-header > img").attr("src",'http://localhost:9000/images/foot_pink.png');
        });
    </script>
    <script>
      const autoHyphen = (target) => {
      target.value = target.value
              .replace(/[^0-9]/g, '')
              .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }
  </script>
    <script>
        $(document).ready(function(){
            var select = '${hospital.htime}';
            var selectHtime1 = select.substr(0,5);
            var selectHtime2 = select.substr(6,10);
            $('#ntime').val('${hospital.ntime}').prop("selected",true);
            $('#holiday').val('${hospital.holiday}').prop("selected",true);
            $('#animal').val('${hospital.animal}').prop("selected",true);
            $('#htime1').val(selectHtime1).prop("selected",true);
            $('#htime2').val(selectHtime2).prop("selected",true);
        })
    </script>
    <script>
    $(document).ready(function(){
        $("#file1").change(function(){
            if(window.FileReader){
                let fname = $(this)[0].files[0].name;
                $("#update_file1").text(fname);
            }
        });
        $("#file2").change(function(){
            if(window.FileReader){
                let fname = $(this)[0].files[0].name;
                $("#update_file2").text(fname);
            }
        });
    })
    </script>
</head>
<body>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>

<div id = "content" style = "margin-top: 140px;">
  <section class = "hospital_info" id = "hospital_info">
    <h1 id = "title">병원 정보</h1>
    <hr>
    <form name="updateForm" action="/manager_update" method="post" enctype="multipart/form-data">
      <section class = "section1" id = "section1">
        <div>
          <nav>
            <ul>
                <li>마이페이지</li>
                <li><a href = "/manager_hospital_list" >병원 정보 관리</a></li>
                <li><a href = "/manager_reserve_list/1/${sessionScope.svo.hid}">예약 관리</a></li>
                <li><a href = "/manager_review_list/1/">리뷰 관리</a></li>
                <li><a href = "/manager_information">회원 정보</a></li>
                <li><a href = "/mypage_signout">회원 탈퇴</a></li>
            </ul>
          </nav>
        </div>
      </section>
      <div class = "aside" id = "aside">
        <section class = "section2" id = "section2">
          <ul>
<%--            <li>--%>
<%--              <label>아이디</label>--%>
<%--              <label>HID_</label>--%>
<%--            </li>--%>
            <li>
              <label>병원명</label>
             <input type = "text" name = "hname" id = "hname" placeholder = "수정할 병원명을 입력해주세요" value = "${hospital.hname}">
            </li>
            <li>
              <label>주소</label>
                <input type = "text" name = "loc" id = "loc" placeholder = "등록할 병원 주소를 입력해주세요" value = "${hospital.loc}">
                <button type="button" class="btnSearchLoc" id="btnSearchLoc">주소찾기</button>
                <input type="hidden" name="x" id="x" placeholder="위도" value = "${hospital.x}">
                <input type="hidden" name="y" id="y" placeholder="경도" value = "${hospital.y}">
            </li>
            <li>
              <label>지역구</label>
              <input type = "text" name = "gloc" id = "gloc" placeholder = "ex) 강남구" value = "${hospital.gloc}">
            </li>
            <li>
              <label>전화번호</label>
              <input type="text" value = "${hospital.tel}" name = "tel" id = "tel" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력해주세요">
            </li>
            <li>
              <label>영업시간</label>
              <div id = "open_time">
                <select name="htime1" id="htime1">
                </select>
                ~<select name="htime2" id="htime2">
              </select>
              </div>
            </li>
            <li>
              <label>야간진료</label>
              <select name="ntime" id="ntime">
                <option value="default">선택</option>
                <option value="O">O</option>
                <option value="X">X</option>
              </select>
                <span style = "font-size : 12px; color : #7AB2CC; font-weight : 500">*21시 이후 진료 여부</span>
            </li>
            <li>
              <label>휴일진료</label>
              <select name="holiday" id="holiday">
                <option value="default">선택</option>
                <option value="O">O</option>
                <option value="X">X</option>
              </select>
                <span style = "font-size : 12px; color : #7AB2CC; font-weight : 500">*공휴일 진료 여부</span>
            </li>
            <li>
              <label>특수동물</label>
              <select name="animal" id="animal">
                <option value="default">선택</option>
                <option value="O">O</option>
                <option value="X">X</option>
              </select>
                <span style = "font-size : 12px; color : #7AB2CC; font-weight : 500">*특수동물 진료 가능 여부</span>
            </li>
            <li>
                <label>병원소개</label>
                <textarea name = "intro" id = "intro" placeholder="병원소개를 해보세요!">${hospital.intro}</textarea>
            </li>
            <li>
                <label>홈페이지</label>
                <input type = "text" name = "hrink" id = "hrink" placeholder="홈페이지 주소가 있으면 주소를 입력해주세요" value = ${hospital.hrink}>
            </li>
            <li>
                <label>병원이미지</label>
                <c:choose>
                    <c:when test = "${hospital.hfile1 != null}">
                        <div class="filebox">
                            <input class="upload-name_file1" value="${hospital.hfile1}" placeholder="첨부파일">
                            <label class = "find_file1" for="file1">파일찾기</label>
                            <input type="file" name="files" class = "file_first" id = "file1" accept="image/*">
                            <input type = "hidden" name = "hfile1" value = "${hospital.hfile1}">
                            <input type = "hidden" name = "hsfile1" value = "${hospital.hsfile1}">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="filebox">
                            <input class="upload-name_file1" value="첨부파일" placeholder="첨부파일">
                            <label class = "find_file1" for="file1">파일찾기</label>
                            <input type="file" name="files" class = "file_first" id = "file1" accept="image/*">
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test = "${hospital.hfile2 != null}">
                        <div class="filebox">
                            <input class="upload-name_file2" value="${hospital.hfile2}" placeholder="첨부파일">
                            <label class = "find_file2" for="file2">파일찾기</label>
                            <input type="file" name="files" class = "file_second" id = "file2" accept="image/*">
                            <input type = "hidden" name = "hfile2" value = "${hospital.hfile2}">
                            <input type = "hidden" name = "hsfile2" value = "${hospital.hsfile2}">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="filebox">
                            <input class="upload-name_file2" value="첨부파일" placeholder="첨부파일">
                            <label class = "find_file2" for="file2">파일찾기</label>
                            <input type="file" name="files" class = "file_second" id = "file2" accept="image/*">
                        </div>
                    </c:otherwise>
                </c:choose>
            </li>
          </ul>
        </section>
        <section id = "section3">
          <button type = "button" id = "btnHospitalUpdate">수정하기</button>
        </section>
      </div>
      <input type = "hidden" name = "hid" id = "hid" value = "${hospital.hid}">
    </form>
  </section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>