// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

module coefficient_encoder_testbench;
    reg signed [15:0] coefficient;
    wire [15:0]       coded_value;
    wire [3:0]        coded_value_length;

    coefficient_encoder ce(.coefficient(coefficient),
                           .coded_value(coded_value),
                           .coded_value_length(coded_value_length));

    initial begin
        $dumpfile("coefficient_encoder_tb.vcd");
        $dumpvars(0, coefficient_encoder_testbench);

        coefficient = -1;
        display;
        coefficient = 1;
        display;

        coefficient = 0;
        display;

        coefficient = -5;
        display;
        coefficient = 6;
        display;

        coefficient = -46;
        display;
        coefficient = 63;
        display;
        coefficient = -63;
        display;

        coefficient = 1023;
        display;
        coefficient = -1023;
        display;
        $finish;
    end

    task display;
        #1 $display("%d, %h, %d", coefficient,  coded_value, coded_value_length);
    endtask
endmodule // coefficient_encoder_testbench
