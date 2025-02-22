module expression_00532(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = ({3{(-4'sd1)}}?((3'd2)&(4'sd1)):(4'd4));
  localparam [4:0] p1 = (-2'sd0);
  localparam [5:0] p2 = (({2{(5'd23)}}>{(2'sd0),(4'sd0),(3'd4)})?({1{(3'd5)}}?((-4'sd5)<(3'sd1)):((3'd3)<(5'sd14))):{4{(4'd11)}});
  localparam signed [3:0] p3 = {(^(2'sd1))};
  localparam signed [4:0] p4 = ((((5'sd12)>=(3'd1))===((4'd2)|(4'd1)))<{((5'd22)>>(2'd3)),((4'sd4)&(-2'sd1))});
  localparam signed [5:0] p5 = ({{(-3'sd2),(3'd7),(2'd2)},((4'sd6)>=(4'd10))}||(((-5'sd7)&(3'd6))<<{(5'sd15),(4'd9)}));
  localparam [3:0] p6 = (~&{{(2'd2),(5'd29),(3'sd3)},(-{2{(5'd8)}}),{3{(4'd12)}}});
  localparam [4:0] p7 = (((-4'sd6)>(4'd14))!=(3'sd2));
  localparam [5:0] p8 = {2{{4{(-2'sd1)}}}};
  localparam signed [3:0] p9 = (~&{1{({{2{(2'd1)}},(|(5'd7)),{(3'sd0),(-3'sd2),(5'd5)}}!={((-4'sd3)<=(2'sd0)),(~^(3'd0))})}});
  localparam signed [4:0] p10 = (((-5'sd2)==(2'd3))<<<((4'd2)==(3'd1)));
  localparam signed [5:0] p11 = ((3'sd3)^~(4'd15));
  localparam [3:0] p12 = {2{((-2'sd1)?(-3'sd3):(3'd6))}};
  localparam [4:0] p13 = ((5'sd14)?(4'd7):(5'sd1));
  localparam [5:0] p14 = ((^(5'd2 ** (4'd8)))?(~((3'sd1)?(-3'sd3):(-5'sd10))):((2'd2)?(4'd14):(-2'sd0)));
  localparam signed [3:0] p15 = {3{(-4'sd2)}};
  localparam signed [4:0] p16 = (((5'sd8)==(5'd2))<{(-5'sd10)});
  localparam signed [5:0] p17 = (&(5'd30));

  assign y0 = (((~|(^p14))-(p6<<<p10))<<($unsigned((b3^a2))!==((!a4))));
  assign y1 = ((p10?p7:p3)?(p15?p4:p7):(p9?p10:p10));
  assign y2 = (((2'd0)===(4'd4))>(+((p11+p17)&&(p15<<<p1))));
  assign y3 = (4'd11);
  assign y4 = ((p14^~a2)^~{p5,b0});
  assign y5 = ({4{a4}}>=((!p14)>={4{p7}}));
  assign y6 = (~^(~&((3'd7)?(^{2{p13}}):(p1?p12:b1))));
  assign y7 = (((p0>=p14)==(p16==p12))<((^(a2^~a3))^~(^(&a1))));
  assign y8 = (4'sd1);
  assign y9 = (2'd1);
  assign y10 = (~|($unsigned(({p1,p11,p15}?$signed(b1):(p3?p6:b1)))&&{((a5!=b3)===(4'd2 ** a0))}));
  assign y11 = {2{(~&{4{{2{a1}}}})}};
  assign y12 = (((+((p17^~p4)^~{p1,p15}))&&(~|(~^(~{p3,p13}))))<{(~^(p13>a3)),{b3,p7,p10},(p1^p4)});
  assign y13 = (^((p15?p1:p14)?(^(a3|a2)):{1{{4{a3}}}}));
  assign y14 = ((a4?p6:a0)?(^(a4<<<p7)):(p5?b1:b1));
  assign y15 = {1{((2'sd1)||(a5?a4:p1))}};
  assign y16 = ((p2>b4)==(p7?p1:p12));
  assign y17 = (2'd2);
endmodule
