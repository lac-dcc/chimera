module expression_00089(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (~|(|{3{(^((5'd1)^(2'd0)))}}));
  localparam [4:0] p1 = {(3'd2),(2'd2)};
  localparam [5:0] p2 = ((-5'sd15)?((-3'sd1)?(3'sd0):(5'd6)):((2'd2)?(4'd2):(4'd5)));
  localparam signed [3:0] p3 = (^((2'd2)<<<(4'd8)));
  localparam signed [4:0] p4 = ((2'd3)!=(3'sd2));
  localparam signed [5:0] p5 = (((-4'sd5)/(2'sd0))||((-5'sd3)<(2'sd0)));
  localparam [3:0] p6 = ((-4'sd6)<<<(&{4{{3{(4'd11)}}}}));
  localparam [4:0] p7 = (-{1{(5'sd14)}});
  localparam [5:0] p8 = ((-2'sd0)-((-2'sd1)&(3'sd2)));
  localparam signed [3:0] p9 = {((2'd1)?(2'd2):(3'sd3)),((2'd1)||(4'sd6)),{1{{(-2'sd0),(-3'sd3)}}}};
  localparam signed [4:0] p10 = (|(~^(+({1{{3{(-2'sd1)}}}}?(((4'd13)?(-2'sd1):(4'sd7))<<<(~(5'd29))):(|((3'sd1)?(4'sd5):(2'd2)))))));
  localparam signed [5:0] p11 = ((((~(3'd2))/(2'd3))==(!(~^((4'sd2)||(3'sd1)))))>>>(&(^(((4'sd2)>(2'd0))||((4'd8)^~(5'd3))))));
  localparam [3:0] p12 = (~&(~((3'd6)?(4'sd5):(-4'sd5))));
  localparam [4:0] p13 = (5'd2 ** (4'd12));
  localparam [5:0] p14 = ({((5'sd12)===(2'sd1))}?((-4'sd5)!=(-2'sd1)):((-2'sd0)^(3'd3)));
  localparam signed [3:0] p15 = (3'sd1);
  localparam signed [4:0] p16 = {((5'd16)|(2'sd0)),{4{(5'sd5)}},{(4'd5),(4'd5)}};
  localparam signed [5:0] p17 = (+((5'd17)?(-2'sd0):(2'd0)));

  assign y0 = ((((a4+b4)!==$unsigned({b0})))<<(+((|b0)?(-2'sd1):(a0==p4))));
  assign y1 = (~&{4{(!(^(~&(~|b2))))}});
  assign y2 = ({(~|b0),(a5?a4:a3),(p17<<<a1)}?(~^((~|(|a2))-{a4,a0,a1})):{(b1),(a2?b2:a1),(-a0)});
  assign y3 = (&(b4?p17:b4));
  assign y4 = (p2);
  assign y5 = ($signed((^(b1^a0)))?(a5?b2:b1):(+(^$unsigned(a5))));
  assign y6 = (3'd5);
  assign y7 = ((((b1>a5)>>>(-a2))>(~|((a0|b1)>>>(6'd2 ** p0))))+(((a0===a5)<(b5?a3:b2))!==((b3>b3)?(b4*b4):(~&b5))));
  assign y8 = {2{{2{(p3>=p1)}}}};
  assign y9 = {1{({1{((p11^~a2)^~(b5?p8:p4))}}+{3{{3{p1}}}})}};
  assign y10 = ((!a2)?{a3,a2,a4}:(+p17));
  assign y11 = {1{({p12,p1}?{1{p5}}:{4{p12}})}};
  assign y12 = (!{{(&{a0,a1,p13})},(2'd2)});
  assign y13 = {1{({3{(p0^p6)}}?((-(p13?p15:p17))^(|(p10?p2:p5))):{(b2>>>p1),{p9,p0,p1},(~^p14)})}};
  assign y14 = {3{({4{b4}}=={3{p12}})}};
  assign y15 = (2'd2);
  assign y16 = (~&(&(3'd2)));
  assign y17 = $signed({p12,b5,a2});
endmodule
