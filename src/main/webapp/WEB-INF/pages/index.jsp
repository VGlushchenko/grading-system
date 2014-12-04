<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html ng-app="app">
<head>
    <title>Scores</title>
    <link rel="stylesheet" href='<c:url value="/resources/lib/bootstrap/css/bootstrap.css"/>' />
    <link rel="stylesheet" href='<c:url value="/resources/lib/bootstrap/css/bootstrap-theme.css"/>' />
    <link rel="stylesheet" href='<c:url value="/resources/assets/css/angular-block-ui.min.css"/>' />

    <script src="<c:url value="/resources/assets/js/jquery/jquery-1.10.2.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular-resource.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular-route.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/ui-bootstrap-custom-0.12.0.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/ui-bootstrap-custom-tpls-0.12.0.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular-strap.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular-strap.tpl.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/angularjs/angular-block-ui.min.js"/>"></script>

    <script src="<c:url value="/resources/app/core/application.js"/>"></script>
    <script src="<c:url value="/resources/app/controller/ScoreController.js"/>"></script>

    <style>
        body {
            font-size: 12px;
        }
    </style>
</head>
<body ng-controller="ScoreController">

<%@ include file="header.jsp" %>

<div class="container" ng-init="init()">
    <div class="row" block-ui="blockContainer">
        <div class="col-md-6">
            <h2>Passed Tests</h2>
            <div class="container-fluid" style="height: 450px">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="15px"></th>
                        <th width="150px">Test name</th>
                        <th width="60px" class="text-center">Score</th>
                        <th width="40px" class="text-center">Passed At</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="userTest in userTests
                    | startFrom:(userTestPager.currentPage - 1) * userTestPager.entryLimit | limitTo:userTestPager.entryLimit">
                        <td>{{$index + 1 + (10 * (userTestPager.currentPage - 1))}}</td>
                        <td>
                            <a title="Test Info"
                               style="cursor: pointer"
                               data-template="/resources/app/view/test.info.tmpl.html"
                               data-trigger="click"
                               data-placement="right"
                               target="{{$(this)}}"
                               container="body"
                               bs-popover>
                                {{userTest.test.title}}
                            </a>
                        </td>
                        <td class="text-center">{{userTest.score}} / {{userTest.test.questionsCount}}</td>
                        <td>{{userTest.passedAt | date: 'dd MMM yyyy'}}</td>
                    </tr>
                    <tr ng-if="!userTests.length">
                        <td colspan="4" class="text-center" style="color: #999999">No Data To Display</td>
                    </tr>
                    </tbody>
                </table>
            </div>


            <div class="container-fluid text-right">
                <pagination total-items="userTests.length"
                            ng-model="userTestPager.currentPage"
                            class="pagination-sm"
                            previous-text="&laquo;"
                            next-text="&raquo;">
                </pagination>
            </div>

        </div>

        <div class="col-md-6">
            <h2>Available Tests</h2>
                <div  class="container-fluid" style="height: 450px">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th width="15px"></th>
                            <th width="150px">Test name</th>
                            <th width="60px">Questions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="test in tests
                        | startFrom:(testsPager.currentPage - 1) * testsPager.entryLimit | limitTo:testsPager.entryLimit">
                            <td>{{$index + 1 + (10 * (testsPager.currentPage - 1))}}</td>
                            <td>
                                <a data-ng-click="open(test)" style="cursor: pointer">
                                    {{test.title}}
                                </a>
                            </td>
                            <td class="text-center">{{test.questionsCount}}</td>
                        </tr>
                        <tr ng-if="!tests.length">
                            <td colspan="4" class="text-center" style="color: #999999">No Data To Display</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div  class="container-fluid text-right">
                        <pagination total-items="tests.length"
                                    ng-model="testsPager.currentPage"
                                    class="pagination-sm"
                                    previous-text="&laquo;"
                                    next-text="&raquo;">
                        </pagination>
                </div>

        </div>
    </div>

</div>
</body>
</html>
