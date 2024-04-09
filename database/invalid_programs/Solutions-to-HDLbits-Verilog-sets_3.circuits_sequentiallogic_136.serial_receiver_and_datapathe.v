module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
	
    // Use FSM from Fsm_serial
    localparam [2:0] IDLE 	 = 3'b000,
					 START 	 = 3'b001,
					 RECEIVE = 3'b010,
					 WAIT	 = 3'b011,
					 STOP    = 3'b100;

	reg [2:0] state, next;
	reg [3:0] i;
	reg [7:0] out;

	always @(*) begin
		case(state)
			IDLE  : next = (in) ? IDLE : START;
			START : next = RECEIVE;
			RECEIVE : begin
				if (i == 8) begin
					if (in) next = STOP;
					else next = WAIT;
				end 
				else next = RECEIVE;			
			end
			WAIT : next = (in) ? IDLE : WAIT;
			STOP : next = (in) ? IDLE : START;
		endcase
	end

	always @(posedge clk) begin
		if(reset) state <= IDLE;
		else state <= next;
	end

	always @(posedge clk) begin
		if (reset) begin
			done <= 0;
			i <= 0;
		end
		else begin
			case(next) 
				RECEIVE : begin
					done <= 0;
					i = i + 1;
				end
				STOP : begin
					done <= 1;
					i <= 0;
				end
				default : begin
					done <= 0;
					i <= 0;
				end
			endcase
		end
	end

    // New: Datapath to latch input bits.
    always @(posedge clk) begin
    	if (reset) out <= 0;
    	else if (next == RECEIVE)
    		out[i] <= in;
    end

    assign out_byte = (done) ? out : 8'b0;

endmodule
