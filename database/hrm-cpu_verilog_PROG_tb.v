`default_nettype none

// Use of `define allows override from iverilog using -Dkey=value
`ifndef PROGRAM
`define PROGRAM "dummy_prg.hex"
`endif

module PROG_tb();

	reg [7:0] Addr;

	wire [7:0] Data;

	localparam SIZE=256;

	// Instanciate DUT
	PROG program0 (.Addr(Addr), .clk(clk), .Data(Data));
	defparam program0.PROGRAM = `PROGRAM;

	// Simulate clock
	reg clk  = 0;
    always #1 clk = ~clk;

	// start simulation
	initial begin
		$dumpfile("PROG_tb.vcd");
		$dumpvars(0, PROG_tb);

		#2;

        for (Addr=0; Addr<SIZE-1; Addr=Addr+1)
        begin
            #2;
        end

		# 10
		$finish;

	end

endmodule
