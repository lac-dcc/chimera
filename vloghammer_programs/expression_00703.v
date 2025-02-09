module expression_00703(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
  input [3:0] a0;
  input [4:0] a1;
  input [5:0] a2;
  input signed [3:0] a3;
  input signed [4:0] a4;
  input signed [5:0] a5;

  input [3:0] b0;
  input [4:0] b1;
  input [5:0] b2;
  input signed [3:0] b3;
  input signed [4:0] b4;
  input signed [5:0] b5;

  wire [3:0] y0;
  wire [4:0] y1;
  wire [5:0] y2;
  wire signed [3:0] y3;
  wire signed [4:0] y4;
  wire signed [5:0] y5;
  wire [3:0] y6;
  wire [4:0] y7;
  wire [5:0] y8;
  wire signed [3:0] y9;
  wire signed [4:0] y10;
  wire signed [5:0] y11;
  wire [3:0] y12;
  wire [4:0] y13;
  wire [5:0] y14;
  wire signed [3:0] y15;
  wire signed [4:0] y16;
  wire signed [5:0] y17;

  output [89:0] y;
  assign y = {y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17};

  localparam [3:0] p0 = ((((~&(2'd0))<={(-5'sd3),(3'd4)})|{(4'd15),(5'd28),(4'd1)})==(5'sd4));
  localparam [4:0] p1 = ((5'd13)>(4'sd7));
  localparam [5:0] p2 = ((2'd2)*((3'd5)&(4'sd5)));
  localparam signed [3:0] p3 = (&((((-2'sd0)>>>(-5'sd9))^~((-5'sd11)|(3'sd0)))|(((-4'sd0)*(4'd0))?((3'd6)&&(3'd7)):((2'sd0)&(-2'sd1)))));
  localparam signed [4:0] p4 = {{3{(-4'sd1)}},(((3'd0)<(3'd3))+{1{(-2'sd0)}})};
  localparam signed [5:0] p5 = {2{((-3'sd3)?{(5'd9),(5'd5)}:{(-5'sd14),(-4'sd0)})}};
  localparam [3:0] p6 = ((2'd1)?((4'sd2)?(5'd9):(-3'sd1)):(+(+(~^(2'd1)))));
  localparam [4:0] p7 = {3{{1{((5'd30)?(5'd25):(-3'sd1))}}}};
  localparam [5:0] p8 = (~(((3'd3)!=(5'd12))&((-5'sd3)===(2'sd1))));
  localparam signed [3:0] p9 = ((-5'sd9)||(5'sd11));
  localparam signed [4:0] p10 = (+{4{{4{(-4'sd0)}}}});
  localparam signed [5:0] p11 = (^(^(-3'sd2)));
  localparam [3:0] p12 = (((-5'sd11)%(-3'sd2))&(2'd0));
  localparam [4:0] p13 = ((-((2'sd1)*(4'd0)))^(-4'sd7));
  localparam [5:0] p14 = (&((+(3'd6))<<((-2'sd0)==(-4'sd6))));
  localparam signed [3:0] p15 = (4'd14);
  localparam signed [4:0] p16 = (~^(^{{{(5'd5),(-3'sd0)},((2'sd0)&&(-3'sd2)),(~|(4'd10))},({(2'sd0),(5'd1)}|(~(3'd2))),(-((-(5'sd6))&&((2'd3)&(5'sd1))))}));
  localparam signed [5:0] p17 = (((5'd2 ** (4'd9))>=(~^(4'd11)))>>>(((5'd29)>(4'sd7))!=={3{(4'd11)}}));

  assign y0 = (^(~&(5'd2 ** (5'd31))));
  assign y1 = (({1{(4'd3)}}>>>((3'd2)<(p15!=p15)))<{3{(p7!=p4)}});
  assign y2 = {{(|(p4>p14)),(~&(a5!==b1))}};
  assign y3 = (((p6?p17:p16)>>>(4'd2 ** p2))<((b4?p16:p1)>>{p16}));
  assign y4 = (({1{(b4>>a1)}}?{3{a3}}:{3{a1}})<<({3{b4}}?{a2,a3,a5}:(a4?a4:b4)));
  assign y5 = (a1?p15:a1);
  assign y6 = {(!(^(4'd4)))};
  assign y7 = (~|(~&(3'sd3)));
  assign y8 = (^p4);
  assign y9 = (&{1{(~^(~^{4{{4{b5}}}}))}});
  assign y10 = {3{p11}};
  assign y11 = (&(4'd2));
  assign y12 = {3{($signed(p14)?{4{p1}}:$signed(p7))}};
  assign y13 = (4'sd5);
  assign y14 = ((|((~&(b1?b4:a2))?(p9>>p4):(p13?a1:p2)))<<<(|(-(((a0?a2:a5)==(~&b0))!==((b5?b4:a5)==(~|a2))))));
  assign y15 = (-(p5?b5:p17));
  assign y16 = (5'd19);
  assign y17 = (+((~(-5'sd8))>>(4'sd0)));
endmodule
