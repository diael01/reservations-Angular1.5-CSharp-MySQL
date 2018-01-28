module.exports = function (config) {
    var sourcePreprocessors = "coverage";

    //debugging
    function isDebug(argument) {
        return argument == "--debug";
    }

    if (process.argv.some(isDebug)) {
        sourcePreprocessors = [];
    }

    config.set({
        basePath: ".",
        frameworks: ["jasmine"],
        files: [
            "scripts/angular.js",
             "scripts/jquery-1.9.1.js",
             "scripts/angular.js",
             "scripts/angular-mocks.js",
             "scripts/angular-route.js",
             "scripts/angular-resource.js",
             "scripts/angular-local-storage.js",
            "scripts/angular-ui-router.js",
            "app/app.js",
            "app/controllers/*.js",
            "app/services/*.js",
            "tests/*.js",
            "app/views/*.html",
            "app/directives/*.js"
        ],
        exclude: [],
        reporters: ["progress", "junit", "coverage"],
        preprocessors: {
            'app/controllers/*.js': ['coverage'],
            'app/services/*.js': ['coverage']
            //'app/**/*.js': ['coverage']
            //outputDir: "./tests/reports/junit",
            //outputFile: "tests-xunit.xml",
            //suite: "",
            //useBrowserName: false,
            //nameFormatter: undefined,
            //classNameFormatter: undefined,
            //properties: {}
        },
        coverageReporter: {
            type: 'html',
            dir: 'tests/coverage'
        },
        //coverageReporter: {
        //    type: lcov,
        //    dir: "./tests/reports",
        //    subdir: "coverage"
        //},
        port: 9876,
        autoWatch: true,
        browsers: ["Chrome"],
        captureTimeout: 60000,
        singleRun: false,
        loglevel: config.LOG_DEBUG

    });
}