// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// directleddriver.v for EE 2390 Lab #4
`timescale 1ns / 1ps
module directleddriver(led,sw);
    output  led;
    input   sw;
    assign  led=sw;
endmodule
