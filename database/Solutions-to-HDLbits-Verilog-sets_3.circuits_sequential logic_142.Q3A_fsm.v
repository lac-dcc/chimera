module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

	localparam A = 0,
			   B = 1;

	reg state, next;
	reg [2:0] cnt;
	reg [2:0] w_record;

	always @(*) begin
		case(state)
			A : next = (s) ? B : A;
			B : next = B;
		endcase
	end

	always @(posedge clk) begin
		if (reset) begin
			state <= A;
		end
		else state <= next;
	end

	always @(posedge clk) begin
		if (reset) w_record <= 0;
		else if (state == B) 
			w_record <= {w_record[1:0], w}; //update the record of w.
	end

	always @(posedge clk) begin
		if (reset) cnt <= 0;
		else if (next == B) begin
			if (cnt == 3) 
				cnt <= 1;
			else 
				cnt <= cnt + 1;
		end
	end

	assign z = ((cnt == 1) & ((w_record == 3'b011) | (w_record == 3'b101) | (w_record == 3'b110)));


endmodule
