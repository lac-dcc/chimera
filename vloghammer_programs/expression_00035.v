module expression_00035(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (+(({4{(-3'sd0)}}<(-((-4'sd0)?(-4'sd6):(-5'sd3))))<=({4{(4'd15)}}<(~^{1{(4'd7)}}))));
  localparam [4:0] p1 = (~^((-((-3'sd2)||(5'd8)))?(~^((-5'sd4)<=(4'd8))):((2'sd1)?(2'd1):(-2'sd1))));
  localparam [5:0] p2 = (((-3'sd2)<=(2'd1))>>(!(3'd4)));
  localparam signed [3:0] p3 = ((3'sd1)?(4'd3):({3{(5'd31)}}<{(-3'sd1),(-3'sd1)}));
  localparam signed [4:0] p4 = ({(4'd10)}?{(2'sd1)}:((2'd3)?(4'd9):(3'd3)));
  localparam signed [5:0] p5 = ((+(~&(-2'sd1)))?(^((-4'sd7)?(3'd6):(2'sd0))):(~(!(4'sd4))));
  localparam [3:0] p6 = (4'd13);
  localparam [4:0] p7 = (~{3{(5'd8)}});
  localparam [5:0] p8 = (^{((-2'sd0)<(-4'sd6)),((2'sd0)===(4'd6)),(&(-4'sd2))});
  localparam signed [3:0] p9 = (((5'd19)>>>(2'sd0))>={(2'd0),(3'd3)});
  localparam signed [4:0] p10 = {2{(2'sd0)}};
  localparam signed [5:0] p11 = (^{(3'd4),(5'd27)});
  localparam [3:0] p12 = (((~^{4{(-2'sd1)}})^~(!((3'sd1)&(2'd2))))<<<(((4'sd4)!==(4'd7))>>>(-{1{(5'd1)}})));
  localparam [4:0] p13 = {3{((2'd3)^(-2'sd0))}};
  localparam [5:0] p14 = {(-4'sd2),{((2'd2)|(5'sd3)),((5'd23)>>>(2'sd1)),(!(3'sd0))}};
  localparam signed [3:0] p15 = (!{3{(|(3'sd0))}});
  localparam signed [4:0] p16 = (+((-2'sd0)&&(^(5'd5))));
  localparam signed [5:0] p17 = (-((~&(~(-2'sd1)))%(2'sd0)));

  assign y0 = (+(p13<<<b5));
  assign y1 = ((p15<<<b3)?(a4!=b4):(a4<<<b0));
  assign y2 = {3{{3{(&b2)}}}};
  assign y3 = $signed((($signed(b2))*(p10/a1)));
  assign y4 = ((|(~|(~|(~b1))))<<<(~^(~|(!(~b2)))));
  assign y5 = (a5-b4);
  assign y6 = (((-b4)^{4{a5}})>=($signed(p13)<(p3<p12)));
  assign y7 = (|(+(({$unsigned(($signed((^$signed(b2))))),(~^(~|(~(~(~|b4)))))}))));
  assign y8 = ((~|p11)>>(p17?p14:a3));
  assign y9 = (!(4'd15));
  assign y10 = ((|((p0<<a3)>=(a2<=b4)))>(((~&b1)<<<(a2<<p7))>>>((b0<<b1)+(!p9))));
  assign y11 = (3'd5);
  assign y12 = {{4{{p3}}},{(+p9),{p4,p7,p11},{2{p1}}}};
  assign y13 = (~^((|p5)<<(^p14)));
  assign y14 = (((2'd3)%p8)<=(((-3'sd3)>=(a3||a4))===((5'd29)-(4'd12))));
  assign y15 = (4'd2 ** (5'd1));
  assign y16 = (+((^a5)|(~&a4)));
  assign y17 = ((6'd2 ** (b0|b2))>>(~(-((b3&&a4)^(b0^b3)))));
endmodule
