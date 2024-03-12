module jmp_boot(
  input clk,
  input reset,
  input rd,
  output reg [7:0] data_out,
  output reg valid
);
  reg [1:0] state = 0;
  reg prev_rd = 0;
  always @(posedge clk)
  begin
	if (reset)
	begin
		state <= 0;
		valid <= 1;
		prev_rd <= 0;
	end
	else 
	begin
		if (rd && prev_rd==0)
		begin
			case (state)
				2'b00 : begin
						data_out <= 8'b11000011; // JMP 0xfd00
						state <= 2'b01;
						end
				2'b01 : begin
						data_out <= 8'h00;
						state <= 2'b10;
						end
				2'b10 : begin
						data_out <= 8'hFD;
						state <= 2'b11;
						end
				2'b11 : begin						
						state <= 2'b11;
						valid <= 0;
						end
			endcase
		end
		prev_rd = rd;
	end
  end
endmodule