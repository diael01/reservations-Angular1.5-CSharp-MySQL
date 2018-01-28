describe('facilities service', function () {
    var facilitiesData = { test: 'test' };
    var facilitiesService  = {};
    var $httpBackend;
    var expectedUrl = 'http://localhost:50325/api/facilities/getFacilities';

    beforeEach(module('Reservations'));

    beforeEach(inject(function (_facilitiesService_ , _$httpBackend_) {
        facilitiesService = _facilitiesService_;
        $httpBackend = _$httpBackend_;
    }));

    it('should return facilities', function () {
        var response;
        $httpBackend.when('GET', expectedUrl).respond(200, facilitiesData);

        facilitiesService.getFacilities()
			.then(function (data) {
			    response = data;
			});

        $httpBackend.flush();
        expect(response).toEqual(facilitiesData);
    });

    it('should handle error', function () {
        var response;
        $httpBackend.expect('GET', expectedUrl).respond(500);

        facilitiesService.getFacilities()
			.then(function (data) {
			    response = data;
			})
			.catch(function () {
			    response = 'Error!';
			});

        $httpBackend.flush();
        expect(response).toEqual('Error!');
    });

});