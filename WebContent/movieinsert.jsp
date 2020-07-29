<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화 등록 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption><h1>영화등록</h1></caption>
    </thead>
    <tbody>
        <form action="./movieinsertAction.jsp" method="post" enctype="multipart/form-data">
            <tr>
                <th>title:</th>
                <td><input type="text" placeholder="영화제목 입력하세요 " name="movie_title" class="form-control"/></td>
            </tr>
            <tr>
                <th>sub_title: </th>
                <td><input type="text" placeholder="서브타이틀을 입력하세요 " name="movie_title_sub" class="form-control"></td>
            </tr>
            <tr>
                <th>year: </th>
                <td><input type="text" placeholder="년도를 입력하세요 " name="movie_year" class="form-control"/></td>
            </tr>
            <tr>
                <th>story: </th>
                <td><textarea cols="30" placeholder="내용을 입력하세요" name="movie_story" maxlength = "2048" class="form-control" style="height:180px;"/></textarea></td>
            </tr>
            <tr>
                <th>director: </th>
                <td><input type="text" placeholder="감독 입력하세요" name="movie_director" class="form-control"/></td>
            </tr>
            <tr>
                <th>cast: </th>
                <td><input type="text" placeholder="배우를 입력하세요" name="movie_cast" class="form-control"/></td>
            </tr>
            <tr>
                <th>genres: </th>
                <td><input type="text" placeholder="장르를 입력하세요" name="movie_genres" class="form-control"/></td>
            </tr>
            <tr>
                <th>runtime: </th>
                <td><input type="text" placeholder="상영시간 입력하세요" name="movie_runtime" class="form-control"/></td>
            </tr>
            <tr>
                <th>country: </th>
                <td><input type="text" placeholder="국가 입력하세요" name="movie_country" class="form-control"/></td>
            </tr>
			<tr>
                <th>poster: </th>
                <td><input type="file" placeholder="파일을 선택하세요" name="movie_poster" class="form-control"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록" class="pull-right"/>
                    <input type="button" value="reset" class="pull-left"/>
                    <input type="button" value="돌아가기" class="pull-right" onclick="javascript:location.href='index.jsp'"/>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>