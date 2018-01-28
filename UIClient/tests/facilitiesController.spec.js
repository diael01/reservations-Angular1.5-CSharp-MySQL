describe('Facilities Controller', function () {
    var $controller;
    var $q;
    var $rootScope;
    var $scope;
    var facilitiesService;
    var $scope;
    var $location;
    var $log;

    beforeEach(module('Reservations'));

    beforeEach(inject(function (_$controller_, _$q_, _$rootScope_, _$location_, _$log_,
                                                    _facilitiesService_) {
        $controller = _$controller_;
        $scope = {};
        $q = _$q_;
        $rootScope = _$rootScope_;
        $location = _$location_;
        facilitiesService = _facilitiesService_;
        $controller('facilitiesController', {
            $location: _$location_, facilitiesService: _facilitiesService_,
            $log: _$log_, $scope: $scope
        });
    }));

    it('should load facilities', function () {
        spyOn(facilitiesService, 'getFacilities').and.callFake(function () {
            var deferred = $q.defer();
            deferred.resolve(results);
            return deferred.promise;
        });
        $controller('facilitiesController', {
            $location: $location, facilitiesService: facilitiesService,
            $log: $log, $scope: $scope
        });
        $rootScope.$apply();
        expect($scope.facilities[0].Name).toBe(results.facilities[0].Name);
        expect(facilitiesService.getFacilities).toHaveBeenCalled();
    });


    var results = {
        "facilities": [
           {
               "Name": "Flushing Meadows"              
           },           
           {
               "Name": "Central Park"               
           }
        ]
    };
});