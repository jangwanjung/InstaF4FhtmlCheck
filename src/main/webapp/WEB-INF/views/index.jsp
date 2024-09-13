<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>맞팔추적기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <br>
    <br>
    <h2>인스타그램 맞팔 추적기</h2>
    <br>
    ⚠️PC에서만 가능합니다.
    <br>
    ⚠️아래에있는 설명서를 읽어주세요.
    <br>
    ⚠️팔로워나 팔로우가 1000명이 넘는사람에게는 추천하지않아요.
    <br>
    <br>
    <form id="checkForm" action="/check" method="post" onsubmit="showLoading()">
        <div class="form-group">
            <label >팔로워 HTML코드</label>
            <textarea class="form-control" rows="5" name="followersCode"></textarea>
        </div>
        <div class="form-group">
            <label >팔로우 HTML코드</label>
            <textarea class="form-control" rows="5" name="followingsCode"></textarea>
        </div>
        <button type="submit" class="btn btn-primary" id="startButton">확인하기</button>
    </form>
    <div style="text-align: right">
        <input type="text" value="display: flex; flex-direction: column; padding-bottom: 0px; padding-top: 0px; position: relative;" style="width: 500px" id="myInput" disabled>
        <button onclick="myFunction()">복사</button>
    </div>

    <br>
    <img src="/image/설명서.jpg"  style="max-width: 100%; height: auto">

</div>
<script>
    function showLoading() {
        const button = document.getElementById('startButton');
        button.innerHTML = '<span class="spinner-border spinner-border-sm"></span> Loading..';
        button.disabled = true;
    }
    window.addEventListener( "pageshow", function ( event ) {
        var historyTraversal = event.persisted ||
            ( typeof window.performance != "undefined" &&
                window.performance.navigation.type === 2 );
        if ( historyTraversal ) {
            // Handle page restore.
            window.location.reload();
        }
    });
    function myFunction() {
        // Get the text field
        var copyText = document.getElementById("myInput");

        // Select the text field
        copyText.select();
        copyText.setSelectionRange(0, 99999); // For mobile devices

        // Copy the text inside the text field
        navigator.clipboard.writeText(copyText.value);

    }


</script>
</body>
</html>