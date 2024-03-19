module sprite_rom(
  input clk,
  input [11:0] addr,
  output reg [23:0] data_out
);

  reg [3:0] store[0:4095];
  wire [23:0] palette[0:15];

  assign palette[0] = 24'h000000;
  assign palette[1] = 24'h180002;
  assign palette[2] = 24'h240001;
  assign palette[3] = 24'h390100;
  assign palette[4] = 24'h530000;
  assign palette[5] = 24'h710000;
  assign palette[6] = 24'h8a0000;
  assign palette[7] = 24'ha20000;
  assign palette[8] = 24'hba0000;
  assign palette[9] = 24'hdd0002;
  assign palette[10] = 24'hff0000;
  assign palette[11] = 24'hff3031;
  assign palette[12] = 24'hff5f62;
  assign palette[13] = 24'hff8d8b;
  assign palette[14] = 24'hffcccb;
  assign palette[15] = 24'hffffff;  

  initial
  begin
		$readmemh("sprite.mem", store);
  end

  always @(posedge clk)
	  data_out <= palette[store[addr]];
endmodule
