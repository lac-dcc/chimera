module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

	localparam [1:0] A = 2'b01,
					 B = 2'b10;

	reg [1:0] state, next;

	always @(*) begin
		case (state) 
			A : begin
				if (x) begin
					next = B;
					z =1;
				end
				else begin
					next = A;
					z = 0;
				end
			end
			B : begin
				next = B;
				z = (x) ? 0 : 1;
			end
		endcase
	end

	always @(posedge clk or posedge areset) begin
		if (areset) state <= A;
		else state <= next;
	end
endmodule
