`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:21 11/16/2018 
// Design Name: 
// Module Name:    mux 
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
module mux(
	 input [4:0] rt,
    input [4:0] rd,
    input [31:0] RD2,
    input [31:0] imm32,
    input [31:0] Result,
    input [15:0] imm16,
	 input [31:0] RD,
	 input [31:0] PC,
	 input [1:0] RegDst,
	 input ALUSrc,
	 input [1:0] MemToReg,
	 input [31:0] PC4,
	 input [31:0] PCbeq,
	 input [31:0] PCj,
	 input Zero,
	 input Branch1,
	 input Branch2,
	 input Branch3,
	 input [5:0] op,
	 input [5:0] func,
    output reg[4:0] WA,
	 output reg[31:0] B,
	 output reg[31:0] WD,
	 output reg[31:0] next_pc
    );

	reg [31:0] Choice1;
	reg [31:0] Choice2;
	//wire Branch3 = !op[5]&&!op[4]&&!op[3]&&!op[2]&&!op[1]&&!op[0]&&!func[5]&&!func[4]&&func[3]&&!func[2]&&!func[1]&&!func[0];//001000  if_jr
	always@(*) begin
		case(RegDst) 
			2'b00: WA<=rt;
			2'b01: WA<=rd;
			2'b10: WA<=5'b11111;
			2'b11: WA<=0;
		endcase
		
		case(ALUSrc) 
			1'b0: B<=RD2;
			1'b1: B<=imm32;
		endcase
		
		case(MemToReg) 
			2'b00: WD<=Result;
			2'b01: WD<={imm16,{16{1'b0}}};
			2'b10: WD<=RD;
			2'b11: WD<=PC+4;
		endcase
		
		if(Zero&&Branch1) begin
			Choice1 <= PCbeq;
		end
		else begin
			Choice1 <= PC4;
		end
		if(Branch2) begin
			Choice2 <= PCj;
		end
		else begin
			Choice2 <= Choice1;
		end
		if(Branch3) begin
			next_pc <= Result;
		end
		else begin
			next_pc <= Choice2;
		end
	end
endmodule
