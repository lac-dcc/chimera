module expression_00213(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (~(&(((3'd2)?(2'd3):(-2'sd0))<=((3'd4)?(3'd7):(2'd2)))));
  localparam [4:0] p1 = (3'sd0);
  localparam [5:0] p2 = {(~|(!({(~|(2'sd0))}>{(4'sd1),(-2'sd0),(2'd3)})))};
  localparam signed [3:0] p3 = (-5'sd8);
  localparam signed [4:0] p4 = {(-(~|(^{(2'd2)}))),((~|(-2'sd0))?(^(-5'sd7)):(!(-3'sd0))),(4'd12)};
  localparam signed [5:0] p5 = {2{(((-3'sd1)&(-3'sd0))=={3{(-5'sd12)}})}};
  localparam [3:0] p6 = (4'd11);
  localparam [4:0] p7 = {((3'd0)&&(4'd2)),(-(-3'sd1)),((4'd2)?(2'd3):(3'sd2))};
  localparam [5:0] p8 = ((^(5'd19))?((2'd3)<<<(5'd23)):((2'sd1)?(3'd2):(-5'sd12)));
  localparam signed [3:0] p9 = ((~|(!(&{3{(-2'sd1)}})))<<<{2{((3'd1)!=(3'd4))}});
  localparam signed [4:0] p10 = ((((5'd4)<<<(2'd0))?((5'sd14)-(2'd0)):((-5'sd5)!=(3'sd2)))&(((-5'sd10)==(4'd5))&((3'd5)>(3'd4))));
  localparam signed [5:0] p11 = (((3'd5)?(-3'sd1):(3'd0))?((2'd1)?(-5'sd14):(3'd3)):((3'sd1)?(4'd3):(2'sd0)));
  localparam [3:0] p12 = (-2'sd0);
  localparam [4:0] p13 = (!(((3'sd1)?(-2'sd1):(2'd3))?(~(2'd3)):(!(3'd3))));
  localparam [5:0] p14 = {(&(~|(+{(4'd13),(4'sd4),(-5'sd3)}))),{((-(2'sd0))?{(4'sd5),(5'd26),(5'd31)}:{(4'd2)})}};
  localparam signed [3:0] p15 = ((4'd9)^~(-5'sd6));
  localparam signed [4:0] p16 = {4{(&{(-3'sd2),(2'sd0)})}};
  localparam signed [5:0] p17 = ((5'd2 ** ((4'd9)?(4'd12):(5'd15)))^((4'd13)?(-3'sd3):(3'sd3)));

  assign y0 = ((((4'd2 ** p14)>>(b1==a1))!=((p14<p2)-(~&p11)))<=({(^(b2|a1))}==={b1,b2,b1}));
  assign y1 = (!(&((~(~|b2))%p6)));
  assign y2 = {3{({p12,p10,p6}<={p13,p5,p6})}};
  assign y3 = (~({4{((&p9)|(&p6))}}));
  assign y4 = ((a1<b2)===(b0-b1));
  assign y5 = ((5'sd7)?(!(a1?p15:p6)):(~^(4'd2 ** p12)));
  assign y6 = ({2{(a3&&p5)}}+((a4?a0:p15)?(a4?p1:b4):{2{p7}}));
  assign y7 = ((a2?p1:p9)?(p17?p6:p16):(b1?p5:p12));
  assign y8 = ((a5&&b3)!=={2{a4}});
  assign y9 = (5'sd6);
  assign y10 = (3'd1);
  assign y11 = ((|(p11^b3))*(4'sd4));
  assign y12 = {2{($signed(a3)>={4{a1}})}};
  assign y13 = (^({{b4,a3},(b4&p12)}&(5'd2 ** {a2,p13})));
  assign y14 = (~^$signed((-(~^((2'sd1)!=(~&(p7&&p5)))))));
  assign y15 = {((b0?a0:b2)<<{1{a2}}),{{1{a2}},(b4>b3)}};
  assign y16 = ((~&b4)!={3{p6}});
  assign y17 = (2'sd0);
endmodule
