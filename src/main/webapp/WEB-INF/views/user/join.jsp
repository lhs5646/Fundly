<%--
  Created by IntelliJ IDEA.
  User: init
  Date: 2024-01-30
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="js_c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>회원가입</title>
        <link rel="stylesheet" href="<c:url value='/static/user/css/Join.css?after'/>">
        <script src="https://kit.fontawesome.com/409fef83e5.js" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>

    <body>
        <header id="header"><a href="<c:url value='/'/>">Fundly</a></header>
        <main id="main">
            <div class="mainWrap">

                <%--        <div class="joinBox">--%>
                <%--            <h2>간편 가입</h2>--%>

                <%--            <div class = "snsAuth">--%>
                <%--                <button>구글</button>--%>
                <%--                <button>카카오</button>--%>
                <%--            </div>--%>
                <%--        </div>--%>

                <div class="joinCont">
                    <%--                <h2>이메일 간편가입</h2>--%>

                    <form id = "joinForm">

                        <h3>이메일</h3>
                        <div class="usEmail">
                            <div class ="emailView">
        <%--                        <js_c:if test="${userJoinDto.user_email != ''}">--%>
        <%--                            <input type="text" id ="user_email" name="user_email" placeholder="이메일 계정" value ="${userJoinDto.user_email}" autocomplete="off"/>--%>
        <%--                        </js_c:if>--%>
                                <input type="text" id ="user_email" name="user_email" placeholder="이메일 계정" value="${userJoinDto.user_email}" autocomplete="off"/>

                                <%--                        <button>인증하기</button>--%>
                            </div>
                            <div id="msgEmail" class="msg"/>

                        </div>

                        <h3>이름</h3>
                        <div class="usName">
                            <input type="text" id ="user_name" name="user_name" placeholder="이름 입력" value="${userJoinDto.user_name}" autocomplete="off"/>
                            <div id="msgName" class="msg"/>
                        </div>

                        <h3>비밀번호</h3>
                        <%--                    <div class="ex">--%>
                        <%--                        <div class="exa">--%>
                        <%--                            <input type="password" class="exipt" placeholder="비밀번호 입력" autocomplete="off"/>--%>
                        <%--                            <div class="eximg"></div>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>
                        <div class="usPwd">
                            <div class="usPwdWrap">
                                <input type="password" id ="user_pwd" class="pwdpad" name="user_pwd" value="${userJoinDto.user_pwd}" placeholder="비밀번호 입력" autocomplete="new-password"/>
        <%--                        autocomplete="off"/>--%>
                                <div class="eyes">
                                    <div class="password-toggle" id="togglePwd"></div>
                                </div>
                                <div id="msgPwd" class="msg"/>
                            </div>
                        </div>

                        <div class="usPwd2">
                            <div class="usPwdWrap">
                                <input type="password" id = "user_pwdConfirm" name="user_pwdConfirm"  value="${userJoinDto.user_pwdConfirm}" placeholder="비밀번호 확인" autocomplete="off"/>
                                <div class="eyes">
                                    <div class="password-toggle" id="togglePwdConfirm"></div>
                                </div>
                            </div>
                            <div id="msgPwdConfirm" class="msg"/>
                        </div>

                        <div class="agreeAll">
                            <input type="checkbox" id = "allchk" onclick="AllCheck()">
                            <label for="allchk" id="all"> 전체동의</label>

                            <div class="agrLine">
                                <div class="singleChk">
                                    <input type="checkbox" class="singleChk" id = "age_agree_yn" name="age_agree_yn" value="${userJoinDto.age_agree_yn}" >
                                    <label for="age_agree_yn" class="single">만 14세 이상입니다.(필수)</label>
                                    </input>
                                </div>

                                <div class="singleChk">
                                    <input type="checkbox" class="singleChk" id = "site_term_agree_yn" name = "site_term_agree_yn" value="${userJoinDto.site_term_agree_yn}">
                                    <label for="site_term_agree_yn" class="single">펀들리 이용 약관동의(필수)</label>
                                    <a href="" >내용보기</a>
                                    </input>
                                </div>

                                <div class="singleChk">
                                    <input type="checkbox" class="singleChk" id = "p_Info_agree_yn" name="p_Info_agree_yn" value="${userJoinDto.p_Info_agree_yn}">
                                    <label for="p_Info_agree_yn" class="single">개인정보 수집 및 이용 동의(필수)</label>
                                    <a href="" >내용보기</a>
                                    </input>
                                </div>

                                <div class="selectChk">
                                    <input type="checkbox" class="selectChk" id= "p_info_oth_agree_yn" name="p_info_oth_agree_yn" value="${userJoinDto.p_info_oth_agree_yn}">
                                    <label for="p_info_oth_agree_yn" class="single">개인정보 제 3자 제공 동의(선택)</label>
                                    <a href="" >내용보기</a>
                                    </input>
                                </div>

                                <div class="selectChk">
                                    <input type="checkbox" class="selectChk" id= "m_info_rcv_agree_yn" name="m_info_rcv_agree_yn" value="${userJoinDto.m_info_rcv_agree_yn}">
                                    <label for = "m_info_rcv_agree_yn" class="single">마케팅 정보 수신 동의(선택)</label>
                                    </input>
                                </div>
                            </div>
                        </div>

                        <div id="agreeName" class="msg"></div>

                        <div>
                            <button id="joinBtn" class="joinBtn">가입하기</button>
                        </div>

                        <div class="centerDiv">
                            <p>이미 펀들리 계정이 있으신가요?</p>
                            <a href="<c:url value='/login/login'/>">기존 계정으로 로그인하기</a>

                            <div class="otherJoin">
                                 <span>
                                     또는
                                 </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <button id="kakaBtn" class="kakaBtn" >
                <div class="kakaImg"></div>
                <div>카카오톡으로 로그인</div>
