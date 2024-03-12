module timer_core(
	input 				clk_sys,
	input 				millisecond_counter_reset,
	output reg [31:0] millisecond_counter,
	output reg [31:0] millisecond_tick,
	output reg [31:0] millisecond_real,
	input 	  [31:0] sysclk_frequency,
	input 	  [31:0] interupt_counter,
	output reg 			interupt_output
);

// Timer for the cpu to make sure things are in time


reg        timer_tick;

always @(posedge clk_sys or posedge millisecond_counter_reset) begin
    if (millisecond_counter_reset) begin
		millisecond_tick <= 'd0;
		millisecond_counter <= 'd0;
		interupt_output	<= 'd0;
		millisecond_real	<= 'd0;
	 end
	 else begin
		 millisecond_tick <= millisecond_tick + 1;
		 millisecond_real <= millisecond_real + 1;
		 if (millisecond_tick == sysclk_frequency) begin
			  if (millisecond_counter >= interupt_counter) begin
					interupt_output <= |{interupt_counter};
			  end
			  millisecond_counter <= millisecond_counter + 1;
			  millisecond_tick <= 'h00000;
		 end
	 end
end

endmodule