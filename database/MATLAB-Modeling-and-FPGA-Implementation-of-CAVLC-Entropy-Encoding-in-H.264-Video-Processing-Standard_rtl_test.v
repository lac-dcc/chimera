// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 11:46:59 AM
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// what about the internal signal 
module test #(addrWIDTH= 4, WIDTH= 9, DEPTH = 16 )(
    input clk,      // Clock input
    input rst,
    input en,       // Enable signal

    output [WIDTH-1:0] dob

);

// Internal signals
wire [addrWIDTH-1:0] addra;
wire [3:0] address;
wire [3:0] data; // the [3:0] data which will leve the rom to reach the read address of the bram 

 counter dut0 (
    .clk(clk),      // Clock input
     .rst(rst),    // rst signal
     .en(en),       // Enable signal
    
     .count(address) // 4-bit counter output
);



 dualPortBRAM dut1 (
.clk(clk),
.rst(rst),

.ena(ena),
.enb(en),          // This is the input enable 
.wea(wea),
.addra(addra),

.addrb(data),     // here is the data from the pitput of the Rom // Note the data is the input here not addrb 
.dia(dia),

.dob(dob)
);



zigzagOrderROM dut2 (
    .address(address),
    .data(data)
);

endmodule