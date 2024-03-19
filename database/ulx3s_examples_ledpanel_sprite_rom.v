module sprite_rom(
  input clk,
  input [6:0] addrx,
  input [4:0] addry,
  output [23:0] data0,
  output [23:0] data1
);

//  reg [4:0] store[0:4095];
  reg [4:0] store[0:8191];
  reg [23:0] palette[0:15];

  initial
  begin
		$readmemh("sprite.mem", store);
		$readmemh("palette.raw",palette);
  end

  wire [23:0] data0, data1;
  
  wire [6:0] ax;
  wire [4:0] ay;
  
  assign ax = addrx;
  assign ay = addry + 1;
  
  reg [3:0] pixel0, pixel1;
  
  always @(posedge clk) pixel0 <= store[ {1'b0, ay, ax } ];
  always @(posedge clk) pixel1 <= store[ {1'b1, ay, ax } ];
  
  assign data0 = palette[pixel0];
  assign data1 = palette[pixel1];

endmodule
