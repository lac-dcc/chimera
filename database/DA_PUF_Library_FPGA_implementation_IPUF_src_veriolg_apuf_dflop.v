
// D Flip-Flop


module dflop(clk,din,dout);
	
	input clk;
	input din;
	output reg dout;
    
	always @(posedge clk) begin
		dout <= din;	
	end
	
endmodule

