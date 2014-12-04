app.controller('ScoreController', ['$scope', '$http', '$modal', 'blockUI', function($scope, $http, $modal, blockUI) {

    $scope.init = function() {
        $http.get('tests').success(function(tests) {
            $scope.tests = tests;


        });

        $http.get('user/tests').success(function(userTests) {
            $scope.userTests = userTests;

        });

        $scope.userTestPager = {
            currentPage: 1,
            entryLimit: 10
        };

        $scope.testsPager = {
            currentPage: 1,
            entryLimit: 10
        };

        $scope.blockContainer = blockUI.instances.get('blockContainer');
    };

    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };

    $scope.open = function (test) {
        var modalInstance = $modal.open({
            templateUrl: '/resources/app/view/test.content.html',
            controller: 'TestController',
            size: 'lg',
            resolve: {
                test: function () {
                    return test;
                }
            }
        });

        modalInstance.result.then(function () {
            $scope.init();
        }, function () {
            console.log('Cancel.')
        });
    };
}]);

app.controller('TestController', function ($scope, $http, $modalInstance, test) {
    $scope.test = test;
    $scope.questions = angular.copy(test.questions);
    $scope.questionIdx = 0;
    $scope.question = $scope.questions[$scope.questionIdx];
    $scope.question.userAnswer = '';

    $scope.next = function() {
        if($scope.isLast()) {
            $scope.testFinished = true;
            saveResults(getAnswers());

            return;
        }

        $scope.questionIdx ++;
        $scope.question = $scope.questions[$scope.questionIdx];
        $scope.question.userAnswer = $scope.question.userAnswer || '';
    };

    $scope.previous = function() {
        $scope.questionIdx --;
        $scope.question = $scope.questions[$scope.questionIdx];
    };

    $scope.isLast = function() {
        return $scope.questions.length == $scope.questionIdx + 1;
    };

    $scope.hasPrevious = function() {
        return $scope.questionIdx > 0;
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };

    $scope.close = function () {
        $modalInstance.close();
    };

    function getAnswers() {
        var answers = [];
        for(var i = 0; i < $scope.questions.length; i++) {
            answers.push($scope.questions[i].userAnswer);
        }
        return answers;
    }

    function saveResults(answers) {
        $http.post('tests/' + test.id + '/answers', answers).success(function(score) {
            $scope.score = score;
        });
    }
});