<%--                <button value="submit" onclick="location.href='/oauth/logout'">로그아웃</button>--%>
            </button>
        </main>
        <div class="copyr">
            <div>
                <p > @2024 Fundly Inc.</p>
            </div>
        </div>
    </body>
    <script>

        /* input */
        const user_email = document.getElementById("user_email");
        const user_name = document.getElementById("user_name");
        const user_pwd = document.getElementById("user_pwd");
        const user_pwdConfirm = document.getElementById("user_pwdConfirm");

        /* 이메일, 비밀번호에 대한 정규식 */
        const pwd =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=\-.])(?=.*[0-9]).{8,20}$/;
        const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        /* checkbox */
        const checkAll = document.getElementById('allchk');
        let allboxes = document.querySelectorAll("input[type='checkbox']");
        let allCheckboxes = document.querySelectorAll("input[type='checkbox']:checked");
        let singleChk = document.querySelectorAll('.singleChk:checked');
        let selectChk = document.querySelectorAll('.selectChk:checked');

        /* form */
        let joinForm = document.querySelector("#joinForm");

        /* pwd eye */
        const pwdInput = document.getElementById('user_pwd');
        const pwdInputConfirm = document.getElementById('user_pwdConfirm');

        const togglePwd = document.getElementById('togglePwd');
        const togglePwdConfirm = document.getElementById('togglePwdConfirm');

        /* Oauth2 kakao */
        const kakaBtn = document.getElementById('kakaBtn');

        kakaBtn.addEventListener('click',()=>{
            const kakao = document.createElement('form');
            kakao.action = '<c:url value="/oauth/kakao"/>';
            kakao.method = 'post';
            document.body.appendChild(kakao);
            kakao.submit();
        });

        togglePwd.addEventListener('click', function () {

            if (pwdInput.type === 'password') {
                   pwdInput.type = 'text';
                togglePwd.style.backgroundImage = 'url("/static/img/Icon-private.png")';
            } else {
                pwdInput.type = 'password';
                togglePwd.style.backgroundImage = 'url("/static/img/Icon-eye.png")';
            }
        });

        togglePwdConfirm.addEventListener('click', function () {

            if (pwdInputConfirm.type === 'password') {
                pwdInputConfirm.type = 'text';
                togglePwdConfirm.style.backgroundImage = 'url("/static/img/Icon-private.png")';
            } else {
                pwdInputConfirm.type = 'password';
                togglePwdConfirm.style.backgroundImage = 'url("/static/img/Icon-eye.png")';
            }
        });

        /* 정규식 */
        // 이메일 정규식
        user_email.addEventListener("keyup", () => {
            if(!email.test(user_email.value) && user_email.value.length!==0) {
                setMessage('유효하지 않은 이메일 형식입니다.', "user_email", "msgEmail", "red");
            } else{
                setMessage('', "user_email", "msgEmail","black");
            }
        })

        // 이름은 최소 2자 이상 입력
        user_name.addEventListener("keyup", () => {
            if ((user_name.value.length <= 2&& user_name.value.length >=50) && user_name.value.length!==0) {
                setMessage('최소 2자 이상 입력해주세요.', "user_name", "msgName", "red");
            }else {
                setMessage('', "user_name", "msgName", "black");
            }
        })

        // 비밀번호는 8자~20자 / 공백 / 숫자, 영문, 특수문자 조합
        user_pwd.addEventListener("keyup", () => {
            // if (user_pwd.value.length < 8 && user_pwd.value.length > 20 ) {
            if (!(user_pwd.value.length > 8 && user_pwd.value.length < 20) && user_pwd.value.length!== 0) {
                setMessage('비밀번호는 8자 이상, 20자 이하로 입력하세요.', "user_pwd", "msgPwd", "red");
                return false;
            } else if(user_pwd.value.search(/\s/) !== -1){
                setMessage('비밀번호는 공백 없이 입력해주세요.', "user_pwd", "msgPwd", "red");
                return false;
            } else if(!pwd.test(user_pwd.value)&& user_pwd.value.length!== 0){
                setMessage('영문, 숫자, 특수문자를 혼합하여 입력해주세요.', "user_pwd", "msgPwd", "red");
                return false;
            }
            else {
                setMessage('', "user_pwd", "msgPwd", "black");
            }
        })

        // 비밀번호는 8자 이상 20자(21개 변경) 이하 / 숫자, 영문 대소문자, 특수문자 중 2가지 이상 조합 / 3개 이상 연속으로 동일한 문자
        // user_pwd와 비교
        user_pwdConfirm.addEventListener("keyup", () => {
            if (!(user_pwdConfirm.value.length > 8 && user_pwdConfirm.value.length < 20) && user_pwdConfirm.length!== 0) {
                setMessage('비밀번호는 8자 이상, 20자 이하로 입력하세요.', "user_pwdConfirm", "msgPwdConfirm", "red");
                return false;
            }
            else if(user_pwdConfirm.value.search(/\s/) !== -1){
                setMessage('비밀번호는 공백 없이 입력해주세요.', "user_pwdConfirm", "msgPwdConfirm", "red");
                return false;
            } else if(!pwd.test(user_pwdConfirm.value)&& user_pwdConfirm.value.length!== 0){
                setMessage('영문, 숫자, 특수문자를 혼합하여 입력해주세요.', "user_pwdConfirm", "msgPwdConfirm", "red");
                return false;
            }else if(user_pwdConfirm.value !== user_pwd.value){
                setMessage('비밀번호가 일치하지 않습니다.', "user_pwdConfirm", "msgPwdConfirm", "red");
                return false;
            }
            else {
                setMessage('', "user_pwdConfirm", "msgPwdConfirm", "black");
            }
        })

        /* joinBtn submit */
        joinForm.addEventListener("submit",function(e) {
            e.preventDefault();

            if(!(email.test(user_email.value))) {
                setMessage("유효하지 않은 이메일 형식입니다.","user_email", "msgEmail", "red");
                return false;
            }

            if (user_name.value.length < 2 ) {
                // && user_name.value.length==0) {
                setMessage('최소 2자 이상 입력해주세요.', "user_name", "msgName", "red");
                return false;
            }

            if (user_pwd.value.length < 8 && user_pwd.value.length > 20 ) {
                setMessage('비밀번호는 8자 이상, 20자 이하로 입력하세요.', "user_pwd", "msgPwd", "red");
                return false;
            }

            if (user_pwdConfirm.value.length < 8 && user_pwdConfirm.value.length > 20 ) {
                setMessage('비밀번호는 8자 이상, 20자 이하로 입력하세요.', "user_pwdConfirm", "msgPwd", "red");
                return false;
            }

            if(!user_pwd.value===user_pwdConfirm.value){
                setMessage('비밀번호가 일치하지 않습니다.', "user_pwdConfirm", "msgPwdConfirm", "red");
                return false;
            }

            singleChk = document.querySelectorAll('.singleChk:checked');

            if(singleChk.length <3 ){
                setMessage('필수 동의 내용을 체크해주세요.', "", "agreeName", "red");
                return false;
            }

            joinForm.action = '<c:url value="/join/add"/>';
            // joinForm.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8")
            joinForm.method = 'POST';
            joinForm.submit();
        })

        /* 유효성(입력된 값에 따른 변화 style,value) */
        function setMessage(msg, elementid, msgid, color){
            document.getElementById(msgid).innerHTML = `${'${msg}'}`;
            document.getElementById(elementid).style.border = "1px solid " + color;
            // elementid.focus();
        }

        /* checkbox 정의 */
        // 전체 동의 체크박스 상태 변경 시 개별 동의 체크박스 상태 변경
        checkAll.addEventListener('change', function() {
            allboxes.forEach(checkbox => {
                checkbox.checked = checkAll.checked;
            });
        });

        allboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {

                singleChk = document.querySelectorAll('.singleChk:checked');
                selectChk = document.querySelectorAll('.selectChk:checked');

                if (!this.checked) {
                    checkAll.checked = false;
                }

                if(singleChk.length !== 0 && singleChk.length< 3 || selectChk.length!==0 && singleChk.length === 0){
                    setMessage('필수 동의 내용을 체크해주세요.', "", "agreeName", "red");

                }
                else{
                    if(singleChk.length + selectChk.length === 5) {checkAll.checked = true;}else{checkAll.checked = false;}
                    setMessage('', "", "agreeName", "black");
                }
            });
        })

        /* errmsg redirect */
        const errmsg = "${errmsg}";
        if (errmsg === "VALID_ERROR") alert("입력된 값을 확인해 주세요.");
        if (errmsg === "JOIN_PWD_ERROR") alert("비밀번호를 확인해주세요.");
        if (errmsg === "JOIN_DUP_ERROR") alert("이미 가입된 사용자입니다.");

        /* valid errorMsg */
        const validUserEmail = '${valid_user_email}';
        const validUserName = '${valid_user_name}';
        const validUserPwd = '${valid_user_pwd}';
        const validUserPwdConfirm = '${valid_user_pwdConfirm}';

        // alert("validUserEmail =" + validUserEmail+ " ,validUserName = "
        //     + validUserName+", validUserPwd =" + validUserPwd+ " ,validUserPwdConfirm = " + validUserPwdConfirm)

        if(validUserName!=='') {
            setMessage(validUserName, "user_name", "msgName", "red");
        }
        if(validUserPwd!=='') {
            setMessage(validUserPwd, "user_pwd", "msgPwd", "red");
        }
        if(validUserPwdConfirm!=='') {
            setMessage(validUserPwdConfirm, "user_pwdConfirm", "msgPwdConfirm", "red");
        }
        if(validUserEmail!=='') {
            setMessage(validUserEmail, "user_email", "msgEmail", "red");
        }

    </script>
</html>
