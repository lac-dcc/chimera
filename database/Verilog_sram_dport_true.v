// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 TRUE DUAL PORT RAM
************************************************/
module sram(q_a, q_b, data_a, data_b, addr_a, addr_b, we_a, we_b, clk);
	input [7:0] data_a, data_b;
	input [5:0] addr_a, addr_b;
	input we_a, we_b, clk;
	output reg [7:0] q_a, q_b;

	reg [7:0] sram[63:0];
	
	// Port A
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			sram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= sram[addr_a];
		end
	end
	
	// Port B
	always @ (posedge clk)
	begin
		if (we_b)
		begin
			sram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else
		begin
			q_b <= sram[addr_b];
		end
	end
	
endmodule