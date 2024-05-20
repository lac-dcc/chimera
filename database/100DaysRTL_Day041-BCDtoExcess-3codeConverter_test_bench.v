// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg [3:0] bcd_in;
    wire [3:0] excess3_out;

    BCD2excess3 dut(bcd_in, excess3_out);

    always begin
        bcd_in= 4'd0;
    #10;
        bcd_in= 4'd1;
    #10;
        bcd_in= 4'd2;
    #10;
        bcd_in= 4'd3;
    #10;
        bcd_in= 4'd4;
    #10;
        bcd_in= 4'd5;
    #10;
        bcd_in= 4'd6;
    #10;
        bcd_in= 4'd7;
    #10;
        bcd_in= 4'd8;
    #10;
        bcd_in= 4'd9;
    #10;
        bcd_in= 4'd10;
    #10;
        bcd_in= 4'd11;
    #10;
        bcd_in= 4'd12;
    #10;
        bcd_in= 4'd13;
    #10;
        bcd_in= 4'd14;
    #10;
        bcd_in= 4'd15;
    #10;
    end
    
    initial begin
    $monitor("Input: %b  Excess-3 Code: %b", bcd_in, excess3_out);
    #160 $finish;
    end
endmodule
