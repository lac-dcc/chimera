// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

module ecc_block_tb;
	reg [31:0] PH_in;

	wire [23:0] PH_out;
	wire no_error, corrected_error, error;

	reg [23:0] PH_out_exp;
	reg error_exp;

	reg clk;
	integer fd, status;

	ecc_block DUT(PH_in, PH_out, no_error, corrected_error, error);

	// clock
	initial clk = 0;	
	always #10 clk=~clk;

	// files
	initial fd = $fopen("ecc_block_testvec.txt", "r");

	// data provider
	initial begin
		PH_in = 0;
		//@(posedge clk);
		while(!$feof(fd)) begin
			@(posedge clk);
			#1 status = $fscanf(fd, "%h, %h, %h\n",PH_in, PH_out_exp, error_exp);
			#4 $display("PH_in=%h, PH_out=%h, PH_out_exp=%h, error=%b, error_exp=%b", PH_in, PH_out, PH_out_exp, error, error_exp);
		end
		@(posedge clk);
		$fclose(fd);
		$finish;
	end

endmodule