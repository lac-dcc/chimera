module Testbench_SramTest;
	reg clock;
	reg wren;
	reg [14:0] address;
	reg [7:0] data;
	wire [7:0] read;
	
	always begin
		#50 clock = ~clock;
		$display($time, "%d : %b : %h", read, read, read);
	end
		
	always @ (posedge clock)
		address <= address + 1;
		
	SRAM sram(
		.clock(clock), 
		.address(address), 
		.data(data),
		.wren(wren),
		.q(read)
	);
	
	initial begin
		wren = 1'b0;
		clock = 1'b0;
		address = 15'b0;
		data = 8'b00110000;
		
		#21600 $finish;
	end
endmodule 