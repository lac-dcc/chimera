// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
`include "ctrl_encode_def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 09:27:09 AM
// Design Name: 
// Module Name: rf_mux
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

//定义从Mem2Reg的Mux写入的信号
`define WDSel_FromALU 2'b00
`define WDSel_FromMEM 2'b01
`define WDSel_FromPC 2'b10
module rf_mux_480(
    input[1:0] WDSel,
    input[31:0] dout,
    input[31:0] aluout,
    input[31:0] PC_out,
    output reg [31:0] WD
    );
  
always @(*)begin
	case(WDSel)
		`WDSel_FromALU: WD<=aluout;
		`WDSel_FromMEM: WD<=dout;
		`WDSel_FromPC:  WD<=PC_out+4;
	endcase
end
endmodule
