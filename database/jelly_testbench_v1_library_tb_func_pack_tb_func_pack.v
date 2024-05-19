// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_func_pack();
    localparam RATE    = 1000.0 / 100.0;
    
    
    initial begin
        $dumpfile("tb_func_pack.vcd");
        $dumpvars(0, tb_func_pack);
        
        #1000000;
            $finish;
    end
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    
    parameter   N   = 3;
    parameter   W0  = 16;//16;
    parameter   W1  = 16;//17;
    parameter   W2  = 16;//18;
    parameter   W3  = 16;//19;
    parameter   W4  = 16;//20;
    parameter   W5  = 16;//21;
    parameter   W6  = 16;//22;
    parameter   W7  = 16;//23;
    
    parameter   P4  = W0 + W1 + W2 + W3;
    parameter   P6  = W0 + W1 + W2 + W3 + W4 + W5;
    parameter   P8  = W0 + W1 + W2 + W3 + W4 + W5 + W6 + W7;
    
    
    parameter   D0 = W0 > 0 ? W0 : 1;
    parameter   D1 = W1 > 0 ? W1 : 1;
    parameter   D2 = W2 > 0 ? W2 : 1;
    parameter   D3 = W3 > 0 ? W3 : 1;
    parameter   D4 = W4 > 0 ? W4 : 1;
    parameter   D5 = W5 > 0 ? W5 : 1;
    parameter   D6 = W6 > 0 ? W6 : 1;
    parameter   D7 = W7 > 0 ? W7 : 1;
    
    
    
    reg     [N*D0-1:0]  src_data0;
    reg     [N*D1-1:0]  src_data1;
    reg     [N*D2-1:0]  src_data2;
    reg     [N*D3-1:0]  src_data3;
    reg     [N*D4-1:0]  src_data4;
    reg     [N*D5-1:0]  src_data5;
    reg     [N*D6-1:0]  src_data6;
    reg     [N*D7-1:0]  src_data7;
    
    integer i, j;
    initial begin
        for ( i = 0; i < 100; i = i+1 ) begin
            for ( j = 0; j < N; j = j+1 ) begin
                src_data0[j*D0 +: D0] = 16'h1000 + i*16'h10 + j;
                src_data1[j*D1 +: D1] = 16'h2000 + i*16'h10 + j;
                src_data2[j*D2 +: D2] = 16'h3000 + i*16'h10 + j;
                src_data3[j*D3 +: D3] = 16'h4000 + i*16'h10 + j;
                src_data4[j*D4 +: D4] = 16'h5000 + i*16'h10 + j;
                src_data5[j*D5 +: D5] = 16'h6000 + i*16'h10 + j;
                src_data6[j*D6 +: D6] = 16'h7000 + i*16'h10 + j;
                src_data7[j*D7 +: D7] = 16'h8000 + i*16'h10 + j;
            end
            #100;
        end
    end
    
    
    
    
    // pack8
    wire    [N*P8-1:0]  pack8;
    
    wire    [N*D0-1:0]  dst8_data0;
    wire    [N*D1-1:0]  dst8_data1;
    wire    [N*D2-1:0]  dst8_data2;
    wire    [N*D3-1:0]  dst8_data3;
    wire    [N*D4-1:0]  dst8_data4;
    wire    [N*D5-1:0]  dst8_data5;
    wire    [N*D6-1:0]  dst8_data6;
    wire    [N*D7-1:0]  dst8_data7;
    
    jelly_func_pack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3),
                .W4     (W4),
                .W5     (W5),
                .W6     (W6),
                .W7     (W7)
            )
        jelly_func_pack8
            (
                .in0    (src_data0),
                .in1    (src_data1),
                .in2    (src_data2),
                .in3    (src_data3),
                .in4    (src_data4),
                .in5    (src_data5),
                .in6    (src_data6),
                .in7    (src_data7),
                .out    (pack8)
            );
    
    jelly_func_unpack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3),
                .W4     (W4),
                .W5     (W5),
                .W6     (W6),
                .W7     (W7)
            )
        jelly_func_ubpack8
            (
                .in     (pack8),
                .out0   (dst8_data0),
                .out1   (dst8_data1),
                .out2   (dst8_data2),
                .out3   (dst8_data3),
                .out4   (dst8_data4),
                .out5   (dst8_data5),
                .out6   (dst8_data6),
                .out7   (dst8_data7)
            );
    
    wire pack8_ok0 = (dst8_data0 == src_data0);
    wire pack8_ok1 = (dst8_data1 == src_data1);
    wire pack8_ok2 = (dst8_data2 == src_data2);
    wire pack8_ok3 = (dst8_data3 == src_data3);
    wire pack8_ok4 = (dst8_data4 == src_data4);
    wire pack8_ok5 = (dst8_data5 == src_data5);
    wire pack8_ok6 = (dst8_data6 == src_data6);
    wire pack8_ok7 = (dst8_data7 == src_data7);
    
    
    
    
    // pack6
    wire    [N*P6-1:0]  pack6;
    
    wire    [N*D0-1:0]  dst6_data0;
    wire    [N*D1-1:0]  dst6_data1;
    wire    [N*D2-1:0]  dst6_data2;
    wire    [N*D3-1:0]  dst6_data3;
    wire    [N*D4-1:0]  dst6_data4;
    wire    [N*D5-1:0]  dst6_data5;
    
    jelly_func_pack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3),
                .W4     (W4),
                .W5     (W5)
            )
        jelly_func_pack6
            (
                .in0    (src_data0),
                .in1    (src_data1),
                .in2    (src_data2),
                .in3    (src_data3),
                .in4    (src_data4),
                .in5    (src_data5),
                .out    (pack6)
            );
    
    jelly_func_unpack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3),
                .W4     (W4),
                .W5     (W5)
            )
        jelly_func_ubpack6
            (
                .in     (pack6),
                .out0   (dst6_data0),
                .out1   (dst6_data1),
                .out2   (dst6_data2),
                .out3   (dst6_data3),
                .out4   (dst6_data4),
                .out5   (dst6_data5)
            );
    
    wire pack6_ok0 = (dst6_data0 == src_data0);
    wire pack6_ok1 = (dst6_data1 == src_data1);
    wire pack6_ok2 = (dst6_data2 == src_data2);
    wire pack6_ok3 = (dst6_data3 == src_data3);
    wire pack6_ok4 = (dst6_data4 == src_data4);
    wire pack6_ok5 = (dst6_data5 == src_data5);
    
    
    
    // pack4
    wire    [N*P4-1:0]  pack4;
    
    wire    [N*D0-1:0]  dst4_data0;
    wire    [N*D1-1:0]  dst4_data1;
    wire    [N*D2-1:0]  dst4_data2;
    wire    [N*D3-1:0]  dst4_data3;
    
    
    jelly_func_pack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3)
            )
        jelly_func_pack4
            (
                .in0    (src_data0),
                .in1    (src_data1),
                .in2    (src_data2),
                .in3    (src_data3),
                .out    (pack4)
            );
    
    jelly_func_unpack
            #(
                .N      (N),
                .W0     (W0),
                .W1     (W1),
                .W2     (W2),
                .W3     (W3)
            )
        jelly_func_ubpack
            (
                .in     (pack4),
                .out0   (dst4_data0),
                .out1   (dst4_data1),
                .out2   (dst4_data2),
                .out3   (dst4_data3)
            );
    
    
    wire pack4_ok0 = (dst4_data0 == src_data0);
    wire pack4_ok1 = (dst4_data1 == src_data1);
    wire pack4_ok2 = (dst4_data2 == src_data2);
    wire pack4_ok3 = (dst4_data3 == src_data3);
    
    
endmodule


`default_nettype wire


// end of file
