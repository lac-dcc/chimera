// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* testbench for ph_finder module
 * Gedeon Nyengele <nyengele@stanford.edu>
 * Jan 12 2018
 */

module ph_finder_tb;
	reg clk, reset, din_valid;
	reg [15:0] din;
	wire [31:0] dout;
	wire dout_valid, ph_select;

	integer fd, status;
	reg [31:0] d_exp;
	reg v_exp, ph_exp;

	ph_finder DUT(clk, reset, din, din_valid, dout, dout_valid, ph_select);

	// clock
	initial begin
		clk = 0; reset = 1;
		repeat(4) #10 clk = ~clk;
		reset = 0;
		forever #10 clk = ~clk;
	end

	// files
	initial begin
		fd = $fopen("ph_finder_testvec.txt", "r");
	end

	// data provider
	initial begin
		din = 0; din_valid = 1;
		@(negedge reset);
		while(!$feof(fd)) begin
			status = $fscanf(fd, "%h, %h, %h, %h, %h\n", din, din_valid, d_exp, v_exp, ph_exp);
			@(posedge clk);
			#1 $display("input=%h, output=%h, output_exp=%h, v=%b, v_exp=%b, ph_sel=%b, ph_sel_exp=%b",
				din, dout, d_exp, dout_valid, v_exp, ph_select, ph_exp);
		end
		@(posedge clk);
		$fclose(fd);
		$finish;
	end
endmodule