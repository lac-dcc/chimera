module expression_00915(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = ((((4'd5)*(2'd2))>>((-5'sd15)!==(5'd22)))?(5'd2 ** (4'd2 ** (5'd6))):((5'd9)?(3'd1):(3'sd1)));
  localparam [4:0] p1 = {{{(3'd1),(2'sd1),(2'd2)},{(4'sd5),(4'sd6)},((2'd0)>>(5'd19))},{{{(-3'sd2),(5'd22)},{(4'sd7)}}},({(-3'sd0),(3'd4)}<<<{(4'd1)})};
  localparam [5:0] p2 = {(2'd0),(4'd1)};
  localparam signed [3:0] p3 = ((((-5'sd4)|(4'd1))/(2'd1))?(5'd31):(~|((3'd5)?(-4'sd6):(5'd3))));
  localparam signed [4:0] p4 = (4'd2 ** (+(|(2'd3))));
  localparam signed [5:0] p5 = {((-5'sd0)?(5'd0):(2'd3)),{((4'sd2)<<(4'd1)),(|(-5'sd2))},{4{(5'd25)}}};
  localparam [3:0] p6 = (4'd2 ** ((4'd3)?(2'd0):(2'd3)));
  localparam [4:0] p7 = ((((2'd1)%(5'd19))?((3'd2)?(2'sd1):(5'd1)):((5'sd6)*(2'd0)))?((4'd0)!==((-3'sd2)&(-4'sd4))):((-5'sd6)>((4'd10)&(5'd20))));
  localparam [5:0] p8 = {4{(-((3'd1)?(2'sd1):(3'd7)))}};
  localparam signed [3:0] p9 = ((2'd2)<<<(3'sd1));
  localparam signed [4:0] p10 = (&((2'd2)<<<((4'sd2)<<(4'd9))));
  localparam signed [5:0] p11 = {1{(3'd3)}};
  localparam [3:0] p12 = (4'sd2);
  localparam [4:0] p13 = ({2{(3'd4)}}==(~&(4'sd5)));
  localparam [5:0] p14 = ((~^(((5'd7)<<<(3'd2))!==(3'd3)))>>{(4'd15),{(5'sd4),(2'sd1)}});
  localparam signed [3:0] p15 = (((-2'sd1)!==((3'sd3)>>(3'd6)))<=((3'sd0)?(2'sd0):(-5'sd3)));
  localparam signed [4:0] p16 = (~&(((4'd4)?(-4'sd3):(2'd3))?(^(4'd9)):((-5'sd4)||(5'd7))));
  localparam signed [5:0] p17 = {1{((~|({2{(5'd18)}}|(~^(4'd11))))^{3{((4'd12)||(5'd9))}})}};

  assign y0 = (-3'sd0);
  assign y1 = ($unsigned((+(-5'sd8)))===(((b0&&b0)<$unsigned(b3))&{3{a1}}));
  assign y2 = ((^((5'd27)?(b5?b1:b1):(2'sd1)))<<(3'sd2));
  assign y3 = ((|(3'd0)));
  assign y4 = (-(p10?b0:b4));
  assign y5 = (3'sd3);
  assign y6 = (^((~(a1!==a4))||(-2'sd0)));
  assign y7 = {1{{3{(^{3{b5}})}}}};
  assign y8 = {{({3{a5}}!=(b4!==a0))},(&({b0,p2}>(b3!==a3)))};
  assign y9 = (~|{3{{1{(^(|(p11==p4)))}}}});
  assign y10 = {3{((~&p8)>>(p7<p12))}};
  assign y11 = (p17>b2);
  assign y12 = {1{(({3{a1}}<(a2?b5:b5))!==((b5&&a0)?$unsigned((b0?b0:a2)):$unsigned((|b5))))}};
  assign y13 = (~&(2'sd1));
  assign y14 = ({p12,p0,p3}?(2'sd1):{3{p5}});
  assign y15 = (!($unsigned($signed((~&(b5<<a0))))!==((~$signed(b3))<(4'd0))));
  assign y16 = (!((&(+(~p13)))?(&(p15<<<a5)):(p2?p0:p15)));
  assign y17 = (6'd2 ** (~^p13));
endmodule
