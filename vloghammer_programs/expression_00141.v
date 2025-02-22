module expression_00141(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (4'd14);
  localparam [4:0] p1 = ((!(4'd7))&&{2{((5'd13)>(5'sd9))}});
  localparam [5:0] p2 = (&((^(~|((5'sd8)!=(2'd3))))&&(((5'd11)%(4'sd7))<=((4'd8)&&(2'sd0)))));
  localparam signed [3:0] p3 = ((((5'd0)^(-4'sd5))||((5'd31)<<(2'd0)))==(((5'sd13)/(-2'sd1))?(5'd28):((5'd30)?(-5'sd7):(3'sd0))));
  localparam signed [4:0] p4 = (-((-4'sd5)^(-4'sd2)));
  localparam signed [5:0] p5 = (-2'sd0);
  localparam [3:0] p6 = ((4'd2 ** (5'd13))^(4'd2));
  localparam [4:0] p7 = (-3'sd2);
  localparam [5:0] p8 = (~|({2{((-3'sd3)!==(-3'sd1))}}^~{3{((-5'sd8)!==(4'd8))}}));
  localparam signed [3:0] p9 = ({4{(-3'sd1)}}?(((4'd0)?(-5'sd12):(4'sd0))<((-4'sd2)!==(5'sd15))):{3{((3'sd1)?(-5'sd3):(4'sd1))}});
  localparam signed [4:0] p10 = {2{(5'd2)}};
  localparam signed [5:0] p11 = ({((3'sd0)||(-5'sd6)),{4{(-4'sd4)}},((3'd3)>(4'd15))}>>>(~^{4{(4'd3)}}));
  localparam [3:0] p12 = {(^(((3'sd3)!==(2'sd1))<(~{(5'd27),(4'd4)}))),((-(-(2'd3)))&((5'd4)<<<(5'sd0)))};
  localparam [4:0] p13 = (^(~&(~&(~&(~&(2'd3))))));
  localparam [5:0] p14 = {4{(5'd2)}};
  localparam signed [3:0] p15 = (((4'd7)>>>(2'sd1))|((3'd2)!==(-2'sd0)));
  localparam signed [4:0] p16 = {2{(-5'sd13)}};
  localparam signed [5:0] p17 = ((((-3'sd0)<(2'sd1))-{1{(3'd1)}})<<(((-4'sd1)<=(5'd6))<<<((5'sd0)&(-5'sd10))));

  assign y0 = ($signed({2{$signed($unsigned(a5))}}));
  assign y1 = (2'd3);
  assign y2 = ({(~a0),{1{p17}}}<<<{(~^a0),(b3|b4)});
  assign y3 = {(2'd3),(2'd3)};
  assign y4 = $signed((((p5+p8)>>>(b4===a2))<<$signed($unsigned($signed(p9)))));
  assign y5 = (-(-2'sd1));
  assign y6 = (~^{2{{1{(b5?b1:p14)}}}});
  assign y7 = ((&p5)?{2{p5}}:{p4});
  assign y8 = {4{(a0|p16)}};
  assign y9 = (4'd0);
  assign y10 = ((3'd3)<=(((3'd6)<<(p17|a3))&((-2'sd1)&(p2^~p2))));
  assign y11 = ((3'sd0)==((-4'sd7)||((~^a0)!==(b2>b0))));
  assign y12 = ($signed({2{((a1>=a2)>>>{2{a3}})}})&&(((a2^~b1)&{4{b5}})^(&(~^(!$unsigned(p15))))));
  assign y13 = ($unsigned({4{({a0}!==(b1))}}));
  assign y14 = ($signed({2{(a2?p13:p1)}}));
  assign y15 = (((p4!=a1)?(b0?b0:a4):(a3?a4:b0))?((3'd2)===(2'sd0)):(|((b3&a2)===(a1&&b2))));
  assign y16 = {1{p16}};
  assign y17 = ((~&(+b3))/b4);
endmodule
