// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`include "Op.v"

module ALU(ALUOp,Ins,A,B,RST,byte_addr,overflow);
//interface
	input [31:0] ALUOp;
	
	input [31:0] Ins;
	
	input [31:0] A;
	input [31:0] B;
	
	output reg [31:0] RST;
	
	output [1:0] byte_addr;

	output reg overflow;
	
//logic		
	wire [10:6] shamt;

	reg [63:0] RST_ext;	//judge overflow
	
	integer i;
	integer count;
	
	assign shamt=Ins[10:6];
	
	always @(*)
		begin
			RST=0;
			overflow=0;
			case(ALUOp)
				`alu_add:
					begin
						RST=A+B;
						RST_ext=$signed(A)+$signed(B);
						if($signed(RST)==$signed(RST_ext))overflow=0;
						else overflow=1;
					end
				`alu_sub:
					begin
						RST=A-B;
						RST_ext=$signed(A)-$signed(B);
						if($signed(RST)==$signed(RST_ext))overflow=0;
						else overflow=1;
					end
				`alu_or:RST=A|B;
				`alu_slt:RST=($signed(A)<$signed(B));
				`alu_sltu:RST=(A<B);
				`alu_lb:RST=((A+B)>>2)<<2;
				`alu_sll:RST=B<<shamt;
				`alu_load_i:RST=B;
				`alu_and:RST=A&B;
				`alu_xor:RST=A^B;
				`alu_sllv:RST=B<<(A[4:0]);
				`alu_sra:RST=$signed(B)>>>shamt;
				`alu_srlv:RST=B>>(A[4:0]);
				`alu_nor:RST=~(A|B);
				`alu_srav:RST=$signed(B)>>>(A[4:0]);
				`alu_srl:RST=B>>shamt;
				`alu_movz:RST=A;
				`alu_clz:
					begin
						/*
						i=31;
						count=0;
						while(A[i]==0&&i>=0)
							begin
								count=count+1;
								i=i-1;
							end
						*/
						RST=0;
					end
			endcase
		end
		
	assign byte_addr=(A+B)%4;

endmodule
