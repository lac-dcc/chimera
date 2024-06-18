// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

`timescale 1ns / 1ps

module blinky(
    input  clk,
    input  rst_n,
    output led
);
    
    reg [24:0] count = 0;
    always @ (posedge(clk) or negedge(rst_n))
        if (!rst_n)
            count <= 0;
        else
            count <= count + 1;

    assign led = count[24];

endmodule
