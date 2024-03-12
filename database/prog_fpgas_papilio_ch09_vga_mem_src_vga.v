module vga(
    input CLK,  // Papilio 32MHz
    output HS, VS,
    output [9:0] x,
    output reg [9:0] y,
    output blank
    );

reg [9:0] xc;
 
// Horizontal 640 + fp 24 + HS 40 + bp 128 = 832 pixel clocks
// Vertical, 480 + fp 9 lines vs 3 lines bp 28 lines 
assign blank = ((xc < 192) | (xc > 832) | (y > 479));
assign HS = ~ ((xc > 23) & (xc < 65));
assign VS = ~ ((y > 489) & (y < 493));
assign x = ((xc < 192)?0:(xc - 192));

always @(posedge CLK)
begin
  if (xc == 832)
  begin
    xc <= 0;
    y <= y + 1;
  end
  else begin
    xc <= xc + 1;
  end
  if (y == 520)
  begin
    y <= 0; 
  end
end

endmodule
