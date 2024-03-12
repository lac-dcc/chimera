module vga_game(
    input CLK,
    input up_switch,
    input dn_switch,
    input left_switch,
    input right_switch,
    output HS,
    output VS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE
    );

wire [9:0] x, y;
wire blank;
reg [15:0] prescaler;

vga v(.CLK (CLK), .HS (HS), .VS (VS), .x (x), .y (y), .blank (blank));

reg [9:0] o_x = 320;
reg [9:0] o_y = 240;
wire object = x>o_x & x<o_x+30 & y>o_y & y<o_y+30;

wire border = (x>0 & x<10) | (x>630 & x<640) | (y>0 & y<10) | (y>470 & y<480);

assign RED = (border & ~ blank)?7:0;
assign GREEN = ((border | object) & ~ blank)?7:0;
assign BLUE = (border & ~ blank)?3:0;

always @(posedge CLK)
begin
  prescaler <= prescaler + 1;
  if (prescaler == 0)
  begin
    if (~ up_switch)
    begin
      o_y <= o_y - 1;
    end
    if (~ dn_switch)
    begin
      o_y <= o_y + 1;
    end
    if (~ left_switch)
    begin
      o_x <= o_x - 1;
    end
    if (~ right_switch)
    begin
      o_x <= o_x + 1;
    end
  end
end

endmodule
