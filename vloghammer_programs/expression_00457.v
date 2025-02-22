module expression_00457(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {1{((|(~|{(4'sd4),(-2'sd0)}))!=(((5'sd0)!=(4'sd5))>>((3'd6)>(-3'sd3))))}};
  localparam [4:0] p1 = (~|(~|((((-3'sd0)<<(3'd3))<=((-5'sd9)!=(3'sd1)))^~(^((-2'sd1)?(3'd4):(5'd24))))));
  localparam [5:0] p2 = (-4'sd2);
  localparam signed [3:0] p3 = {(5'd20)};
  localparam signed [4:0] p4 = (((-4'sd4)!=(5'sd6))+{1{((5'sd2)!==(4'd2))}});
  localparam signed [5:0] p5 = ((~((-2'sd1)?(2'sd0):(4'd12)))?{(5'd12),(5'd1),(5'd1)}:((-3'sd0)?(5'd6):(3'd0)));
  localparam [3:0] p6 = ((((-5'sd5)|(5'd6))|((2'sd0)<<<(5'd19)))|{(((4'd10)?(5'd1):(5'd4))&((5'sd2)?(-2'sd0):(-3'sd1)))});
  localparam [4:0] p7 = (((3'd1)?(3'd5):(-4'sd7))?((-5'sd8)-(5'sd8)):((4'd15)<<<(4'd15)));
  localparam [5:0] p8 = {({1{(~&(3'sd1))}}-{1{(+(4'd12))}}),(3'sd2)};
  localparam signed [3:0] p9 = ((((-5'sd10)?(2'sd0):(-3'sd2))?((-4'sd6)?(-5'sd15):(4'd15)):((4'sd0)?(2'sd1):(4'd11)))?(((5'sd3)?(2'd2):(3'd2))?((5'sd4)?(-5'sd10):(-5'sd10)):((5'd29)?(4'sd4):(3'd3))):(((5'd2)?(4'd10):(4'd14))?((5'd26)?(-2'sd1):(-5'sd6)):((2'd1)?(2'd2):(5'd17))));
  localparam signed [4:0] p10 = (((-4'sd7)<(4'd7))>=(5'd20));
  localparam signed [5:0] p11 = (4'd4);
  localparam [3:0] p12 = ((&(~|(~(-(-((2'sd1)^(2'd2)))))))&(&(&(((4'd5)>=(3'd6))&(~^(4'sd2))))));
  localparam [4:0] p13 = (-(~(3'd1)));
  localparam [5:0] p14 = (((-4'sd5)!=(3'd0))+(~|(2'sd0)));
  localparam signed [3:0] p15 = {((-4'sd0)>>(5'sd0)),{(-4'sd5),(5'd29)},{3{(-2'sd1)}}};
  localparam signed [4:0] p16 = ((2'sd1)?(4'd4):(3'd7));
  localparam signed [5:0] p17 = (6'd2 ** ((4'd14)||(5'd21)));

  assign y0 = (((+(!(+a3)))&((4'd3)>(~&b5)))+((3'd6)&(-2'sd0)));
  assign y1 = {1{{4{(~({3{p11}}>=(p1>a4)))}}}};
  assign y2 = ($signed((+(b2?a2:p3)))?{p10,p12,p3}:{$signed(p4),(~&b0)});
  assign y3 = (p5);
  assign y4 = ({{3{b2}},(b4>p2),$unsigned((p2<p3))}!={((p3!=p1)<<<(p10!=p4)),({4{b2}}||{4{a5}})});
  assign y5 = ({{(a5&p0)},$signed({b0,p0}),{$signed(p0)}}||{(b0^~a0),{p13,p1,p10},{p10,a3}});
  assign y6 = (b1<=p2);
  assign y7 = ((((p9|p6)==(p9!=p16))<((p0>>>b1)!=(a1+b5)))^(((b5!==a2)===(b3||b4))>=((a3&&b3)===(b5|b4))));
  assign y8 = ((b5>a5)&&{2{p15}});
  assign y9 = (-(5'd2 ** (b0^~p12)));
  assign y10 = (|(((a5+a3)+(~&p16))?(b0?a5:a1):(b2?a3:b3)));
  assign y11 = {3{{2{a5}}}};
  assign y12 = (2'sd0);
  assign y13 = (((a2||b0)&&(a2?a4:a4))?((a5)!=(b5|b1)):(5'd2 ** (b2?a1:b2)));
  assign y14 = (+{{a5,a2,b1},($unsigned(b1)>>>(+a1)),((b4^a5)>{b4,b1})});
  assign y15 = {{4{p12}},(3'd4),{a2,p9}};
  assign y16 = ((5'd2 ** b0)<<<(a0^b4));
  assign y17 = {4{(a4?a2:a4)}};
endmodule
