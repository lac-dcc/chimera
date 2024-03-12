module vga_mem(
    input CLK,
    output HS,
    output VS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE
    );

wire [9:0] x, y;

reg [7:0] mem[4799:0]; // 80 x 60 (8x8 pixels on 640x480)
wire [12:0] mem_index;
wire [7:0] color;

initial begin
  $readmemh("flag.txt", mem);
end

vga v(.CLK (CLK), .HS (HS), .VS (VS), .x (cx), .y (y), .blank (blank));

assign mem_index = (y / 8) * 80 + x / 8; // divide y first to lose LSBs
assign color = mem[mem_index];
assign RED = (blank?0:color[7:5]);
assign GREEN = (blank?0:color[4:2]);
assign BLUE = (blank?0:color[1:0]);

endmodule
