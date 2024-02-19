

$(function () {
// common start
    //* tabMenu *//
    $('.tabBtn > .btn').click(function(){
        var $this = $(this);
        var idx = $this.index();
        if ( $this.hasClass('on') ){
            return false;
        } else {
            $this.addClass('on').siblings('.btn').removeClass('on');
            $this.parents('.tabMenu').siblings('.tabCont').children('.cont').eq(idx).fadeIn(0).addClass('on').siblings('.cont').fadeOut(0).removeClass('on');
        }
    });

    //* .fixBG *//
    $('.fixBG').click(function(){
        $(this).fadeOut(200);
        $('.popCont').fadeOut(200).removeClass('tag');
    });


    //* .popDf *//
    $('.popWrap .taskButton , .popWrap .xBtnWrap').click(function(){
        if( $(this).hasClass('close') ) {
            $(this).parents('.popWrap').find('.popCont').fadeOut(100).removeClass('on fixCont tag');
            $('.fixBG').fadeOut(200);
        } else {
            $(this).parents('.popWrap').find('.popCont').fadeIn(100).addClass('on fixCont tag');
            $('.fixBG').fadeIn(200);
        }
    });

    $('#popReportBtn').bind('click', function(e) { //프로젝트 신고하기
        e.preventDefault();
        var bPopup = $('#popReport').bPopup();
    });


    //* scroll button 클릭 시 영역 이동 *//
    $(".scrBtnWrap > .btn").click(function() {
        var $this = $(this);
        // 버튼에 'on' 클래스 추가
        if ( $this.hasClass('on') ){
            return false;
        } else {
            $this.addClass('on').siblings('.btn').removeClass('on'); // 버튼의 형제들에게서 'on' 클래스 제거
        }
        // 해당 섹션으로 스크롤
        var target = $(this).data("target");
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 0);
    });


    //* 헤더 고정 *//
    $(window).scroll(function() {
        if ($(this).scrollTop() > 870) { // 스크롤 높이가 850px를 넘으면
            $('.tabMenu.bd').addClass('fix'); // 헤더를 화면 상단에 고정
            $('.tabScr').addClass('fix'); // 헤더를 화면 상단에 고정
        } else {
            $('.tabMenu.bd').removeClass('fix'); // 그렇지 않으면 헤더를 숨김
            $('.tabScr').removeClass('fix'); // 그렇지 않으면 헤더를 숨김
        }
    });

    //* 탭메뉴_레벨2 스크롤 고정 *//
    $(window).scroll(function() {
        if ($(this).scrollTop() > 1340) { // 스크롤 높이가 1340px를 넘으면
            $('.gftSlct').addClass('fix'); // 상품을 화면 상단에 고정
        } else {
            $('.gftSlct').removeClass('fix'); // 그렇지 않으면 상품을 숨김
        }
    });

    //* 스와이퍼 *//
    var swiper = new Swiper(".mySwiper", {
        cssMode: true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
        },
        mousewheel: true,
        keyboard: true,
    });

    //* 하트 클릭 시 색상 변경 *//
    // $('.icoImg').click(function(){
    //     if ( $(this).hasClass('on') ){
    //         return false;
    //     } else {
    //         $(this).addClass('on').siblings('.icoImg').removeClass('on'); // 버튼의 형제들에게서 'on' 클래스 제거
    //     }
    // });

    // 상품 클릭 시 선물 선택 활성화
    $('.gftEl').click(function() {
        $('.gftslctGroup').show();
        // $('.prdtSlct').hide();
    });

    // close 버튼 클릭 시 선물 선택 비활성화
    $('.b-close btnSlct').click(function() {
        $('.gftslctGroup').hide();
    });
});
