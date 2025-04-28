package com.example.demo;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
public class TestHelloRunner {

    @Test
    void testHelloFeature() {
        System.setProperty("karate.output.dir", "build/custom-karate-reports");
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .outputHtmlReport(true)
                .reportDir("build/custom-karate-reports")
                .systemProperty("karate.output.dir", "build/custom-karate-reports")
                .parallel(1);


        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
