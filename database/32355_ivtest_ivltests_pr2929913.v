// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1ns/1ps

module test;

    reg [3:0] fred[3:0];

    initial
    begin
        $display("About to assign to array in initial block ...");
        fred[0] = 0;
        $display("PASSED");
    end

    task automatic wilma;
        wait (fred[0]);
    endtask

endmodule
