`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:15 06/01/2018 
// Design Name: 
// Module Name:    pc 
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
module pc(input clk,input rst,input [1:0]PC_s,input [31:0]R_Data_A,
input [31:0]imm_data,input [25:0]address,output [31:0]Inst_code,output [31:0]PC);
reg [31:0]PC;
wire[31:0]PC_new;
initial
    PC<=32'h00000000;
Inst_ROM Inst_ROM1 (
  .clka(clk),
  .addra(PC[7:2]), 
  .douta(Inst_code) 
);
assign PC_new=PC+4;
always@(negedge clk or posedge rst)
begin
  if(rst)
     PC<=32'h00000000;
  else 
   begin
	case(PC_s)
	2'b00:PC<=PC_new;
	2'b01:PC<=R_Data_A;
	2'b10:PC<=PC_new+(imm_data<<2);
	2'b11:PC<={PC_new[31:28],address,2'b00};
	endcase
end
end
endmodule

