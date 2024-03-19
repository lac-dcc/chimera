
module sync_dd_c(
	input 	wire clk,
	input 	wire reset_, 
	input 	wire sync_in, 
	output	wire sync_out
	);

	reg	sync_in_p1;
	reg	sync_in_p2;

	always @(posedge clk)
	begin
		if (!reset_) begin
			sync_in_p1 	<= 1'b0;
			sync_in_p2 	<= 1'b0;
		end
		else begin
			sync_in_p1 	<= sync_in;
			sync_in_p2 	<= sync_in_p1;
		end
	end

	assign sync_out = sync_in_p2;

endmodule
