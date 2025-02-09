module expression_00958(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (&(4'd3));
  localparam [4:0] p1 = (~&(^{(~^(!((4'd14)==(-5'sd15))))}));
  localparam [5:0] p2 = ((~^(-5'sd8))?(^(-5'sd13)):{4{(4'd3)}});
  localparam signed [3:0] p3 = ((3'd0)?(3'd7):(2'd1));
  localparam signed [4:0] p4 = ((4'd10)<<{4{(3'd0)}});
  localparam signed [5:0] p5 = {(~^{(+((-3'sd1)>(4'sd5))),(5'd2 ** (4'd13)),{4{(2'd3)}}})};
  localparam [3:0] p6 = ((6'd2 ** (|((3'd6)?(2'd1):(5'd19))))?((|(3'sd3))>{4{(2'd0)}}):(((-5'sd15)?(2'sd1):(-5'sd11))?(~|(2'd1)):((5'd4)^(5'd21))));
  localparam [4:0] p7 = (+(|(-(~&(+(-(&(5'sd11))))))));
  localparam [5:0] p8 = (~((5'd15)^(5'sd4)));
  localparam signed [3:0] p9 = {1{{4{(-(2'd3))}}}};
  localparam signed [4:0] p10 = (+(-((((3'd1)<<<(2'sd0))!==(+(&(-3'sd0))))==(-3'sd0))));
  localparam signed [5:0] p11 = {2{(-4'sd5)}};
  localparam [3:0] p12 = (+(&((((5'sd15)?(4'd6):(3'd6))?{(3'd1),(-3'sd1),(2'd0)}:((4'd0)?(2'sd0):(5'd13)))<=(+((3'sd3)?(-3'sd2):(4'd6))))));
  localparam [4:0] p13 = (2'sd1);
  localparam [5:0] p14 = ((-2'sd0)>(2'd0));
  localparam signed [3:0] p15 = (3'sd3);
  localparam signed [4:0] p16 = ((-2'sd1)+{((2'sd0)&&(4'sd3)),{(-5'sd1),(-4'sd6),(2'd0)}});
  localparam signed [5:0] p17 = (((4'd1)<(5'sd11))>>>(+{2{(4'd8)}}));

  assign y0 = (((b0^b3)?(p1):(&p15))|((|b5)?(-a4):(a3===b1)));
  assign y1 = (+({(^(p11||p5)),{a2,a3,a1},(~(p8+p12))}^~(+({p12,p4,p13}==(!{p2,b0})))));
  assign y2 = (-5'sd11);
  assign y3 = (|($unsigned($signed((4'd2)))));
  assign y4 = (!((+(|$signed({a5,b2})))<{(~((a3!==b2)<<<(|b5)))}));
  assign y5 = (-(^({a5,p1,p10}<<(5'd9))));
  assign y6 = (~|(-2'sd0));
  assign y7 = (~|(p11!=p10));
  assign y8 = {(2'd3)};
  assign y9 = (((~^{2{b4}})<{(a0-b2),{b4,b1}})===({(b5<=a1),(-b4)}>>({a1,b5}>>{1{b1}})));
  assign y10 = ((~(5'd2 ** (b0<<<a1)))==(((4'd11)*(b3?b5:b5))-((b4&a0)!==(2'd1))));
  assign y11 = (!((((p15/p7)!=(p12>>p16))!=(-(~&(!p16))))>>>(((p0-b1)*(p2<<p6))^(|(a1^p0)))));
  assign y12 = {4{(a2&&p2)}};
  assign y13 = ((a0<<<p9));
  assign y14 = ((&($unsigned({1{a5}})<<{3{b2}}))>{3{(~p9)}});
  assign y15 = ({3{(~&a2)}}?$unsigned(((a0)===(a5>a3))):(~((b1<<b2)<<<(b0>=a2))));
  assign y16 = ((p12?p12:p3)?(-p2):(^p10));
  assign y17 = (5'd2 ** b1);
endmodule
