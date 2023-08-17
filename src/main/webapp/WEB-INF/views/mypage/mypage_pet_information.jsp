<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
  <title>펫캐어피디아 | 나의 회원정보</title>
  <link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
  <link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
  <link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song_pet.css">
  <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
  <script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
  <script src="http://localhost:9000/js/petcarepedia_jquery_song_pet.js"></script>
  <script src="https://kit.fontawesome.com/4ed285928f.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
  <script>
    function readURL1(input) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('addProImg').src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
    }
    function readURL2(input) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('updateProImg').src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
    }
  </script>

</head>
<body>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<div id = "content" style = "margin-top:140px">
  <section id = "information">
    <h1 id = "title">나의 반려동물</h1>
    <hr>
    <section id = "section1">
      <div>
        <nav>
          <ul>
            <li>마이페이지</li>
            <li><a href = "/mypage_member_information" style="font-weight: normal">회원 정보</a></li>
            <li><a href = "/mypage_pet_information" style="font-weight: bold">반려동물 정보</a></li>
            <li><a href = "/mypage_reservation">예약 내역</a></li>
            <li><a href = "/mypage_my_review/1/">내가 쓴 리뷰</a></li>
            <li><a href = "/mypage_bookmark">즐겨찾기</a></li>
            <li><a href = "/mypage_signout">회원 탈퇴</a></li>
          </ul>
        </nav>
      </div>
    </section>
    <div id = "aside-pet">

      <c:if test="${list != null}">
        <c:forEach var="pet" items="${list}">
          <div class="pet-box" id="${pet.pid}">
            <div class="proimg-box">
              <c:choose>
                <c:when test="${pet.psfile != null && pet.psfile != '' && pet.psfile != 'null'}">
                  <img src="http://localhost:9000/upload/${pet.psfile}/" class="proimg" id="proImg">
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${pet.pkind == '강아지'}">
                      <img src="http://localhost:9000/images/dog_profile.png/" class="proimg" id="proImg">
                    </c:when>
                    <c:when test="${pet.pkind == '고양이'}">
                      <img src="http://localhost:9000/images/cat_profile.png/" class="proimg" id="proImg">
                    </c:when>
                    <c:otherwise>
                      <img src="http://localhost:9000/images/etc_profile.png/" class="proimg" id="proImg">
                    </c:otherwise>
                  </c:choose>
                </c:otherwise>
              </c:choose>
            </div>
            <ul class="pet-info">
              <li>
                <label>이름</label>
                <div>${pet.pname}</div>
              </li>
              <li>
                <label>종류</label>
                <div>${pet.pkind}</div>
              </li>
              <li>
                <label>성별</label>
                <div>${pet.pgender}</div>
              </li>
              <li>
                <label>생일</label>
                <div>${pet.pbirth}</div>
              </li>
            </ul>
          </div>
        </c:forEach>
      </c:if>

      <c:if test="${list.size() < 3}">
        <div class="add-box">
          <i class="fa-solid fa-circle-plus fa-4x" style="color: #989898;"></i>
          <p>새 프로필 등록</p>
          <p>*최대 3개까지 등록 가능합니다.</p>
        </div>
      </c:if>

    </div>
  </section>
</div>


<div class="back"></div>
<div class="pet-write-modal">
  <div class="pet-write-box">
    <div class="title">
      반려동물 프로필 등록
      <i class="fa-solid fa-xmark fa-xl btn-close" id="btnAddClose"></i>
    </div>

    <form name="petWriteForm" action="/pet_write" method="post" enctype = "multipart/form-data">
      <input type = "hidden" name = "mid" value = "${sessionScope.svo.mid}">

      <input type="file" name="file1" id = "file1" onchange = "readURL1(this)" accept="image/*" style = "display : none">
      <div class="proimg-box">
        <img src="http://localhost:9000/images/etc_profile.png" class="proimg" id="addProImg">
        <img src = "http://localhost:9000/images/수정.png" class="proimg-btn" id="btnAddProImg">
      </div>
      <ul class="pet-info">
        <li>
          <label>이름</label>
          <input type="text" name="pname" id="pname" placeholder="반려동물의 이름을 적어주세요!">
        </li>
        <li>
          <label>종류</label>
          <select name="pkind" id="pkind">
            <option value="강아지">강아지</option>
            <option value="고양이">고양이</option>
            <option value="특수동물">특수동물</option>
          </select>
        </li>
        <li>
          <label>성별</label>
          <div class="form-gender">
            <input type="radio" name="pgender" value="남" checked><span>남</span>
            <input type="radio" name="pgender" value="여"><span>여</span>
          </div>
        </li>
        <li>
          <label>생일</label>
          <input type="date" name = "pbirth"
                 id="pbirth"
                 max="2023-06-20"
                 min="1950-06-05">
        </li>
      </ul>

      <button type="button" id="btnAddPet" class="btn-pet">등록</button>

    </form>
  </div>
</div>

<div class="pet-update-modal">
  <div class="pet-update-box">

  </div>
</div>
<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>