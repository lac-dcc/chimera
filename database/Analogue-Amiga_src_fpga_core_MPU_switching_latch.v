// This is a switching reg over two clock domains

module switching_latch (
	input          clk,        // the system clock
	input          int_clk,    // the interupt clock domain
	input          reset_n,
	input          trigger,
	input          ack,
	output reg     out
);

reg ack_clk_1; // Doing a 3 stage sync between the clock domains - Fuck I hate these.......
// But this "should" help with different clocks on both sides.
reg interupt_int_clk_1;
always @(posedge int_clk or negedge reset_n) begin
    if (~reset_n) begin
        interupt_int_clk_1 <= 'b0;
    end
    else begin
			if (trigger) interupt_int_clk_1 <= 1'b1;
			else if (out) interupt_int_clk_1 <= 1'b0;
    end
end

always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        out <= 'b0;
    end
    else begin
		  if (interupt_int_clk_1) out <= 1'b1;
        else if (ack) out <= 1'b0;
    end
end

endmodule