//---------- song change control module -----------------
//------------- author : Dino --------------------------
module song_control(
	input CLK,
	input pre,
	input nxt,
	output reg [2:0] current
);
	parameter DELAY_TIME = 10000000;
	integer delay = 0;
	always @ (negedge CLK) begin 
		if(delay == DELAY_TIME) begin
			if(pre) begin
				current <= (current==0) ? 0: current-1;
				delay <= 0;
			end
			else if(nxt) begin
				current <= (current==3) ? 3: current+1;
				delay <= 0;
			end
		end
		else delay <= delay + 1;
	end
endmodule
