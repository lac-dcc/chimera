// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

`timescale 1ns / 10ps

module core_tb;

	reg clk;
	reg rst_n;

	reg [1023:0] wavetext;
	integer scratch1;

	localparam CLK = 1;
	localparam QCLK = CLK * 0.25;
	localparam PDELAY = CLK * 0.001;
	localparam N_TESTS = 1000;

	// include duts here
	core  core_u (
		.clk(clk),
		.rst_n(rst_n)
	);
	
	integer idx;	

	always #CLK clk = ~clk;

	initial begin
      	$dumpfile("build/core_tb.fst");
      	$dumpvars(0, core_tb);
      	for (idx = 1; idx < 32; idx = idx + 1) $dumpvars(0, core_u.regfile_u.x[idx]);
      	for (idx = 0; idx < 4; idx = idx + 1) $dumpvars(0, core_u.memory_u.mem[idx]);
      	for (idx = 0; idx < 4; idx = idx + 1) $dumpvars(0, core_u.instrmem_u.mem[idx]);
	end
	// include tasks here

	task assert_cond(input condition, input [255:0] str);
		begin
			if (!condition) begin 
				$strobe("ASSERTION FAILED! %s %b", str, condition); 
				wavetext <= str; 
				#CLK $finish; 
			end
		end
	endtask

	task init();
		begin
			#QCLK rst_n <= 0;
			#QCLK rst_n <= 1;
		end
	endtask

	initial begin
      	clk <= 0;
      	rst_n <= 1;
      	$display("start of test");

      	init();
      	#100;
      	$display("end of test");
		$finish;
	end

endmodule