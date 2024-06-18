// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

`timescale 1ns/1ns

module TB ();

    reg clk,rst;
    reg [4:0] one, epsilon;
    reg [4:0] x1,x2,x3,x4;

    wire done;
    wire [4:0]  pu_out1, pu_out2, pu_out3, pu_out4;
    

    maxnet_cellular UUT(
        .clk(clk), 
        .rst(rst), 
        .one(one), 
        .epsilon(epsilon),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .done(done),
        .pu_out1(pu_out1),
        .pu_out2(pu_out2),
        .pu_out3(pu_out3),
        .pu_out4(pu_out4)
    );

    always 
    begin
        #5 clk = ~clk;
    end
     initial begin
        clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
        
        epsilon = 5'b11110;
        one = 5'b01000;
        x1 = 5'b01000; //1
        x2 = 5'b00110; //.75
        x3 = 5'b00100; //.5
        x4 = 5'b00010; //.25

        #10000 $stop;
     end

endmodule