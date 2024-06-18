// This program was cloned from: https://github.com/Crzax/riscv_pipeline
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    CLK_DIV 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLK_DIV( input clk,
                input rst,
                input SW15,
                output Clk_CPU
              );

// Clock divider

  reg[31:0]clkdiv;

  always @ (posedge clk or posedge rst) begin 
    if (rst) clkdiv <= 0; else clkdiv <= clkdiv + 1'b1; end

  assign Clk_CPU=(SW15)? clkdiv[25] : clkdiv[2];  // SW15 to select slow cpu clock or fast cpu clk

endmodule
