module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

	localparam [3:0] IDLE	= 0,
					 S1		= 1,
					 S11	= 2,
					 S110	= 3,
					 S1101	= 4,	//'S1101' and 'SHIFT0' can be regarded as one state.
					 SHIFT1 = 5,
					 SHIFT2 = 6,
					 SHIFT3 = 7,
					 COUNT  = 8,
					 DONE   = 9; 
	
	reg [3:0] state, next;
	reg [9:0] count_1000; 

	always @(*) begin
		case (state) 
			IDLE  : next = (data) ? S1    : IDLE;
			S1    : next = (data) ? S11   : IDLE;
			S11   : next = (data) ? S11   : S110;
			S110  : next = (data) ? S1101 : IDLE;
			S1101 : next = SHIFT1;
			SHIFT1: next = SHIFT2;
			SHIFT2: next = SHIFT3;
			SHIFT3: next = COUNT;
			COUNT : next = (count == 0 & count_1000 == 999) ? DONE : COUNT;
			DONE  : next = (ack) ? IDLE : DONE;			
		endcase
	end

	//state transition
	always @(posedge clk) begin
		if (reset) state <= IDLE;
		else state <= next;
	end

	//shift in and then down count.
	always @(posedge clk) begin
		case (state) 
			S1101 : count[3] <= data;
			SHIFT1: count[2] <= data;
			SHIFT2: count[1] <= data;
			SHIFT3: count[0] <= data;
			COUNT : begin
				if (count >= 0) begin
					if (count_1000 < 999) 
						count_1000 <= count_1000 + 1;
					else begin
						count <= count - 1;
						count_1000 <= 0;
					end
				end
			end
			default : count_1000 <= 0;
		endcase
	end

	assign counting = (state == COUNT);
	assign done = (state == DONE);


endmodule
