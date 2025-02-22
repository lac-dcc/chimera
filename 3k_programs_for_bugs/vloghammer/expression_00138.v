module expression_00138(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((3'sd2)===(2'd2))<(((2'd1)||(3'd0))>((-3'sd3)^(4'sd3))));
  localparam [4:0] p1 = (((-5'sd9)>(4'sd1))||{(5'd2),(-4'sd3)});
  localparam [5:0] p2 = ((-4'sd6)>{(((2'd1)-(5'd5))<=((-5'sd0)>>>(3'd6)))});
  localparam signed [3:0] p3 = {2{(2'd2)}};
  localparam signed [4:0] p4 = (^((((4'sd2)&&(-5'sd9))^((4'd2)?(5'd17):(3'd0)))?(((2'd0)|(2'd2))>>((4'd5)>>>(2'd1))):(((-5'sd4)&&(2'd1))>=((-5'sd1)<(2'sd0)))));
  localparam signed [5:0] p5 = {((2'd3)^~(-5'sd5))};
  localparam [3:0] p6 = ((5'd15)!={{(5'sd2),(5'sd7)},((2'd2)|(2'd1)),(-4'sd1)});
  localparam [4:0] p7 = ((^(|(3'd1)))/(4'd10));
  localparam [5:0] p8 = ((((3'sd1)>=(2'sd0))!==((2'd3)|(3'sd2)))||(+((3'd2)||(2'sd0))));
  localparam signed [3:0] p9 = ((|(~|(5'd0)))===((2'd2)&&(2'd1)));
  localparam signed [4:0] p10 = ((((5'd6)/(5'd10))?((-5'sd15)||(5'sd14)):((-5'sd15)==(2'd3)))|(((5'd10)^(5'sd0))^((3'sd3)?(-2'sd1):(4'd6))));
  localparam signed [5:0] p11 = ({((2'd2)^~(5'sd0)),((5'd1)-(3'd2))}?(((3'd3)|(-2'sd1))>>>{(5'sd0),(-5'sd13)}):(4'd2 ** {(5'd26)}));
  localparam [3:0] p12 = ((4'd6)>>>(4'd6));
  localparam [4:0] p13 = {4{(2'd1)}};
  localparam [5:0] p14 = ((((4'sd3)==(-3'sd0))*((5'd0)?(2'd1):(2'd3)))&(((5'sd13)<=(2'd2))===(+(2'd2))));
  localparam signed [3:0] p15 = ({1{(((-2'sd0)<(5'd0))<<<(~|((3'd3)^(4'sd4))))}}|(!(((3'd2)+(5'd28))!=(~&((-2'sd0)+(-2'sd0))))));
  localparam signed [4:0] p16 = (((5'd29)?(4'sd4):(-3'sd3))?(-4'sd6):(~|(~&(2'sd1))));
  localparam signed [5:0] p17 = ((+{(5'd12),(4'sd2)})||({(3'd0),(3'd4),(4'sd5)}&&(!(-3'sd1))));

  assign y0 = ({2{{p11}}}?{{1{p0}},{p14}}:(-(~(p10?a0:p6))));
  assign y1 = (-2'sd1);
  assign y2 = {1{(2'sd1)}};
  assign y3 = {1{{2{{b1,p13}}}}};
  assign y4 = ((~&((^p5)?(~p10):(~|a5)))-(+((!(!p13))<<<(~^(b5|p0)))));
  assign y5 = ((+{4{b4}})==(!{{a0,p10,b3}}));
  assign y6 = {3{{3{a4}}}};
  assign y7 = (2'd3);
  assign y8 = ((p4>=p11)!=((a2>=a3)));
  assign y9 = {p6,p13};
  assign y10 = ((~&(6'd2 ** (-(a0===b0)))));
  assign y11 = {p10,p3,p7};
  assign y12 = $unsigned({({4{{a5,p9}}}^~(-((p15==a3)&&(p2<<<a0))))});
  assign y13 = (((b5?p8:p9)-(-2'sd0))?{1{{2{(a0?p16:p11)}}}}:(4'd0));
  assign y14 = (6'd2 ** (~{p0,a2}));
  assign y15 = (5'sd8);
  assign y16 = (2'd0);
  assign y17 = $signed((5'sd7));
endmodule
