module sprite_rom(
  input clk,
  input [11:0] addr,
  output reg [7:0] data_out
);

  reg [3:0] store[0:4095];
  wire [7:0] palette[0:15];

  assign palette[0] = 8'h00;
  assign palette[1] = 8'h20;
  assign palette[2] = 8'h20;
  assign palette[3] = 8'h20;
  assign palette[4] = 8'h40;
  assign palette[5] = 8'h40;
  assign palette[6] = 8'h40;
  assign palette[7] = 8'h80;
  assign palette[8] = 8'h80;
  assign palette[9] = 8'h80;
  assign palette[10] = 8'h80;
  assign palette[11] = 8'h80;
  assign palette[12] = 8'h80;
  assign palette[13] = 8'hff;
  assign palette[14] = 8'hff;
  assign palette[15] = 8'hff;  

  initial
  begin
		$readmemh("sprite.mem", store);
  end

  always @(posedge clk)
	  data_out <= palette[store[addr]];
endmodule
