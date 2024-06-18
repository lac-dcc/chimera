// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ps/1ps

module tb_top ();

    reg sys_clk;
    reg [2:0] addr;
	wire [15:0] data;

	top top_inst (
		.sys_clk (sys_clk),
        .addr (addr),
		.data (data)
	);

    initial begin
        sys_clk = 1'b0;
        addr = 3'b0;
        #5000
        $finish;
    end

    always #1 sys_clk = ~sys_clk;
    always #2 addr = addr + 3'b1;

endmodule
