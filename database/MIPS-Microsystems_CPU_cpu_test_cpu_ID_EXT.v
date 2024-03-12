`include "Op.v"

module EXT(EXTOp,Ins,Ext);
//interface
	input [31:0] EXTOp;

	input [31:0] Ins;
	
	output reg [31:0] Ext;

//logic		
	wire [15:0] Imm;
	
	assign Imm=Ins[15:0]; 
	
	always @(*)
		begin
			Ext=0;
			case(EXTOp)
				`zero_ext:Ext=Imm;
				`sign_ext:Ext=$signed(Imm);
				`rear_ext:Ext={Imm,16'b0};
			endcase
		end
	
endmodule
