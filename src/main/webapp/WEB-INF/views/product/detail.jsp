<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>텀블벅</title>
    <link rel="stylesheet" href="/static/main/style.css">
    <link rel="stylesheet" href="/static/main/common.css">
    <link rel="stylesheet" href="/static/product/css/detail.css">
    <link rel="stylesheet" href="/static/user/css/usercommon.css">
    <script src="https://kit.fontawesome.com/409fef83e5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="/static/product/vendor/jquery-ui.js"></script>
    <script type="text/javascript" src="/static/product/vendor/jquery.bpopup.min.js"></script>
    <script type="text/javascript" src="/static/product/vendor/moment.min.js"></script>
    <script type="text/javascript" src="/static/product/vendor/daterangepicker.js"></script>
    <script type="text/javascript" src="/static/product/common.js"></script>
    <script type="text/javascript" src="/static/product/detail.js"></script>
    <script type="text/javascript" src="/static/product/likeDetail.js"></script>
    <script type="text/javascript" src="/static/user/js/header.js"></script>
    <script type="text/javascript" src="/static/user/js/profile.js"></script>
    <script type="text/javascript" src="/static/user/js/settingProfile.js"></script>
    <script type="text/javascript" src="/static/user/js/settingAccount.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body>
<div class="userId">bada@naver.com</div>
<div class="pjId">P5040</div>
<%-- 공용 헤더 페이지에 붙임 --%>
<%-- LoginInfo --%>
<c:set var="loginInfo" value="${user_email=='' || user_email == null ? '로그인/회원가입' : userInfo.user_name}"/>
<c:set var="userprofileImg" value="${user_profileImg=='' || user_profileImg == null ? '/static/img/avatar.webp' : '/user/img/'}"/>
<div class="header">
    <div class="hd">
        <a href="<c:url value='/'/>">
            <%--            <h1 class="logo">Fundly</h1>--%>
            <img class="logo" src="/static/img/fundly-logo.svg">
        </a>
        <div class="lftSmn">
            <div class="pjtUp">
                <a href="<c:url value="/project/editor/start" />">프로젝트 올리기</a>
            </div>
            <div class="like">
                <i class="fa-regular fa-heart"></i>
            </div>
            <div class="alm">
                <i class="fa-regular fa-bell"></i>
            </div>

            <div class="userIf" >
                <div class="infoGr" id ="loginInfo">
                    <div class="ifImg">
                        <span id="profileImg" style="background: url('${userprofileImg}${user_profileImg}') 50% 37% / cover no-repeat"></span>
                    </div>
                    <div class="ifTxt" id="ifTxt">${loginInfo}</div>
                    <div class="MyPageList" id = "MyPageList">
                        <a href="<c:url value='/mypage/profile'/>"><div class="pageItem" id = "Profile">프로필</div></a>
                        <a href="<c:url value='/mypage/coupon'/>"><div class="pageItem" id = "Coupon">응원권</div></a>
                        <div class="line"></div>
                        <a href="<c:url value='/mypage/fundingProject'/>"><div class="pageItem" id = "fundingProject">후원한 프로젝트</div></a>
                        <a href="<c:url value='/mypage/likes'/>"><div class="pageItem" id = "Likes">관심 프로젝트</div></a>
                        <div class="line"></div>
                        <a href="<c:url value='/mypage/alarm'/>"><div class="pageItem" id = "Alarm">알림</div></a>
                        <a href="<c:url value='/mypage/message'/>"><div class="pageItem" id = "Message">메시지</div></a>
                        <div class="line"></div>
                        <a href="<c:url value='/mypage/makeProject'/>"><div class="pageItem" id = "MakeProject">내가 만든 프로젝트</div></a>
                        <a href="<c:url value='/mypage/setting'/>"><div class="pageItem" id = "Setting">설정</div></a>
                        <div class="line"></div>
                        <a href="<c:url value='/login/logout'/>"><div class="pageItem" id = "LogOut">로그아웃</div></a>
                    </div>
                    <%--                        &lt;%&ndash;                    <div class="ifTxt">로그인/회원가입</div>&ndash;%&gt;--%>
                    <%--                        &lt;%&ndash;                    <div class="ifTxt">이한수</div>&ndash;%&gt;--%>
                </div>
            </div>
        </div>
    </div>
    <!--스크롤 시 고정되는 header-->
    <div class="sd">
        <div class="lftCtmn">
            <!--메뉴 슬라이드-->
            <div class="cateMn">
                <div class="mnSld">
                    <div class="hmMenu">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    카테고리
                </div>
                <div class="home">홈</div>
                <div class="popul">인기</div>
                <div class="new">신규</div>
                <div class="final">마감임박</div>
            </div>
            <!--검색창-->
            <div class="schMn">
                <input type="text" placeholder="검색어를 입력해주세요.">
                <div class="schIcon">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="gftCont">
    <div class="gftItr">
        <div class="itrBox">
            <div class="titBox">
                <div class="itrTit">
                    <a href="#">
                        <span class="gftCate">${pj.ctg}</span><!--향수-->
                    </a>
                    <%--                    <h1 class="gftTit">다가오는 봄을 위한 라일락 생화향수 &lt;블로썸&gt; </h1>--%>
                    <h1 class="gftTit">${pj.pj_long_title}</h1>
                </div>
            </div>
            <div class="itrGr">
                <div class="swContainer">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="https://tumblbug-pci.imgix.net/320b5b32ee7739c5e82b17c2b101155eef47e4cf/c4a948739fc0d6975cafd3dff5e534611fa6495d/5dd60e6e433a187d908ec4b427c6187e0252290d/ad5baaad-977f-49a8-98ad-be8f3388c004.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=d231790d0cc0269996739076d3b0c3cb"
                                     alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://tumblbug-pci.imgix.net/320b5b32ee7739c5e82b17c2b101155eef47e4cf/c4a948739fc0d6975cafd3dff5e534611fa6495d/5dd60e6e433a187d908ec4b427c6187e0252290d/6c283549-911d-4b8b-a9c4-1905ddb66478.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=501c8005e5339d9cb1c58072d1d5d73f"
                                     alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://tumblbug-pci.imgix.net/320b5b32ee7739c5e82b17c2b101155eef47e4cf/c4a948739fc0d6975cafd3dff5e534611fa6495d/5dd60e6e433a187d908ec4b427c6187e0252290d/04fa14ed-e852-44df-a265-b66cfd0d0bf6.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=a46c2aa5a414407b4d0df4d454b9531d"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#404040" path
                                  d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                        </svg>
                    </div>
                    <div class="swiper-button-prev prv">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/>
                        </svg>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="itrGoal">
                    <div class="itrStt">
                        <div class="sttElm">
                            <div class="elmTit">모인금액</div>
                            <div class="elmBox">
                                <span class="val">8,887,100
                                    <span class="sMall">원</span>
                                </span>
                                <span class="valPct">1777%</span>
                            </div>
                        </div>
                        <div class="sttElm">
                            <div class="elmTit">남은시간</div>
                            <div class="elmBox">
                                <span class="val">
                                    12
                                    <span class="sMall">일</span>
                                </span>
                            </div>
                        </div>
                        <div class="sttElm">
                            <div class="elmTit">후원자</div>
                            <div class="elmBox">
                                <span class="val">
                                    186
                                    <span class="sMall">명</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="itrFund">
                        <dl>
                            <dt>목표금액</dt>
                            <dd>${pj.fund_goal_money}<span>원</span></dd><!--500,000원-->
                        </dl>
                        <dl>
                            <dt>펀딩 기간</dt>
                            <dd>${pj.fund_str_dtm} ~ ${pj.fund_end_dtm}<span class="fndInfo">12일 남음</span></dd>
                            <!--2023.01.31 ~ 2024.02.17-->
                        </dl>
                        <dl>
                            <dt>결제</dt>
                            <dd>목표금액 달성시 ${pj.fund_calc_due_dtm}에 진행</dd><!--2024.02.03-->
                        </dl>
                    </div>
                    <div class="btnWrap">
                        <button class="likeBtn">
                            <div class="btnIco">
                                <div class="icoImg" id="heartWhite" onclick="clickLikeBtn()">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/>
                                    </svg>
                                </div>
                                <div class="icoImg on" id="heartRed" onclick="clickLikeBtn()">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path fill="#fa6462"
                                              d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
                                    </svg>
                                </div>
                                <span class="likeCnt">10</span>
                            </div>
                        </button>
                        <button class="ordBtn purp">이 프로젝트 후원하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainCont">
        <div class="tabMenu bd">
            <div class="tabBtn">
                <button class="btn on">프로젝트 계획</button>
                <button class="btn">업데이트<span>4</span></button>
                <button class="btn">커뮤니티<span>15</span></button>
                <button class="btn">추천</button>
            </div>
        </div>
        <div class="tabCont">
            <div class="cont on">
                <div class="tabFlx">
                    <div class="tabConWrap">
                        <div class="tabScr">
                            <div class="scrBtnWrap">
                                <button class="btn on" data-target="#section1">소개</button>
                                <button class="btn" data-target="#section2">예산</button>
                                <button class="btn" data-target="#section3">일정</button>
                                <button class="btn" data-target="#section4">팀 소개</button>
                                <button class="btn" data-target="#section5">선물 설명</button>
                                <%--                                <button class="btn" data-target="#section6">신뢰와 안전</button>--%>
                            </div>
                        </div>
                        <div class="scrMain">
                            <div class="strCard" id="section1">
                                <div class="strIntro">
                                    ${pj.pj_intro}
                                    <%--                                    <div class="strTit">프로젝트 소개</div>--%>
                                    <%--                                    <h2 class="strSub">--%>
                                    <%--                                        펀딩 오픈 1분 만에 👀<br>--%>
                                    <%--                                        목표금액 100% 달성 🎉 <br>--%>
                                    <%--                                        오픈 2일 차 1,500% 달성 🎉 <br>--%>
                                    <%--                                        성원에 감사드립니다.--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        블로썸을 펀딩해 주시는<strong> </strong>--%>
                                    <%--                                        <u><strong>모든 후원자분들께 본품 수만큼 미니퍼퓸(3ml)</strong></u>을 드립니다 🎁 <br>--%>
                                    <%--                                        *자세한 사항은 하단의 "선물설명"을 참고해주세요 :)--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>&nbsp;</p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        💐 물기 어린 라일락 생화 향기, 블로썸 BLOSSOM<br>--%>
                                    <%--                                        <img style="color: #0d0d0d; font-size: 20px; font-weight: bold;" src="https://img.tumblbug.com/story/320b5b32ee7739c5e82b17c2b101155eef47e4cf/c4a948739fc0d6975cafd3dff5e534611fa6495d/5dd60e6e433a187d908ec4b427c6187e0252290d/004b7747-e0d9-499c-8196-2118ed60d16f.gif">--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <br>안개가 자욱한 봄날 아침,&nbsp;<br>--%>
                                    <%--                                        <strong><u>밤새 촉촉하게 내려 앉은 이슬에 젖은 라일락이 가득한 아름다운 정원</u></strong>--%>
                                    <%--                                        한 가운데 서 있는 풍경을 떠올려 보세요.--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        이슬 덕분에 더욱 짙게 느껴지는 라일락 향기의 깊이는 살랑이는 작은 바람결에도 더 풍성하게 느껴지는 듯합니다.&nbsp;<br>--%>
                                    <%--                                        시야를 가득 채우는 은은한 보랏빛 물결.&nbsp;<br>--%>
                                    <%--                                        그 속에서 라일락과 더불어 사방에서 느껴지는 봄꽃의 향기가 코끝을 간질입니다.&nbsp;--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        <img src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvNTk3ODNiMzItZDdmZS00OTAwLTljYTktYjA0ZTk5NDBiMDc2LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                        <br><br>--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        탁 트인 정원이라 그런지 작은 바람으로도 계속해서 환기되는 신선한 라일락의 첫 향이 상쾌하게 느껴집니다.&nbsp;<br>이내 시간이 지날수록 공기마저 포근해지고, 조용히 구름이 정원을 안아주는 것 같은 새하얀 비누향이 이어지죠.&nbsp;<br>여러 색감의 레이어가 겹쳐지며 완성되는 부드럽고 포근한 유화 작품처럼, 섬세한 그림이 연상되는 풍경입니다.<br><br>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <img src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvMjllOWJiZWItMWRmYS00NzRhLWIxNzEtMjQ1NmQ4ZWZhMzRhLmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <br>이번에 세이리가 선보이는 <u><strong>"블로썸"은 촉촉한 라일락 나무가 가득한 정원을 떠올리며 조향</strong></u>했습니다.<br>가장 세이리다운 라일락 향기를 담고자, 기존 라일락 향기를 표현한 향수들에서 개인적으로 아쉬웠던 점들을 보완하고자 노력했어요. <br>특히 라일락의 미묘한 향기들 중에서도 <u>생화에서만 느낄 수 있는 날것의 촉촉함을 표현하는 것</u>을 이번 향수의 큰 목표로 잡았죠. <br>그렇게 탄생한 블로썸은 뿌리는 순간 <u>정원에서 바람을 타고 자연스럽게 느껴지는 생화 라일락 향기</u>가 느껴집니다. <br>바람결에 흩날려 찾아온 물기 어린 라일락의 아름답고 은은한 향기, 세이리만의 독특한 감성으로 표현한 블로썸을 만나 보세요!&nbsp;<br><br><br>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        📝 블로썸, 어떤 향기인가요?&nbsp;<br><img id="ab08c7a4-3da6-4f27-ab77-eb720dea34b0" src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvMTlkMzc2NzAtYzIxMy00MDAwLTg5MmUtODAxOWNmODNjNjgyLmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <strong>TOP NOTE : 그린노트&nbsp;</strong>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        첫 느낌으로는 <u>초록빛으로 물든 잎새들이 눈 앞에 펼쳐지는 듯 싱그러운 향</u>이 느껴집니다. 상쾌함을 넘어 풋풋하고 시원한 느낌까지 전해지는 탑노트는 뿌리는 순간 기분 전환을 빠르게 도와줍니다. <br>하루의 에너지를 채우는 아침 순간에도, 편안한 하루의 마무리를 준비하는 저녁 시간에도 언제나 잘 어울릴 수 있는 편안하고 자연스러운, 그리너리한 향기로 채웠습니다.--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <br><strong>MIDDLE NOTE : 라일락, 워터리노트, 프리지어, 릴리, 산사나무&nbsp;</strong>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        그 다음 순간엔 아름드리 편 <u>라일락 나무 아래 서 있는 듯 생생한 라일락 향기</u>가 전달됩니다. <br>신선한 라일락 향기에서 <u>생화의 느낌을 가장 담고 싶었기 때문에 워터리 노트</u>를 더했는데요. <br>작은 보석과 같은 이슬들이 가득 맺힌 라일락 꽃잎이 흔들릴 때 어떤 향이 날까 고민하며 촉촉한 향기를 더했어요. <br>여기에 라일락 뿐만 아니라 다양한 봄꽃이 어우러지는 느낌을 선사하고자 프리지아와 릴리, 산사나무 향까지 복합적인 레이어를 만들었습니다. <br>라일락을 모티프로 꾸민 아름다운 연보랏빛 정원에서 날 법한 섬세하고도 부드러운 미들 노트이죠.&nbsp;--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <br><strong>BASE NOTE : 머스크&nbsp;</strong>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        아름다운 라일락 정원을 지나 온 당신에게 이 향이 은은하게 남기를 바랐습니다. <br>그래서<u> 베이스 노트에는 머스크를 담아 앞선 향들이 더 오래 지속될 수 있는 포근함</u>을 더했죠. <br>신선한 라일락 향기에서부터 시작되어 포근한 머스크 향으로 남는 블로썸은 모든 계절에 잘 어울리는 유니크한 데일리 향수랍니다.&nbsp;<br><br><br><img id="d915d4df-dcd6-40f8-9411-4573ef645af3" style="width: 620px;" src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvMzRlMTY0ZDYtMWEwOC00OWNkLWFjM2QtYzk4NmQ4ZDBjYzIxLmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        <br>--%>
                                    <%--                                        <br>--%>
                                    <%--                                        ✔️ 블로썸 퍼퓸 디퓨저 (120ML)--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        블로썸 향기를 디퓨저로도 만나보실 수 있는 구성을 마련했습니다. 오드퍼퓸과 같은 향조이며 공간에 사용함에 걸맞도록 연구하여 탄생한 디퓨저입니다.&nbsp; 퍼퓸 디퓨저로 이름처럼 높은 부향률로 풍부하고 효과적인 발향을 담았습니다.<br>삶의 다양한 공간에 라일락의 행복한 향기를 물들여보세요!<br>(디퓨저 디자인의 사진이며, 라벨 디자인은 동일한 형태로 제작됩니다.)<br><br><img id="51abdee7-783a-48bd-b830-023fac5a9fd9" style="font-weight: bold;" src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvOWZhNmNhMDAtMDRmNC00MjQ1LWFiOTYtYzUxZmYxYjM5NDNkLmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19"><br>구성 : 세이리 퍼퓸 디퓨저(블로썸) 120ML + 리드스틱 5ea 포함<br><br><img id="cf95af68-92cd-431c-b2a4-795768326347" style="color: #0d0d0d; font-size: 20px; font-weight: bold;" src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvZmM5NTZhOWQtOGMwNy00YTFlLThiYmItZDA3ODYwZGZjOTc4LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        <br>✔️ 다양한 리워드 혜택&nbsp;--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <u>퍼퓸 3개 구성 리워드부터 "블로썸" 오드퍼퓸 이외에 기존에 출시된 향수도 선택</u> 가능하십니다. 블로썸 향기를 디퓨저로도 만나보실 수 있는 <u>퍼퓸+디퓨저 듀오 구성도 특별한 혜택</u>으로 마련했습니다.--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        <br>--%>
                                    <%--                                        ✔️ 오 드 퍼퓸 향 소개<br>--%>
                                    <%--                                        <img src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvNjhmZWExYmItM2NlNC00ZDQzLTk1YWQtYjc5NjJkOGIwNjU4LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                        <br>--%>
                                    <%--                                        <br>--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        <strong>✔️ 사용방법</strong><strong style="color: #3d3d3d; font-size: 14px;">&nbsp;</strong>--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        손목, 귀 등 맥박이 뛰는 곳에 사용해주세요. 시간이 흐르면서 체온과 만나 자연스럽게 피부에 밀착됩니다.--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <img src="https://img.tumblbug.com/story/320b5b32ee7739c5e82b17c2b101155eef47e4cf/c4a948739fc0d6975cafd3dff5e534611fa6495d/5dd60e6e433a187d908ec4b427c6187e0252290d/338ca013-ba20-49cf-aab9-0bf080506796.gif">--%>
                                    <%--                                        <br>--%>
                                    <%--                                        <br>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <h2>🙋🏼&zwj;♀️ 자주 하시는 질문</h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <strong>&nbsp;Q1. 향수 보관은 어떻게 하나요?</strong><br>뚜껑을 닫아 직사광선을 피해 서늘하고 건조한 곳에 보관하는 것이 가장 좋습니다.<br><br>Q2. 용량은?<br>블로썸 오드 퍼퓸의 용량은 50ml 입니다. &nbsp;<br><br>Q3. 사용할 수 있는 기간은?<br>제조 예정일은 2월 중순이며<br>개봉 전 60개월, 개봉 후 36개월 이내 사용을 권장합니다.<br><br>Q4. 블로썸의 부향률은 어떻게 되나요?<br>약 15% 부향률의 오드퍼퓸입니다. 환경에 따라 차이가 있지만 3~5시간 향기가 지속됩니다.&nbsp;--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>&nbsp;</p>--%>
                                    <%--                                    <h2>--%>
                                    <%--                                        🎁 PACKAGE<br><img src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvYzVmZmUyZGEtYTkwZC00ZTc5LWIwZDgtZmIzNzFhZWIyOWQ2LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </h2>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        감사의 표시, 사랑의 마음을 표현하실 수&nbsp; 있도록 리본으로 마무리한 세이리 리본 패키지를 선택하실 수 있습니다. 리워드 선택 후 <strong><u>추가후원금(+1,000)원을 더해주시면 기본패키지+리본 포장</u></strong>을 해드립니다.<br>기존에 포장에 불필요하다는 후원자님들의 의견으로 필요하신 후원자님들께만 적용해 드리도록 구성하였으니 원하시는 후원자님들께서는 꼭 추가 후원을 부탁드립니다 :)--%>
                                    <%--                                    </p>--%>
                                </div>
                                <div class="strBud" id="section2">
                                    ${pj.pj_budget}
                                    <%--                                    <div class="strTit">프로젝트 예산</div>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        목표금액 50만원은 블로썸 향료를 조향 및 생산하는 비용, 원료 비용 그리고 용기, 오버캡의 기본적인 재료비이며<br>생산된 향료와 베이스를 믹싱&amp;숙성하는 과정, 공병 살균, 소독 및 병입 과정에서의 제작비 그리고 패키지에 필요한 패키지의 최소한 비용입니다. 대표의 조향, 패키지 디자인의 비용은 책정하지 않았습니다.<br>언제나처럼, 향수가 완성되기까지 전 과정 모두 정직하고 진실되게 임할 것을 약속드립니다.--%>
                                    <%--                                    </p>--%>
                                </div>
                                <div class="strSch" id="section3">
                                    ${pj.pj_sched}
                                    <%--                                    <div class="strTit">프로젝트 일정</div>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        <strong>완료 : 향료, 제조사 계약, 부자재 확보</strong>--%>
                                    <%--                                    </p>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        펀딩 시작 01/31<br>--%>
                                    <%--                                        향수 제작 시작일 02/01<br>--%>
                                    <%--                                        펀딩 종료일 02/17<br>--%>
                                    <%--                                        향수 제작 완료 02/15<br>--%>
                                    <%--                                        선물 배송 시작 03/12--%>
                                    <%--                                    </p>--%>
                                </div>
                                <div class="strTeam" id="section4">
                                    ${pj.pj_sel_intro}
                                    <%--                                    <div class="strTit">프로젝트 팀 소개</div>--%>
                                    <%--                                    <div>--%>
                                    <%--                                        <h2>--%>
                                    <%--                                            About <strong>세이리</strong><img src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvOWNmM2U4N2YtNWRkYS00YjNlLTkyNzctYTMzNTg5MDQzYzE2LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                        </h2>--%>
                                    <%--                                        <p>--%>
                                    <%--                                            세이리는 2019년 시작된 프래그런스 브랜드입니다.<br>미술가이며 퍼퓸디렉터인 이세희의 이름을 담았습니다.&nbsp;<br>브랜드명에 이름을 담은 이유는 완성되기까지 책임감을 가지고 전 과정 정직하게 임하자는 것과 최고의 원료를 통해 완성도 있는 향기를 전해드리자는 초심을 잃고 싶지 않아서 였습니다.<br>세이리의 향수 작업은 듣고 읽고 발견한 모든 것과 예술과 여행에서 영감을 얻어 진행되며 마치 작품을 선물하듯 향 하나하나엔 고유의 그림이 새겨져 있습니다.<br>제조 및 디자인은 한국에서 수제작으로 이루어지며 최고급 성분으로 만든 풍부한 에센스로 종일 피부에 밀착됩니다.<br>세이리가 창작한 향기들이 아름다운 영혼과 문화, 예술, 삶의 방식을 나타내 주며 나아가 당신을 새로운 곳으로 안내하길 꿈꾸며 작업하고 있습니다. <br>기억을 불러일으키고 경험을 공유하며 감정을 전달하는 마법 같은 향의 여정을 여러분과 함께하고 싶습니다.&nbsp;--%>
                                    <%--                                        </p>--%>
                                    <%--                                    </div>--%>
                                </div>
                                <div class="strDesc" id="section5">
                                    <%--                                <div class="strDesc" id="section5">--%>
                                    ${pj.pj_gift_intro}
                                    <%--                                    <div class="strTit">선물 설명</div>--%>
                                    <%--                                    <p>--%>
                                    <%--                                        # 텀블벅 런칭 가격으로--%>
                                    <%--                                        <strong><u> 정가대비 30% 이상 할인률</u></strong>로 구성되었습니다.<br>--%>
                                    <%--                                        # 리워드의 한정수량 소진 시 인상된 가격으로 리워드가 구성됩니다.<br>--%>
                                    <%--                                        # 미니퍼퓸 향은 미정이며, 블로썸 이외의 향으로 증정해드립니다.<br>--%>
                                    <%--                                        # 그 밖의 원하시는 구성이 있으실 경우 &lt;창작자에게 문의하기&gt;를 통해 말씀해주세요.--%>
                                    <%--                                        <img id="cbf28f6f-3335-44af-a32e-16cbf517ab1a" src="https://img.tumblbug.com/eyJidWNrZXQiOiJ0dW1ibGJ1Zy1pbWctYXNzZXRzIiwia2V5Ijoic3RvcnkvMzIwYjViMzJlZTc3MzljNWU4MmIxN2MyYjEwMTE1NWVlZjQ3ZTRjZi9jNGE5NDg3MzlmYzBkNjk3NWNhZmQzZGZmNWU1MzQ2MTFmYTY0OTVkLzVkZDYwZTZlNDMzYTE4N2Q5MDhlYzRiNDI3YzYxODdlMDI1MjI5MGQvNDViZDIzYTQtOTVmNi00YTQzLWEwZmMtOGEyNDQ1ZmQzYTgzLmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTI0MCwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19">--%>
                                    <%--                                    </p>--%>
                                </div>
                                <%--                                <div class="strSafe">--%>
                                <%--                                    <div class="strTit">신뢰와 안전</div>--%>
                                <%--                                    <div class="crowdFd">--%>
                                <%--                                        <div class="crowdTit">크라우드 펀딩에 대한 안내</div>--%>
                                <%--                                        <dl>--%>
                                <%--                                            <dt>--%>
                                <%--                                                <img alt="" src="/static/img/prjone.png">후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.--%>
                                <%--                                            </dt>--%>
                                <%--                                            <dd>전자상거래법상 통신판매는 소비자의 청약 전 규격, 제조연월일 등 구체적인 상품정보가 제공 가능한 것을 대상으로 합니다. 따라서 텀블벅에서의 후원은 통신판매에 해당하지 않고, 전자상거래법 및 소비자보호규정(수령 후 7일 내 청약철회 등)이 적용되지 않습니다.</dd>--%>
                                <%--                                        </dl>--%>
                                <%--                                        <dl>--%>
                                <%--                                            <dt>--%>
                                <%--                                                <img alt="" src="/static/img/prjtwo.png">프로젝트는 계획과 달리 진행될 수 있습니다.--%>
                                <%--                                            </dt>--%>
                                <%--                                            <dd>--%>
                                <%--                                                예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다. 본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.--%>
                                <%--                                            </dd>--%>
                                <%--                                        </dl>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="crowdLink">--%>
                                <%--                                        <a href="#">--%>
                                <%--                                            크라우드펀딩·후원 이해하기--%>
                                <%--                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#f86453" d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32h82.7L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3V192c0 17.7 14.3 32 32 32s32-14.3 32-32V32c0-17.7-14.3-32-32-32H320zM80 32C35.8 32 0 67.8 0 112V432c0 44.2 35.8 80 80 80H400c44.2 0 80-35.8 80-80V320c0-17.7-14.3-32-32-32s-32 14.3-32 32V432c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16H192c17.7 0 32-14.3 32-32s-14.3-32-32-32H80z"/></svg>--%>
                                <%--                                        </a>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftPcy">--%>
                                <%--                                        <div class="pcyTit">프로젝트 정책</div>--%>
                                <%--                                        <div class="pcyCont">--%>
                                <%--                                            - 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.<br>- 예상 전달일로부터 14일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다. (플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )<br>- 선물 전달을 위한 배송지 및 서베이 답변은 2024년 3월 5일에 일괄 취합할 예정입니다.<br>- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.<br>배송이 필요한 선물<br>- 파손 또는 불량품 수령 시 7일 이내로 교환이 가능합니다.<br>- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.<br>- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.<br>- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우 창작자는 최대 1번까지 재발송 해 드립니다. 배송비 부담은 후원자에게 있습니다<br>예상되는 어려움<br>펀딩 진행 및 선물 전달 과정에서 발생 가능한 문제가 있다면 후원자에게 명확하게 알려주세요. 대응 계획을 함께 적는다면 후원자에게 신뢰를 줄 수 있습니다.--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDif">--%>
                                <%--                                        <div class="difTit">예상되는 어려움</div>--%>
                                <%--                                        <div class="difCont">--%>
                                <%--                                            ${pj.gift_ship_due_date}<!--2024년 3월 12일-->은 선물의 예상 전달 시작일입니다. 후원자분들에게 도착하는 날은 지역 또는 택배사의 사정에 따라 변동될 수 있으며, 이 날짜는 배송 시작일임을 고지합니다. 향수를 제조하는 과정에서 부자재 수급 혹은 예상치 못한 문제로 인해서 약간의 딜레이가 있을 수 있습니다. 천재지변 등 불가피한 이유로 지연이나 중단될 경우에는 사전에 커뮤니티를 통해 안내해드리고 양해를 구하겠습니다.--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="prdInfo">--%>
                                <%--                                        <div class="prdTit">--%>
                                <%--                                            상품정보 고시--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftReport">--%>
                                <%--                                        <button class="reportBtn" id="popReportBtn">--%>
                                <%--                                            <span>프로젝트 신고</span>--%>
                                <%--                                        </button>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="gftInfo">
                        <div class="crtInfo">
                            <div class="crtBox">
                                <div class="crtTit">창작자 소개</div>
                                <div class="crtGr">
                                    <div class="crtPrf">
                                        <a href="#" class="prfImg">
                                            <img src="${pj.pj_prof_image_url}" alt="">
                                            <%--                                            <img src="/static/img/seili.webp" alt="">--%>
                                        </a>
                                        <div class="crtIf">
                                            <div class="crtName">
                                                <a href="#">세이리 SEI LI</a>
                                            </div>
                                            <%--                                            <div class="lastLogin">--%>
                                            <%--                                                <span>마지막 로그인</span>--%>
                                            <%--                                                <b>1시간 전</b>--%>
                                            <%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="crtDesc">
                                    ${pj.pj_sel_short_intro}
                                    <%--                                    세이리는 듣고 읽고 발견한 모든 것과 예술과 여행에서 영감을 얻은--%>
                                    <%--                                    조향을 하며 마치 작품을 선물하듯 향이 지니는 고유의 그림이 새겨져--%>
                                    <%--                                    있습니다. 저희가 창작한 향기들이 아름다운 영혼과 문화, 예술, 삶의--%>
                                    <%--                                    방식을 나타내주며 나아가 당신을 새로운 곳으로 안내하길 꿈꿉니다.--%>
                                    <%--                                    기억을 불러일으키고 경험을 공유하며 감정을 전달하는 마법 같은 향의--%>
                                    <%--                                    여정을 함께하고 싶습니다.--%>
                                </div>
                                <div class="btnWrap">
                                    <button class="msg">
                                        <a id="chatBtn" target="_blank" style="cursor: pointer">
                                            <i class="fa-regular fa-envelope"></i>
                                            창작자 문의
                                        </a>
                                    </button>
                                </div>
                                <%--                                <div class="reviewInfo">--%>
                                <%--                                    <div class="revwBox">--%>
                                <%--                                        <a href="#">--%>
                                <%--                                            <div class="revwTit">--%>
                                <%--                                                이전 프로젝트 후기--%>
                                <%--                                                <span class="revwCount">492</span>--%>
                                <%--                                            </div>--%>
                                <%--                                            <i class="fa-solid fa-chevron-right"></i>--%>
                                <%--                                        </a>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="revwWrap">--%>
                                <%--                                        <span class="revwTag">--%>
                                <%--                                            <span>퀄리티가 좋아요</span>--%>
                                <%--                                            <strong>411</strong>--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="revwTag">--%>
                                <%--                                            <span>특별해요</span>--%>
                                <%--                                            <strong>337</strong>--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="revwTag">--%>
                                <%--                                            <span>즐거움을 줘요</span>--%>
                                <%--                                            <strong>308</strong>--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                        <div class="gftSlct">
                            <h3>선물 선택</h3>
                            <!-- <div class="gftslctGroup" style="display: none;">
                                <div class="gftslctTit">선물</div>
                                <div class="gftPrdt">
                                    <div class="prdtSlct" id="prdtSuppot">
                                        <div class="prdtBox">
                                            <div class="prdboxGrp">
                                                <div class="prdboxTit">선물 없이 후원하기</div>
                                                <div class="xBtnWrap">
                                                    <button class="b-close btnSlct">닫기</button>
                                                </div>
                                            </div>
                                            <div class="prdDtail flEnd">
                                                <div class="prdDtlst">
                                                    <div class="prdVal">
                                                        <span id="formattedPrice">29800</span>원
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="prdPlus">
                                        <div class="plusSup">
                                            <div class="supTit">
                                                추가 후원금<span>(선택)</span>
                                            </div>
                                        </div>
                                        <div class="supIpt">
                                            <input type="number" id="valueIpt" min="1" max="10000000">
                                            <button></button>
                                        </div>
                                        <div class="supDt">
                                            *추가 후원금으로 프로젝트를 응원해주세요.
                                        </div>
                                    </div>
                                    <div class="twinBtnwrap">
                                        <button class="gftAddbtn">선물 추가하기</button>
                                        <button class="gftCalcbtn">
                                            총&nbsp;<b><span id="calcTotal"></span>원</b>&nbsp;후원하기
                                        </button>
                                    </div>
                                </div>
                            </div> -->
                            <div class="gftslctGroup">
                                <div class="gftslctTit">선물</div>
                                <div class="gftPrdt">
                                    <div class="prdtSlct" id="prdtPayment">
                                        <div class="prdtBox">
                                            <div class="prdboxGrp">
                                                <div class="prdboxTit">[텀블벅 혜택]블로썸 퍼퓸 1개/26% 할인가/배송비포함~</div>
                                                <div class="xBtnWrap">
                                                    <button class="b-close btnSlct">닫기</button>
                                                </div>
                                            </div>
                                            <div class="prdDtail">
                                                <ul class="prdList">
                                                    <li>블로썸 오드퍼퓸(50ML)(x1)</li>
                                                    <li>세이리 미니퍼퓸(3ML)(x1)</li>
                                                    <li>일러스트 엽서(x1)</li>
                                                </ul>
                                                <div class="prdDtlst">
                                                    <div class="prdCount">
                                                        <button id="decrBtn">
                                                            -
                                                        </button>
                                                        <input readonly type="number" id="numIpt" value="1">
                                                        <button id="incrBtn">
                                                            +
                                                        </button>
                                                    </div>
                                                    <div class="prdVal">
                                                        <span id="formattedPrice">29800</span>원
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="prdPlus">
                                        <div class="plusSup">
                                            <div class="supTit">
                                                추가 후원금<span>(선택)</span>
                                            </div>
                                        </div>
                                        <div class="supIpt">
                                            <input type="number" id="valueIpt" min="1" max="10000000">
                                            <button></button>
                                        </div>
                                        <div class="supDt">
                                            *추가 후원금으로 프로젝트를 응원해주세요.
                                        </div>
                                    </div>
                                    <div class="twinBtnwrap">
                                        <button class="gftAddbtn">선물 추가하기</button>
                                        <button class="gftCalcbtn">
                                            총&nbsp;<b><span id="calcTotal"></span>원</b>&nbsp;후원하기
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="gftBox">
                                <div class="gftEl" id="gftnotFnd">
                                    <div class="gftVal"><!--1000-->
                                        1000원 +
                                    </div>
                                    <div class="gftDesc">
                                        선물 없이 후원하기
                                    </div>
                                </div>
                                <c:forEach var="giftDto" items="${giftServe}">
                                    <div class="gftEl">
                                        <div class="spnLine">
                                        <span class="slctGft"><!--2-->
                                            <i class="fa-solid fa-check"></i>
                                            ${giftDto.gift_sold_qty}개 선택
                                        </span>
                                            <span class="slctRmn"><!--28-->
                                            ${giftDto.gift_curr_qty}개 남음
                                        </span>
                                        </div>
                                        <div class="gftVal"><!--29800-->
                                                ${giftDto.gift_money}원 +
                                        </div>
                                        <div class="gftDesc"><!--[텀블벅 혜택] 블로썸 퍼퓸 1개 / 26% 할인가 / 배송비포함-->
                                                ${giftDto.gift_name}
                                        </div>
                                        <c:forEach var="giftForm" items="${gf}">
                                            <ul>
                                                <li>
                                                    <span>${giftForm.item_name}</span><!--블로썸 오드퍼퓸(50ML)-->
                                                    <span>${giftForm.item_qty}</span><!--(x1)-->
                                                </li>
                                                <li>
                                                    <span>${giftForm.item_name}</span><!--세이리 미니퍼퓸(3ML)-->
                                                    <span>${giftForm.item_qty}</span><!--(x1)-->
                                                </li>
                                                <li>
                                                    <span>${giftForm.item_name}</span><!--일러스트 엽서-->
                                                    <span>${giftForm.item_qty}</span><!--(x1)-->
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                                <%--                                <div class="gftEl">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                            <span class="slctGft"><!--5-->--%>
                                <%--                                                <i class="fa-solid fa-check"></i>--%>
                                <%--                                                ${gift_sold_qty}개 선택--%>
                                <%--                                            </span>--%>
                                <%--                                        <span class="slctRmn"><!--15-->--%>
                                <%--                                                ${gift_curr_qty}개 남음--%>
                                <%--                                            </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--51100-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[얼리버드] 블로썸 퍼퓸 + 디퓨저 듀오 / 30% 할인가 / 배송비포함-->--%>
                                <%--                                        ${gift_name}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 퍼퓸디퓨저(120ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="gftEl">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                        <span class="slctGft"><!--10-->--%>
                                <%--                                            <i class="fa-solid fa-check"></i>--%>
                                <%--                                            ${gift_sold_qty}개 선택--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="slctRmn"><!--10-->--%>
                                <%--                                            ${gift_curr_qty}개 남음--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--65,700-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[얼리버드] 블로썸 퍼퓸 더블구성 / 33% 할인가 / 배송비포함-->--%>
                                <%--                                        ${gift_name}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="gftEl">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                        <span class="slctGft"><!--11-->--%>
                                <%--                                            <i class="fa-solid fa-check"></i>--%>
                                <%--                                            ${gift_sold_qty}개 선택--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="slctRmn"><!--4-->--%>
                                <%--                                            ${gift_sold_qty}개 남음--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--95,500-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[얼리버드] 퍼퓸 3개 구성 / 35% 할인가 / 배송비포함-->--%>
                                <%--                                        ${gift_money}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>--%>
                                <%--                                            <span>택(x2)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x3)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x3)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="gftEl">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                        <span class="slctGft"><!--8-->--%>
                                <%--                                            <i class="fa-solid fa-check"></i>--%>
                                <%--                                            ${gift_sold_qty}개 선택--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="slctRmn"><!--2-->--%>
                                <%--                                            ${gift_curr_qty}개 남음--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--149,500-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[세이리 매니아] 퍼퓸 5개 구성 / 39% 할인가 + 디퓨저 선물증정 / 배송비포함-->--%>
                                <%--                                        ${gift_name}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>--%>
                                <%--                                            <span>택(x4)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 퍼퓸디퓨저(120ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x5)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x5)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="gftEl soldOut">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                        <span class="slctGft"><!--100-->--%>
                                <%--                                            <i class="fa-solid fa-check"></i>--%>
                                <%--                                            ${gift_sold_qty}개 선택--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="slctRmn"><!--0개라서 마감이라는 글자로 변경해주어야 함-->--%>
                                <%--                                            ${gift_curr_qty}--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--34,500-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[얼리버드] 블로썸 퍼퓸 1개 / 30% 할인가 / 배송비포함-->--%>
                                <%--                                        ${gift_name}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="gftEl soldOut">--%>
                                <%--                                    <div class="spnLine">--%>
                                <%--                                        <span class="slctGft"><!--50-->--%>
                                <%--                                            <i class="fa-solid fa-check"></i>--%>
                                <%--                                            ${gift_sold_qty}개 선택--%>
                                <%--                                        </span>--%>
                                <%--                                        <span class="slctRmn"><!--0개라서 마감이라는 글자로 변경해주어야 함-->--%>
                                <%--                                            ${gift_curr_qty}--%>
                                <%--                                        </span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftVal"><!--35,500-->--%>
                                <%--                                        ${gift_money}원 +--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="gftDesc"><!--[얼리버드 2차] 블로썸 퍼퓸 1개 / 28% 할인가 / 배송비포함-->--%>
                                <%--                                        ${gift_name}--%>
                                <%--                                    </div>--%>
                                <%--                                    <ul>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>블로썸 오드퍼퓸(50ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>세이리 미니퍼퓸(3ML)</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <span>일러스트 엽서</span>--%>
                                <%--                                            <span>(x1)</span>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cont">
                <div class="tabMenu">
                    <div class="tabCont">
                        <div class="cont on">
                            <div class="tabFlx">
                                <div class="cardRow">
                                    <div class="commuRead">
                                        <div class="commuNtc">
                                            <div class="crtUpdimg">
                                                <i class="fa-solid fa-thumbtack fa-xs" style="color: #eb4e38;"></i>
                                                <span class="crtUpd">창작자 업데이트</span>
                                            </div>
                                            <div class="commuBox">
                                                <div class="crtGr commuBoard">
                                                    <div class="crtPrf">
                                                        <a href="#" class="prfImg">
                                                            <img src="/static/img/seili.webp" alt="">
                                                        </a>
                                                        <div class="crtIf">
                                                            <div class="crtName">
                                                                <a href="#">세이리 SEI LI</a>
                                                            </div>
                                                            <div class="crtGrade">
                                                                <i class="fa-solid fa-star fa-xs"
                                                                   style="color: #f86453;"></i>
                                                                <span class="crtGrname">창작자</span>
                                                                <span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="commuCrtwrt">
                                                    <p>
                                                        <img src="/static/img/uptImg.webp" alt="">
                                                    </p>
                                                    <p>&nbsp;</p>
                                                    <p>안녕하세요. 세이리입니다.&nbsp;</p>
                                                    <p>&nbsp;</p>
                                                    <p>라일락 생화를 담은 "블로썸" 오 드 퍼퓸의 텀블벅 런칭을 앞두고</p>
                                                    <p>펀딩 전, 시향을 해보고 싶다는 분들이 많으셨어요!</p>
                                                    <p>세이리는 기존에도 <u><strong>시향지키트</strong></u>를 선보이고 있는데요,</p>
                                                    <p><u><strong>블로썸까지 포함하여 서비스</strong></u>를 해드리기로 하였습니다.</p>
                                                    <p>&nbsp;</p>
                                                    <p>시향지의 특성상 향의 첫 노트, 즉 탑노트까지 온전히 전해드릴 수는 없으나</p>
                                                    <p>향의 전반적인 뉘앙스를 경험하시는 데 도움이 되시리라 생각합니다 ☺️</p>
                                                    <p>&nbsp;</p>
                                                    <p><strong>세이리 시향지는</strong></p>
                                                    <p><strong>2~3회에 걸쳐 적시고 말리는 작업을 반복, 정성껏 작업하여 향이 오랜 시간 지속</strong>됩니다.
                                                    </p>
                                                    <p>개별 OPP 비닐에 담아 향이 섞이지 않으며</p>
                                                    <p>윗부분 접착이 없는 봉투라 살짝 열어 시향 하시면 됩니다.</p>
                                                    <p>&nbsp;</p>
                                                    <p>시향지 세트의 가격은 100원이며, 배송비 3,000원이 추가됩니다.</p>
                                                    <p>펀딩 시작 전까지의 금액이며 추후 100원-&gt;1,000원으로 시향지 세트의 가격은 인상됩니다.</p>
                                                    <p>&nbsp;</p>
                                                    <p>&nbsp;</p>
                                                    <p><u>✔️ <strong>세이리 시향 키트 포함 향기</strong></u></p>
                                                    <p><strong>누드 / 샘 / 오스만투스 / 그린모스 / 세이렌 / 새벽정원 / 폴인그라스 / 블랑 /
                                                        **블로썸</strong></p>
                                                    <p>&nbsp;</p>
                                                    <p>세이리 예쁜 일러스트 엽서도 동봉해드립니다.</p>
                                                    <p>공홈이나, 세이리 공식 스마트스토어에서 구매 가능하십니다!&nbsp;</p>
                                                    <p>세이리를 향한 응원과 관심에 늘 감사드립니다 ☺️</p>
                                                    <p>&nbsp;</p>
                                                    <p>&nbsp;</p>
                                                    <h2><strong>📍 시향지 구매 링크&nbsp;</strong></h2>
                                                    <h2>
                                                        <strong>1)
                                                            <a href="https://www.sei-li.com/product/%EC%84%B8%EC%9D%B4%EB%A6%AC-%EC%8B%9C%ED%96%A5%EC%B9%B4%EB%93%9C-%ED%82%A4%ED%8A%B8/230/category/63/display/1/"
                                                               target="_blank" rel="noopener noreferrer">세이리 공홈 바로가기</a>
                                                        </strong>
                                                    </h2>
                                                    <h2>
                                                        <strong>2)
                                                            <a href="https://smartstore.naver.com/seili/products/9565480917"
                                                               target="_blank" rel="noopener noreferrer">세이리 네이버스마트스토어
                                                                바로가기</a>
                                                        </strong>
                                                    </h2>
                                                    <h2>&nbsp;</h2>
                                                </div>
                                                <div class="commuBlur"></div>
                                                <div class="moreView">
                                                    <button class="moreBtn">
                                                        <i class="fa-solid fa-chevron-down"></i>
                                                        <div class="moreTxt">더보기</div>
                                                    </button>
                                                </div>
                                                <div class="wrtInfo">
                                                    <div class="crtDate">
                                                        <span class="wrtDate">2024.01.31</span>
                                                        <span class="wrtStt">수정됨</span>
                                                    </div>
                                                    <div class="crtRepl">
                                                        <button class="crtCmmt">
                                                            댓글&nbsp;<span>2</span>개
                                                        </button>
                                                        <div class="crtLike">
                                                            <i class="fa-regular fa-thumbs-up"
                                                               style="color: #9e9e9e;"></i>
                                                            <span>3</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wrtRepl">
                                                    <div class="replCnt">
                                                        댓글
                                                        <strong>0</strong>
                                                    </div>
                                                    <div class="imgGroup">
                                                        <button>
                                                            <i class="fa-solid fa-comment fa-lg"
                                                               style="color : #6d6d6d;"></i>
                                                        </button>
                                                        <button>
                                                            <i class="fa-brands fa-twitter fa-lg"
                                                               style="color: #6d6d6d;"></i>
                                                        </button>
                                                        <button>
                                                            <i class="fa-brands fa-facebook fa-lg"
                                                               style="color: #6d6d6d;"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="replyPlc">
                                                    <div class="replTxt">댓글이 없습니다.</div>
                                                </div>
                                                <div class="replyIptbox">
                                                    <div class="userProf"></div>
                                                    <div class="replyIpt">
                                                        <form action="">
                                                            <input type="text" class="replyMessage"
                                                                   placeholder="댓글을 작성해주세요.">
                                                        </form>
                                                    </div>
                                                    <button class="msgsdBtn">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem"><!--업데이트 작가 공지사항-->
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/seili.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">세이리 SEI LI</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="crtJob">창작자</span>
                                                    <span class="crtLmt">후원자 공개</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="crtWrt">
                                            <div class="crtWdt">
                                                <img class="lockImg" src="/static/img/lock.png" alt="자물쇠">
                                                <p class="lockWrt">후원자만 볼 수 있는 글입니다.</p>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/seili.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">세이리 SEI LI</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="crtJob">창작자</span>
                                                    <span class="crtLmt">후원자 공개</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="crtWrt">
                                            <div class="crtWdt">
                                                <img class="lockImg" src="/static/img/lock.png" alt="자물쇠">
                                                <p class="lockWrt">후원자만 볼 수 있는 글입니다.</p>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/seili.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">세이리 SEI LI</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="crtJob">창작자</span>
                                                    <span class="crtLmt">후원자 공개</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="crtWrt">
                                            <div class="crtWdt">
                                                <img class="lockImg" src="/static/img/lock.png" alt="자물쇠">
                                                <p class="lockWrt">후원자만 볼 수 있는 글입니다.</p>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/seili.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">세이리 SEI LI</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="crtJob">창작자</span>
                                                    <span class="crtLmt">후원자 공개</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="crtWrt">
                                            <div class="crtWdt">
                                                <img class="lockImg" src="/static/img/lock.png" alt="자물쇠">
                                                <p class="lockWrt">후원자만 볼 수 있는 글입니다.</p>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gftInfo">
                                    <div class="crtInfo">
                                        <div class="crtBox">
                                            <div class="crtTit">창작자 소개</div>
                                            <div class="crtGr">
                                                <div class="crtPrf">
                                                    <a href="#" class="prfImg">
                                                        <img src="/static/img/seili.webp" alt="">
                                                    </a>
                                                    <div class="crtIf">
                                                        <div class="crtName">
                                                            <a href="#">세이리 SEI LI</a>
                                                        </div>
                                                        <div class="lastLogin">
                                                            <span>마지막 로그인</span>
                                                            <b>1시간 전</b>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="crtDesc">
                                                세이리는 듣고 읽고 발견한 모든 것과 예술과 여행에서 영감을 얻은
                                                조향을 하며 마치 작품을 선물하듯 향이 지니는 고유의 그림이 새겨져
                                                있습니다. 저희가 창작한 향기들이 아름다운 영혼과 문화, 예술, 삶의
                                                방식을 나타내주며 나아가 당신을 새로운 곳으로 안내하길 꿈꿉니다.
                                                기억을 불러일으키고 경험을 공유하며 감정을 전달하는 마법 같은 향의
                                                여정을 함께하고 싶습니다.
                                            </div>
                                            <div class="btnWrap">
                                                <button class="msg">
                                                    <a href="#" target="_blank">
                                                        <i class="fa-regular fa-envelope"></i>
                                                        창작자 문의
                                                    </a>
                                                </button>
                                            </div>
                                            <div class="reviewInfo">
                                                <div class="revwBox">
                                                    <a href="#">
                                                        <div class="revwTit">
                                                            이전 프로젝트 후기
                                                            <span class="revwCount">492</span>
                                                        </div>
                                                        <i class="fa-solid fa-chevron-right"></i>
                                                    </a>
                                                </div>
                                                <div class="revwWrap">
                                                    <span class="revwTag">
                                                        <span>퀄리티가 좋아요</span>
                                                        <strong>411</strong>
                                                    </span>
                                                    <span class="revwTag">
                                                        <span>특별해요</span>
                                                        <strong>337</strong>
                                                    </span>
                                                    <span class="revwTag">
                                                        <span>즐거움을 줘요</span>
                                                        <strong>308</strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftSlct">
                                        <h3>선물 선택</h3>
                                        <%--                                        <div class="gftslctGroup">--%>
                                        <%--                                            <div class="gftslctTit">선물</div>--%>
                                        <%--                                            <div class="gftPrdt">--%>
                                        <%--                                                <div class="prdtSlct">--%>
                                        <%--                                                    <div class="prdtBox">--%>
                                        <%--                                                        <div class="prdboxGrp">--%>
                                        <%--                                                            <div class="prdboxTit">[텀블벅 혜택]블로썸 퍼퓸 1개/26% 할인가/배송비포함</div>--%>
                                        <%--                                                            <div class="xBtnWrap">--%>
                                        <%--                                                                <button class="b-close btnSlct">닫기</button>--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="prdDtail">--%>
                                        <%--                                                            <ul class="prdList">--%>
                                        <%--                                                                <li>블로썸 오드퍼퓸(50ML)(x1)</li>--%>
                                        <%--                                                                <li>세이리 미니퍼퓸(3ML)(x1)</li>--%>
                                        <%--                                                                <li>일러스트 엽서(x1)</li>--%>
                                        <%--                                                            </ul>--%>
                                        <%--                                                            <div class="prdDtlst">--%>
                                        <%--                                                                <div class="prdCount">--%>
                                        <%--                                                                    <button id="decrBtn">--%>
                                        <%--                                                                        ---%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                    <input readonly type="number" id="numIpt" value="1" disabled>--%>
                                        <%--                                                                    <button id="incrBtn">--%>
                                        <%--                                                                        +--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="prdVal">--%>
                                        <%--                                                                    <span id="formattedPrice">29800</span>원--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                                <div class="prdPlus">--%>
                                        <%--                                                    <div class="plusSup">--%>
                                        <%--                                                        <div class="supTit">--%>
                                        <%--                                                            추가 후원금<span>(선택)</span>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="supIpt">--%>
                                        <%--                                                        <input type="number" id="valueIpt" min="1" max="10000000">--%>
                                        <%--                                                        <button></button>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="supDt">--%>
                                        <%--                                                        *추가 후원금으로 프로젝트를 응원해주세요.--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                                <div class="twinBtnwrap">--%>
                                        <%--                                                    <button class="gftAddbtn">선물 추가하기</button>--%>
                                        <%--                                                    <button class="gftCalcbtn">--%>
                                        <%--                                                        총&nbsp;<b><span id="calcTotal"></span>원</b>&nbsp;후원하기--%>
                                        <%--                                                    </button>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <div class="gftBox">
                                            <div class="gftEl">
                                                <div class="gftVal">
                                                    1,000원 +
                                                </div>
                                                <div class="gftDesc">
                                                    선물 없이 후원하기
                                                </div>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i><!--2개-->
                                                        2개 선택
                                                    </span>
                                                    <span class="slctRmn"><!--28개-->
                                                        28개 남음
                                                    </span>
                                                </div>
                                                <div class="gftVal"><!--29,800원-->
                                                    29800원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [텀블벅 혜택] 블로썸 퍼퓸 1개 / 26% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i><!--15개-->
                                                        15개 선택
                                                    </span>
                                                    <span class="slctRmn">
                                                        5개 남음
                                                    </span>
                                                </div>
                                                <div class="gftVal"><!--51,100원-->
                                                    51100원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 + 디퓨저 듀오 / 30% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i>
                                                        10개 선택
                                                    </span>
                                                    <span class="slctRmn">
                                                        10개 남음
                                                    </span>
                                                </div>
                                                <div class="gftVal">
                                                    65,700원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 더블구성 / 33% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            11개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            4개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    95,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 퍼퓸 3개 구성 / 35% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                        <span>택(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x3)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x3)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i>
                                                        8개 선택
                                                    </span>
                                                    <span class="slctRmn">
                                                        2개 남음
                                                    </span>
                                                </div>
                                                <div class="gftVal">
                                                    149,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [세이리 매니아] 퍼퓸 5개 구성 / 39% 할인가 + 디퓨저 선물증정 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                        <span>택(x4)</span>
                                                    </li>
                                                    <li>
                                                        <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x5)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x5)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl soldOut">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i>
                                                        100개 선택
                                                    </span>
                                                    <span class="slctRmn">
                                                        선착순 마감
                                                    </span>
                                                </div>
                                                <div class="gftVal">
                                                    34,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 1개 / 30% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl soldOut">
                                                <div class="spnLine">
                                                    <span class="slctGft">
                                                        <i class="fa-solid fa-check"></i>
                                                        50개 선택
                                                    </span>
                                                    <span class="slctRmn">
                                                        선착순 마감
                                                    </span>
                                                </div>
                                                <div class="gftVal">
                                                    35,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드 2차] 블로썸 퍼퓸 1개 / 28% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cont">
                <div class="tabCont">
                    <div class="cont on">
                        <div class="tabConWrap">
                            <div class="tabFlx coMmu">
                                <div class="commuCmt" style="display: none;"><!--커뮤니티 글 작성 클릭 시 작성되는 화면-->
                                    <div class="cmtTit">
                                        <button class="cmtBtn">
                                            <i class="fa-solid fa-arrow-left"></i>
                                            게시글 작성
                                        </button>
                                        <button class="cmtaplBtn">등록</button>
                                    </div>
                                    <div class="cmtCont">
                                        <div>
                                            <div class="cmtTxtarea">
                                                <div class="cmtInner">
                                                    <textarea maxlength="1000"></textarea>
                                                </div>
                                            </div>
                                            <div class="cmtStatus">
                                                <p class="cmtMaxleng">
                                                    10자 이상 1000자 이내로 입력해주세요.
                                                </p>
                                                <span class="cmtMaxnum">1/1000</span>
                                            </div>
                                        </div>
                                        <div class="cateTab">
                                            <div class="cateTabbox">
                                                <div class="cateTtit">어떤 내용의 글인가요?</div>
                                                <div class="tabMenu">
                                                    <div class="tabBtn">
                                                        <button class="btn on">응원글</button>
                                                        <button class="btn">의견</button>
                                                    </div>
                                                </div>
                                                <div class="tabCont">
                                                    <div class="cont on">
                                                        <div class="infoComment">
                                                            후원하신 프로젝트 창작자에게 응원의 한마디를 남겨주세요. 창작자에게 후원금만큼 큰 힘이 됩니다.
                                                        </div>
                                                        <div class="infoCombox">
                                                            <div class="infoComtit">
                                                                <i class="fa-solid fa-circle-info"></i>
                                                                <div>유의사항</div>
                                                            </div>
                                                            <ul class="infoComlst">
                                                                <li>창작자에게 궁금하신 점이 있다면 ‘창작자에게 문의'로 질문해주세요.</li>
                                                                <li>텀블벅 <a>커뮤니티 운영원칙</a>을 준수해주세요. 프로젝트와 무관한 내용이나 광고, 도배,
                                                                    욕설, 혐오 조장, 외설, 사칭 등은 예고 없이 삭제될 수 있습니다.
                                                                </li>
                                                                <li>운영원칙 위반 누적시 텀블벅 이용이 제한될 수 있으며, 타인에 대한 모욕이나 명예훼손 등의
                                                                    경우 법적 책임이 발생할 수도 있습니다.
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="cont">
                                                        <div class="infoComment">
                                                            후원하신 프로젝트에 대한 후원자님의 의견을 남길 수 있습니다. 프로젝트를 진행하는 창작자를 존중하는 마음으로
                                                            신중하게 작성해주세요.
                                                        </div>
                                                        <div class="infoCombox">
                                                            <div class="infoComtit">
                                                                <i class="fa-solid fa-circle-info"></i>
                                                                <div>유의사항</div>
                                                            </div>
                                                            <ul class="infoComlst">
                                                                <li>창작자에게 궁금하신 점이 있다면 ‘창작자에게 문의'로 질문해주세요.</li>
                                                                <li>텀블벅 <a>커뮤니티 운영원칙</a>을 준수해주세요. 프로젝트와 무관한 내용이나 광고, 도배,
                                                                    욕설, 혐오 조장, 외설, 사칭 등은 예고 없이 삭제될 수 있습니다.
                                                                </li>
                                                                <li>운영원칙 위반 누적시 텀블벅 이용이 제한될 수 있으며, 타인에 대한 모욕이나 명예훼손 등의
                                                                    경우 법적 책임이 발생할 수도 있습니다.
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="commuGroup">
                                    <div class="gftCommu"><!--커뮤니티 글 작성-->
                                        <div class="">
                                            <!-- <a href="">
                                                <div class="commuIpt">
                                                    <div class="commuWrt">
                                                        창작자에게 응원의 한 마디!
                                                    </div>
                                                    <div class="commuIco">
                                                        <i class="fa-solid fa-pen fa-lg" style="color: #9e9e9e;"></i>
                                                    </div>
                                                </div>
                                            </a> -->

                                            <div class="commuIpt" id="iptTowrite">
                                                <div class="commuWrt">
                                                    창작자에게 응원의 한 마디!
                                                </div>
                                                <div class="commuIco">
                                                    <i class="fa-solid fa-pen fa-lg" style="color: #9e9e9e;"></i>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/avatar.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">홍길동</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="userStt">응원글</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="guestWrt">
                                            <div class="guestFont">
                                                <div class="guestTxt">
                                                    세이리 향수는 친구가 워터페어 펀딩에 참여해서 선물해준 이후로 늘 잘 쓰고 있습니다!
                                                    오스만투스 써보고 향기 때문에 기분이 좋아진다는 게 뭔지 처음 느낄 수 있었어요.
                                                    대학생 때 캠퍼스의 등나무꽃 향기를 참 좋아했었는데, 비슷한 계열인 라일락 향수라고 해서 이번 신작이 더더욱 기대됩니다.
                                                    앤티크하면서도 섬세한 분위기의 일러스트로 더욱 아름다운 병 디자인도 세이리의 큰 매력 포인트라고 생각해요.
                                                    봄을 기다리는 두근거림으로 &lt;블로썸&gt;을 만나볼 날을 기대하고 있겠습니다!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/avatar.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">김가네</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="userStt">응원글</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="guestWrt">
                                            <div class="guestFont">
                                                <div class="guestTxt">
                                                    오스만투스때 후원을 해서 샘플을 받아보았는데 향이 너무 좋더라구요
                                                    그래서 이번에도 후원하게 되었습니다!! 첫향은 생화향 수분 가득한 향이
                                                    나고 조금 지나면 라일락향이 포근하게 그리고 따뜻함까지 느껴지더라고요
                                                    전체적으로 깨끗한 향이 나서 계속 맡고 싶어지는 향이었습니다!!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/avatar.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">김가네</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="userStt">응원글</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="guestWrt">
                                            <div class="guestFont">
                                                <div class="guestTxt">
                                                    오스만투스때 후원을 해서 샘플을 받아보았는데 향이 너무 좋더라구요
                                                    그래서 이번에도 후원하게 되었습니다!! 첫향은 생화향 수분 가득한 향이
                                                    나고 조금 지나면 라일락향이 포근하게 그리고 따뜻함까지 느껴지더라고요
                                                    전체적으로 깨끗한 향이 나서 계속 맡고 싶어지는 향이었습니다!!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/avatar.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">김가네</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="userStt">응원글</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="guestWrt">
                                            <div class="guestFont">
                                                <div class="guestTxt">
                                                    오스만투스때 후원을 해서 샘플을 받아보았는데 향이 너무 좋더라구요
                                                    그래서 이번에도 후원하게 되었습니다!! 첫향은 생화향 수분 가득한 향이
                                                    나고 조금 지나면 라일락향이 포근하게 그리고 따뜻함까지 느껴지더라고요
                                                    전체적으로 깨끗한 향이 나서 계속 맡고 싶어지는 향이었습니다!!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cardItem">
                                        <div class="crtPrf">
                                            <a href="#" class="prfImg">
                                                <img src="/static/img/avatar.webp" alt="">
                                            </a>
                                            <div class="crtIf">
                                                <div class="crtName">
                                                    <a href="#">김가네</a>
                                                </div>
                                                <div class="crtStatus">
                                                    <span class="userStt">응원글</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="guestWrt">
                                            <div class="guestFont">
                                                <div class="guestTxt">
                                                    오스만투스때 후원을 해서 샘플을 받아보았는데 향이 너무 좋더라구요
                                                    그래서 이번에도 후원하게 되었습니다!! 첫향은 생화향 수분 가득한 향이
                                                    나고 조금 지나면 라일락향이 포근하게 그리고 따뜻함까지 느껴지더라고요
                                                    전체적으로 깨끗한 향이 나서 계속 맡고 싶어지는 향이었습니다!!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wrtInfo">
                                            <div class="crtDate">
                                                <span class="wrtDate">2024.01.31</span>
                                                <span class="wrtStt">수정됨</span>
                                            </div>
                                            <div class="crtRepl">
                                                <button class="crtCmmt">
                                                    댓글&nbsp;<span>2</span>개
                                                </button>
                                                <div class="crtLike">
                                                    <i class="fa-regular fa-thumbs-up" style="color: #9e9e9e;"></i>
                                                    <span>3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gftInfo">
                                    <div class="crtInfo">
                                        <div class="crtBox">
                                            <div class="crtTit">창작자 소개</div>
                                            <div class="crtGr">
                                                <div class="crtPrf">
                                                    <a href="#" class="prfImg">
                                                        <img src="/static/img/seili.webp" alt="">
                                                    </a>
                                                    <div class="crtIf">
                                                        <div class="crtName">
                                                            <a href="#">세이리 SEI LI</a>
                                                        </div>
                                                        <div class="lastLogin">
                                                            <span>마지막 로그인</span>
                                                            <b>1시간 전</b>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="crtDesc">
                                                세이리는 듣고 읽고 발견한 모든 것과 예술과 여행에서 영감을 얻은
                                                조향을 하며 마치 작품을 선물하듯 향이 지니는 고유의 그림이 새겨져
                                                있습니다. 저희가 창작한 향기들이 아름다운 영혼과 문화, 예술, 삶의
                                                방식을 나타내주며 나아가 당신을 새로운 곳으로 안내하길 꿈꿉니다.
                                                기억을 불러일으키고 경험을 공유하며 감정을 전달하는 마법 같은 향의
                                                여정을 함께하고 싶습니다.
                                            </div>
                                            <div class="btnWrap">
                                                <button class="msg">
                                                    <a href="#" target="_blank">
                                                        <i class="fa-regular fa-envelope"></i>
                                                        창작자 문의
                                                    </a>
                                                </button>
                                            </div>
                                            <div class="reviewInfo">
                                                <div class="revwBox">
                                                    <a href="#">
                                                        <div class="revwTit">
                                                            이전 프로젝트 후기
                                                            <span class="revwCount">492</span>
                                                        </div>
                                                        <i class="fa-solid fa-chevron-right"></i>
                                                    </a>
                                                </div>
                                                <div class="revwWrap">
                                                    <span class="revwTag">
                                                        <span>퀄리티가 좋아요</span>
                                                        <strong>411</strong>
                                                    </span>
                                                    <span class="revwTag">
                                                        <span>특별해요</span>
                                                        <strong>337</strong>
                                                    </span>
                                                    <span class="revwTag">
                                                        <span>즐거움을 줘요</span>
                                                        <strong>308</strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftSlct">
                                        <h3>선물 선택</h3>
                                        <div class="gftslctGroup">
                                            <div class="gftslctTit">선물</div>
                                            <div class="gftPrdt">
                                                <div class="prdtSlct">
                                                    <div class="prdtBox">
                                                        <div class="prdboxGrp">
                                                            <div class="prdboxTit">[텀블벅 혜택]블로썸 퍼퓸 1개/26% 할인가/배송비포함</div>
                                                            <div class="xBtnWrap">
                                                                <button class="b-close btnSlct">닫기</button>
                                                            </div>
                                                        </div>
                                                        <div class="prdDtail">
                                                            <ul class="prdList">
                                                                <li>블로썸 오드퍼퓸(50ML)(x1)</li>
                                                                <li>세이리 미니퍼퓸(3ML)(x1)</li>
                                                                <li>일러스트 엽서(x1)</li>
                                                            </ul>
                                                            <div class="prdDtlst">
                                                                <div class="prdCount">
                                                                    <button>
                                                                        -
                                                                    </button>
                                                                    <input readonly type="number" value="1" disabled>
                                                                    <button>
                                                                        +
                                                                    </button>
                                                                </div>
                                                                <div class="prdVal">
                                                                    <span>29800</span>원
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="prdPlus">
                                                    <div class="plusSup">
                                                        <div class="supTit">
                                                            추가 후원금<span>(선택)</span>
                                                        </div>
                                                    </div>
                                                    <div class="supIpt">
                                                        <input type="number" min="1" max="10000000">
                                                        <button></button>
                                                    </div>
                                                    <div class="supDt">
                                                        *추가 후원금으로 프로젝트를 응원해주세요.
                                                    </div>
                                                </div>
                                                <div class="twinBtnwrap">
                                                    <button class="gftAddbtn">선물 추가하기</button>
                                                    <button class="gftCalcbtn">
                                                        총&nbsp;<b><span></span>원</b>&nbsp;후원하기
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gftBox">
                                            <div class="gftEl">
                                                <div class="gftVal">
                                                    1,000원 +
                                                </div>
                                                <div class="gftDesc">
                                                    선물 없이 후원하기
                                                </div>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            2개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            28개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    29,800원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [텀블벅 혜택] 블로썸 퍼퓸 1개 / 26% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            15개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            5개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    51,100원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 + 디퓨저 듀오 / 30% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            10개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            10개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    65,700원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 더블구성 / 33% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x2)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            11개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            4개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    95,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 퍼퓸 3개 구성 / 35% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                        <span>택(x2)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x3)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x3)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            8개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            2개 남음
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    149,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [세이리 매니아] 퍼퓸 5개 구성 / 39% 할인가 + 디퓨저 선물증정 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                        <span>택(x4)</span>
                                                    </li>
                                                    <li>
                                                        <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x5)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x5)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl soldOut">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            100개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            선착순 마감
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    34,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드] 블로썸 퍼퓸 1개 / 30% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="gftEl soldOut">
                                                <div class="spnLine">
                                                        <span class="slctGft">
                                                            <i class="fa-solid fa-check"></i>
                                                            50개 선택
                                                        </span>
                                                    <span class="slctRmn">
                                                            선착순 마감
                                                        </span>
                                                </div>
                                                <div class="gftVal">
                                                    35,500원 +
                                                </div>
                                                <div class="gftDesc">
                                                    [얼리버드 2차] 블로썸 퍼퓸 1개 / 28% 할인가 / 배송비포함
                                                </div>
                                                <ul>
                                                    <li>
                                                        <span>블로썸 오드퍼퓸(50ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>세이리 미니퍼퓸(3ML)</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                    <li>
                                                        <span>일러스트 엽서</span>
                                                        <span>(x1)</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cont">
                <div class="tabCont">
                    <div class="cont on">
                        <div class="tabFlx">
                            <div class="tabConWrap">
                                <div class="containTit">이 프로젝트들은 어떠신가요?</div>
                                <div class="recmdPrjt">
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban02.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">실용·취미</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">MINCHANG</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>101% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban03.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">액세서리</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Mirror in MIRROr</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1406% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban04.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 문구</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">글리팅(glitting)</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1422% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban02.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">실용·취미</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">MINCHANG</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>101% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban03.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">액세서리</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Mirror in MIRROr</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1406% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban04.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 문구</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">글리팅(glitting)</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1422% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban02.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">실용·취미</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">MINCHANG</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>101% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban03.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">액세서리</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Mirror in MIRROr</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1406% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban04.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 문구</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">글리팅(glitting)</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1422% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban02.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">실용·취미</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">MINCHANG</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>101% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban03.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">액세서리</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Mirror in MIRROr</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1406% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban04.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 문구</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">글리팅(glitting)</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1422% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban02.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">실용·취미</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">MINCHANG</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>101% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban03.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">액세서리</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Mirror in MIRROr</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1406% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban04.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 문구</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">글리팅(glitting)</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>1422% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban05.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">디자인 소품</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">아나레 ahnale</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>722% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBanBox">
                                        <div class="mnBan">
                                            <div class="banImg">
                                                <a href="#">
                                                    <img src="/static/img/mnban06.webp" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="banTxt">
                                            <div class="txtGr">
                                                <div class="subTxt">
                                                    <span>
                                                        <a href="#">가방</a>
                                                    </span>
                                                    <span class="bar">
                                                        <a href="#">Vao</a>
                                                    </span>
                                                </div>
                                                <div class="subTit">
                                                    <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                                                </div>
                                                <div class="pstTag">
                                                    <span>52% 달성</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="gftInfo">
                                <div class="crtInfo">
                                    <div class="crtBox">
                                        <div class="crtTit">창작자 소개</div>
                                        <div class="crtGr">
                                            <div class="crtPrf">
                                                <a href="#" class="prfImg">
                                                    <img src="/static/img/seili.webp" alt="">
                                                </a>
                                                <div class="crtIf">
                                                    <div class="crtName">
                                                        <a href="#">세이리 SEI LI</a>
                                                    </div>
                                                    <div class="lastLogin">
                                                        <span>마지막 로그인</span>
                                                        <b>1시간 전</b>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="crtDesc">
                                            세이리는 듣고 읽고 발견한 모든 것과 예술과 여행에서 영감을 얻은
                                            조향을 하며 마치 작품을 선물하듯 향이 지니는 고유의 그림이 새겨져
                                            있습니다. 저희가 창작한 향기들이 아름다운 영혼과 문화, 예술, 삶의
                                            방식을 나타내주며 나아가 당신을 새로운 곳으로 안내하길 꿈꿉니다.
                                            기억을 불러일으키고 경험을 공유하며 감정을 전달하는 마법 같은 향의
                                            여정을 함께하고 싶습니다.
                                        </div>
                                        <div class="btnWrap">
                                            <button class="msg">
                                                <a href="#" target="_blank">
                                                    <i class="fa-regular fa-envelope"></i>
                                                    창작자 문의
                                                </a>
                                            </button>
                                        </div>
                                        <div class="reviewInfo">
                                            <div class="revwBox">
                                                <a href="#">
                                                    <div class="revwTit">
                                                        이전 프로젝트 후기
                                                        <span class="revwCount">492</span>
                                                    </div>
                                                    <i class="fa-solid fa-chevron-right"></i>
                                                </a>
                                            </div>
                                            <div class="revwWrap">
                                                <span class="revwTag">
                                                    <span>퀄리티가 좋아요</span>
                                                    <strong>411</strong>
                                                </span>
                                                <span class="revwTag">
                                                    <span>특별해요</span>
                                                    <strong>337</strong>
                                                </span>
                                                <span class="revwTag">
                                                    <span>즐거움을 줘요</span>
                                                    <strong>308</strong>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gftSlct">
                                    <h3>선물 선택</h3>
                                    <div class="gftslctGroup">
                                        <div class="gftslctTit">선물</div>
                                        <div class="gftPrdt">
                                            <div class="prdtSlct">
                                                <div class="prdtBox">
                                                    <div class="prdboxGrp">
                                                        <div class="prdboxTit">[텀블벅 혜택]블로썸 퍼퓸 1개/26% 할인가/배송비포함</div>
                                                        <div class="xBtnWrap">
                                                            <button class="b-close btnSlct">닫기</button>
                                                        </div>
                                                    </div>
                                                    <div class="prdDtail">
                                                        <ul class="prdList">
                                                            <li>블로썸 오드퍼퓸(50ML)(x1)</li>
                                                            <li>세이리 미니퍼퓸(3ML)(x1)</li>
                                                            <li>일러스트 엽서(x1)</li>
                                                        </ul>
                                                        <div class="prdDtlst">
                                                            <div class="prdCount">
                                                                <button>
                                                                    -
                                                                </button>
                                                                <input readonly type="number" value="1" disabled>
                                                                <button>
                                                                    +
                                                                </button>
                                                            </div>
                                                            <div class="prdVal">
                                                                <span>29800</span>원
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="prdPlus">
                                                <div class="plusSup">
                                                    <div class="supTit">
                                                        추가 후원금<span>(선택)</span>
                                                    </div>
                                                </div>
                                                <div class="supIpt">
                                                    <input type="number" min="1" max="10000000">
                                                    <button></button>
                                                </div>
                                                <div class="supDt">
                                                    *추가 후원금으로 프로젝트를 응원해주세요.
                                                </div>
                                            </div>
                                            <div class="twinBtnwrap">
                                                <button class="gftAddbtn">선물 추가하기</button>
                                                <button class="gftCalcbtn">
                                                    총&nbsp;<b><span></span>원</b>&nbsp;후원하기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gftBox">
                                        <div class="gftEl">
                                            <div class="gftVal">
                                                1,000원 +
                                            </div>
                                            <div class="gftDesc">
                                                선물 없이 후원하기
                                            </div>
                                        </div>
                                        <div class="gftEl">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    2개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    28개 남음
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                29,800원 +
                                            </div>
                                            <div class="gftDesc">
                                                [텀블벅 혜택] 블로썸 퍼퓸 1개 / 26% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x1)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    15개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    5개 남음
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                51,100원 +
                                            </div>
                                            <div class="gftDesc">
                                                [얼리버드] 블로썸 퍼퓸 + 디퓨저 듀오 / 30% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x2)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x2)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    10개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    10개 남음
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                65,700원 +
                                            </div>
                                            <div class="gftDesc">
                                                [얼리버드] 블로썸 퍼퓸 더블구성 / 33% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x2)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x2)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x2)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    11개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    4개 남음
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                95,500원 +
                                            </div>
                                            <div class="gftDesc">
                                                [얼리버드] 퍼퓸 3개 구성 / 35% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                    <span>택(x2)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x3)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x3)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    8개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    2개 남음
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                149,500원 +
                                            </div>
                                            <div class="gftDesc">
                                                [세이리 매니아] 퍼퓸 5개 구성 / 39% 할인가 + 디퓨저 선물증정 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 오드퍼퓸(블로썸 선택가능, 50ML)</span>
                                                    <span>택(x4)</span>
                                                </li>
                                                <li>
                                                    <span>블로썸 퍼퓸디퓨저(120ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x5)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x5)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl soldOut">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    100개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    선착순 마감
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                34,500원 +
                                            </div>
                                            <div class="gftDesc">
                                                [얼리버드] 블로썸 퍼퓸 1개 / 30% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x1)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="gftEl soldOut">
                                            <div class="spnLine">
                                                <span class="slctGft">
                                                    <i class="fa-solid fa-check"></i>
                                                    50개 선택
                                                </span>
                                                <span class="slctRmn">
                                                    선착순 마감
                                                </span>
                                            </div>
                                            <div class="gftVal">
                                                35,500원 +
                                            </div>
                                            <div class="gftDesc">
                                                [얼리버드 2차] 블로썸 퍼퓸 1개 / 28% 할인가 / 배송비포함
                                            </div>
                                            <ul>
                                                <li>
                                                    <span>블로썸 오드퍼퓸(50ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>세이리 미니퍼퓸(3ML)</span>
                                                    <span>(x1)</span>
                                                </li>
                                                <li>
                                                    <span>일러스트 엽서</span>
                                                    <span>(x1)</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="btmCont">
    <div class="gftWrapper"><!-- 이런 프로젝트 어때요? -->
        <div class="gftContain">
            <div class="containBox">
                <div class="containTit">
                    이런 프로젝트 어때요?
                </div>
                <span>AD</span>
            </div>
            <div class="Cardcont">
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban02.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">실용·취미</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">MINCHANG</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                            </div>
                            <div class="pstTag">
                                <span>101% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban03.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">액세서리</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Mirror in MIRROr</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                            </div>
                            <div class="pstTag">
                                <span>1406% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban04.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 문구</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">글리팅(glitting)</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                            </div>
                            <div class="pstTag">
                                <span>1422% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban05.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 소품</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">아나레 ahnale</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                            </div>
                            <div class="pstTag">
                                <span>722% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban06.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">가방</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Vao</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                            </div>
                            <div class="pstTag">
                                <span>52% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="gftWrapper"><!-- 이 프로젝트와 비슷한 프로젝트 -->
        <div class="gftContain">
            <div class="containBox allVw">
                <div class="containTit">
                    이 프로젝트와 비슷한 프로젝트
                </div>
                <div class="allVwbtn">
                    전체보기
                </div>
            </div>
            <div class="Cardcont">
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban02.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">실용·취미</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">MINCHANG</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                            </div>
                            <div class="pstTag">
                                <span>101% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban03.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">액세서리</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Mirror in MIRROr</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                            </div>
                            <div class="pstTag">
                                <span>1406% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban04.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 문구</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">글리팅(glitting)</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                            </div>
                            <div class="pstTag">
                                <span>1422% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban05.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 소품</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">아나레 ahnale</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                            </div>
                            <div class="pstTag">
                                <span>722% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban06.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">가방</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Vao</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                            </div>
                            <div class="pstTag">
                                <span>52% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="gftWrapper"><!-- 같이 후원한 프로젝트 -->
        <div class="gftContain">
            <div class="containBox allVw">
                <div class="containTit">
                    같이 후원한 프로젝트
                </div>
                <div class="allVwbtn">
                    전체보기
                </div>
            </div>
            <div class="Cardcont">
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban02.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">실용·취미</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">MINCHANG</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[출판세금] 1인출판사의 세금 실력을 특별하게 하는 법</a>
                            </div>
                            <div class="pstTag">
                                <span>101% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban03.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">액세서리</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Mirror in MIRROr</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">12+1지신 노리개 부적 뱃지와 2024 새해 맞이</a>
                            </div>
                            <div class="pstTag">
                                <span>1406% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban04.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 문구</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">글리팅(glitting)</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">무하와 전통의 만남, 박지로 색칠하는 &lt;한복 글리팅&gt;</a>
                            </div>
                            <div class="pstTag">
                                <span>1422% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban05.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">디자인 소품</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">아나레 ahnale</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">[한정]2024년을 행운의 해로! 마법의 도구 굿럭오마모리</a>
                            </div>
                            <div class="pstTag">
                                <span>722% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="gftBanBox">
                    <div class="mnBan">
                        <div class="banImg">
                            <a href="#">
                                <img src="/static/img/mnban06.webp" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="banTxt">
                        <div class="txtGr">
                            <div class="subTxt">
                                    <span>
                                        <a href="#">가방</a>
                                    </span>
                                <span class="bar">
                                        <a href="#">Vao</a>
                                    </span>
                            </div>
                            <div class="subTit">
                                <a href="#">한국의 MBTI를 걸쳐봐, 실용성과 특별함을 담은 꼬꼬지백</a>
                            </div>
                            <div class="pstTag">
                                <span>52% 달성</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="bPopWrap" id="popReport">
    <div class="popTit">
        <p class="pTit">프로젝트 신고</p>
        <div class="xBtnWrap">
            <button class="b-close">닫기</button>
        </div>
        <span class="popDesc">이 프로젝트에 문제가 있다면 텀블벅에게 알려주세요</span>
    </div>
    <div class="popScr">
        <button class="popBoxbtn">
            <div class="popBoxtit">이용약관 또는 프로젝트 심사 기준을 위반했습니다.</div>
            <span>시중에 판매·유통되었던 제품·콘텐츠</span>
            <span>프로젝트 진행중 타 채널 동시 판매</span>
            <span>프로젝트 관련 허위 사실 게시</span>
            <span>기부 목적의 후원금 모금</span>
        </button>
        <button class="popBoxbtn">
            <div class="popBoxtit">커뮤니티 운영원칙을 위반했습니다.</div>
            <span>욕설, 외설 및 혐오표현 게시</span>
            <span>광고성 콘텐츠의 도배</span>
        </button>
        <button class="popBoxbtn">
            <div class="popBoxtit">개인정보 보호 권리를 침해했습니다.</div>
            <span>선물 전달 이외 목적의 개인정보 사용</span>
        </button>
        <button class="popBoxbtn">
            <div class="popBoxtit">지식재산권을 침해했습니다.</div>
            <span>타인의 디자인권, 상표권, 특허권 등의 지식재산권을 침해함</span>
        </button>
        <button class="popBoxbtn">
            <div class="popBoxtit">프로젝트 이행에 문제가 있습니다.</div>
            <span>선물 전달 지연 및 선물 불량</span>
            <span>창작자의 의사소통 부재</span>
        </button>
    </div>
    <div class="popBtm">
        <button class="taskButton b-close">확인</button>
    </div>
</div>
<script>
    (() => {
        const url = "/chatPop?buy_id=" + "${sessionScope.user_email}" + "&pj_id=" + "${pj_id}";
        const chatBtn = document.querySelector("#chatBtn");


        chatBtn.addEventListener("click", () => {
            window.open(url, "_blank", 'width=600px,height=800px,scrollbars=yes');

            return false;
        });

        console.dir(document.querySelector("#chatBtn"));
    })();
</script>
</body>
</html>
