// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

`timescale 1us / 1ns

task assert_cond(input condition, input [255:0] str);
begin
	if (!condition) begin 
		$strobe("ASSERTION FAILED! %s %b", str, condition); 
		wavetext <= str; 
		#HCLK $finish; 
	end
end
endtask

module demo_tb ();

	reg clk;
	reg rst_n;

	// module specific inputs and outputs here


	reg [1023:0] wavetext;
	integer scratch1;

	localparam CLK = 1;
	localparam HCLK = CLK * 0.5;
	localparam PDELAY = CLK * 0.001;
	localparam N_TESTS = 1000;


	// include duts here

	always #CLK clk = ~clk;

	initial begin
      	$dumpfile("build/demo_tb.fst");
      	$dumpvars(0, demo_tb);

	end

	task init();
		begin
			#HCLK rst_n <= 0;
			#HCLK rst_n <= 1;
			#HCLK;
		end
	endtask

	// include tasks here

	initial begin
      	clk <= 0;
      	rst_n <= 1;
      	wavetext <= "start of test";
      	$display("start of test");


      	$display("end of test");
		$finish;
	end

endmodule