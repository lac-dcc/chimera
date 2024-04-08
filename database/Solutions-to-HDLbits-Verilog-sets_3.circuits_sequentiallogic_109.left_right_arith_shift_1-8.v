module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

	always @(posedge clk) begin
		if(load) q <= data;
		else begin
			if(ena) begin
				if(amount == 2'b00) q <= (q << 1);
				else if(amount == 2'b01) q <= (q << 8);
				else if(amount == 2'b10) begin
					if(q[63] == 0) q <= (q >> 1);
					else begin
						q <= (q >> 1);
						q[63] <= 1'b1;
					end
				end
				else begin
					if(q[63] == 0) q <= (q >> 8);
					else begin
						q <= (q >> 8);
						q[63:56] <= {8{1'b1}};
					end
				end
			end
		end
	end

endmodule
