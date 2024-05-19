// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

module testbench();

	reg clk;

	always #5 clk = (clk === 1'b0);

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, testbench);

		repeat (10) begin
			repeat (50000) @(posedge clk);
			$display("+50000 cycles");
		end
		$finish;
	end

	wire [7:0] led;

    wire uart_tx;
    reg  uart_rx;

	always @(led) begin
		#1 $display("%b", led);
	end

	led_uart_soc uut (
		.clk      (clk      ),
		.led      (led      ),
        .uart_rx  ( uart_rx ),
        .uart_tx  ( uart_tx )
	);
endmodule
