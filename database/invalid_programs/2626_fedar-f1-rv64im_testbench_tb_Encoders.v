// This program was cloned from: https://github.com/eminfedar/fedar-f1-rv64im
// License: MIT License

`include "Encoders.v"

`timescale 1ns / 100ps 

module tb_Encoders;
    reg [15:0] in = 0;
    reg [3:0] out4;
    reg [2:0] out3;
    reg [1:0] out2;

    Encoder_16 enc(in, out4);
    Encoder_8 enc8(in[7:0], out3);
    Encoder_4 enc4(in[3:0], out2);

    initial begin
        in = 16'b0000000000000000; #20;
        in = 16'b0000000000000001; #20;
        in = 16'b0000000000000010; #20;
        in = 16'b0000000000000100; #20;
        in = 16'b0000000000001000; #20;
        in = 16'b0000000000010000; #20;
        in = 16'b0000000000100000; #20;
        in = 16'b0000000001000000; #20;
        in = 16'b0000000010000000; #20;
        in = 16'b0000000100000000; #20;
        in = 16'b0000001000000000; #20;
        in = 16'b0000010000000000; #20;
        in = 16'b0000100000000000; #20;
        in = 16'b0001000000000000; #20;
        in = 16'b0010000000000000; #20;
        in = 16'b0100000000000000; #20;
        in = 16'b1000000000000000; #20;
        in = 16'b1000000000000001; #20;
        in = 16'b0000000100000001; #20;
        in = 16'b0000000000000011; #20;
        in = 16'b0000000000000000; #20;
        
    end

    initial begin
        $dumpfile("vcd/encoders.vcd");
        $dumpvars(0, tb_Encoders);
    end

endmodule