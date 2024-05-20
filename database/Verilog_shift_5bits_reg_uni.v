// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 5-bit UNIVERSAL SHIFT REGISTER
************************************************/

module USR(PO,PI,sel,clk,rst,SI);
	input [1:0] sel;
	input [4:0] PI;
	input  clk, rst,SI;
	output reg[4:0] PO; 
	
	
	always@(posedge clk)
	if (rst) 
		PO <= 5'd0;
	else begin case(sel)
	
			2'b00 : PO <= PO;
			2'b01 : PO <= {PO[3:0],SI};
			2'b10 : PO <= {SI,PO[4:1]};
			2'b11 : PO <= PI;  
			default : PO <= 0;
	
		endcase
		end
	assign SO = (sel == 2'b01) ? PO[4] : PO[0] ;

	
endmodule