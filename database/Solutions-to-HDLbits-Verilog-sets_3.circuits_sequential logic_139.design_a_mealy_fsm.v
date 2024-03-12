module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

	localparam [1:0] IDLE     = 0,
					 ONE      = 1,
					 ONE_ZERO = 2;

	reg [1:0] state, next;

	always @(*) begin
		case (state)
			IDLE : begin 
				next = (x) ? ONE : IDLE;
				z = 0;
			end
			ONE : begin
				next = (x) ? ONE : ONE_ZERO;
				z = 0;
			end
			ONE_ZERO : begin
				if (x) begin
					next = ONE;
					z = 1;
				end
				else begin
					next = IDLE;
					z = 0;
				end
			end
		endcase
	end

	always @(posedge clk or negedge aresetn) begin
		if (~aresetn) state <= IDLE;
		else state <= next;
	end

endmodule
