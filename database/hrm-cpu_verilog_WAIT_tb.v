module WAIT_tb;

	// input signals
	reg [7:0]  din = 0;
	reg        start = 0;
	// output signals
	wire       busy;
	// generic signals
	reg        clk = 0;
	reg        rst = 1;

    // Instanciate DUT
    WAIT WAIT0 (
        .din(din),
        .start(start),
        .busy(busy),
        .clk(clk),
        .rst(rst)
    );

    // Simulate clock
    always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile(  "WAIT_tb.vcd");
        $dumpvars(0, WAIT_tb);

        #4  rst = 0;

        #4  din = 8'h 03;

        #4  start = 1;
        #2  start = 0;

        #500 $finish;
    end

endmodule

