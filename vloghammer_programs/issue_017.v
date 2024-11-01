module issue_017(ctrl, y);
  input [1:0] ctrl;
  output [5:0] y;

  wire [2:0] y0;
  wire [2:0] y1;
  assign y = {y0,y1};

  // this should return 3'b001 but isim 14.7 returns 3'b000
  assign y0 = &($signed(2'b11));
  assign y1 = &($unsigned(2'b11));
endmodule
