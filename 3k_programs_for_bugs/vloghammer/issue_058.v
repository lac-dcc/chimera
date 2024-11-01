module issue_058(a, y);
  input [1:0] a;
  output [3:0] y;

  // this is expected to set y[3:1] = {2'b01, a[1]} and y[0] = don't care,
  // but Vivado 2018.3 generates y[3:1] = {2'b1z, a[1]}.

  wire [1:0] y0;
  wire [1:0] y1;
  assign y = {y0,y1};

  localparam [1:0] p1 = 1;
  localparam [1:0] pX = 1 % 0;

  assign y0 = a ? p1 : p1;
  assign y1 = a ^ (a != pX);
endmodule
