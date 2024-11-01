module issue_007(a, y);
  input [3:0] a;
  wire [3:0] y0;
  wire [3:0] y1;
  wire [3:0] y2;
  wire [3:0] y3;
  output [15:0] y;
  assign y = {y0,y1,y2,y3};
  // constant evaluation of width-extension with undefs
  localparam [1:0] p0 = |(1/0);
  localparam [1:0] p1 = (|1)/(|0);
  assign y0 = p0;         // 4'b000x
  assign y1 = p1;         // 4'b00xx
  assign y2 = |(1/0);     // 4'b000x
  assign y3 = (|1)/(|0);  // 4'bxxxx
endmodule
