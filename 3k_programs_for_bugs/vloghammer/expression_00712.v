module expression_00712(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((4'sd5)!==(5'd4))>((-5'sd1)+(2'sd1)));
  localparam [4:0] p1 = {{4{(-3'sd3)}},(5'd24),{1{(4'd0)}}};
  localparam [5:0] p2 = (-4'sd0);
  localparam signed [3:0] p3 = (~((-3'sd0)-(2'sd1)));
  localparam signed [4:0] p4 = (&(4'd9));
  localparam signed [5:0] p5 = ((!{1{(2'd2)}})!=(4'sd4));
  localparam [3:0] p6 = ((~^(3'd6))>{(5'd6),(-5'sd13)});
  localparam [4:0] p7 = {(((3'd4)^(-4'sd7))?((2'd1)!==(2'sd0)):((2'd2)&&(-5'sd0))),{(((3'd1)<<(5'sd13))!==((3'd2)<=(3'sd3)))}};
  localparam [5:0] p8 = (+(|(~&(+(~{((2'sd0)<=(2'sd1)),(!(~&(4'sd2))),((2'sd1)||(4'd9))})))));
  localparam signed [3:0] p9 = ((!(4'd2))<<<(-4'sd7));
  localparam signed [4:0] p10 = (-(((5'sd6)===(4'sd1))>>>(4'd2 ** (5'd25))));
  localparam signed [5:0] p11 = ({1{({1{(5'd30)}}!==((-5'sd11)!=(3'sd2)))}}^{4{{2{(5'd10)}}}});
  localparam [3:0] p12 = (5'd5);
  localparam [4:0] p13 = (((6'd2 ** (2'd1))&(!(2'd1)))>>>((~|(3'd3))/(-2'sd0)));
  localparam [5:0] p14 = ({(4'd4)}^~((5'sd13)|(3'd3)));
  localparam signed [3:0] p15 = (^(-5'sd11));
  localparam signed [4:0] p16 = (!(!({1{({2{(2'd2)}}===(-5'sd12))}}!=={1{({4{(3'd2)}}>>>(^(-5'sd7)))}})));
  localparam signed [5:0] p17 = (&{{(|{(~&(4'd6)),{(5'd21),(5'sd14)}})},(~{{(2'sd0),(2'd2)},{(5'sd13),(5'sd13),(2'd2)}})});

  assign y0 = $signed((+$signed($signed(($signed($unsigned(a4))?(a3?b0:b5):(b5?a5:b1))))));
  assign y1 = (~^{4{b0}});
  assign y2 = ((p12-p2)?(p12?b2:a1):{b2});
  assign y3 = (p4?a4:a4);
  assign y4 = ({4{(^(^b1))}}<((-{3{p8}})<<<(-5'sd7)));
  assign y5 = (!{3{(!(~|(b5+b0)))}});
  assign y6 = (({b1,a3}+(b1?p14:b5))?(a1?p2:b1):({a3}|(a5>b3)));
  assign y7 = (-{(!b1)});
  assign y8 = ({3{{4{a3}}}}^{3{(~(b0!=a1))}});
  assign y9 = ({1{(5'd2 ** (2'd3))}}-((a3<p4)>>>(p16<b3)));
  assign y10 = (&{({{p11,b1},(~|p5)}<<(&(p9>p9))),{{b0,a5,a5},(a5>b1),{p16,p13,a3}}});
  assign y11 = (~^(2'd0));
  assign y12 = (~&(~&{2{b2}}));
  assign y13 = (({((p17+a2)<<<{p11,b2,a3})})>>(~|((a1>>a0)!==(!a3))));
  assign y14 = (~^{3{{(p2>>a0),(b0!==a2)}}});
  assign y15 = ((-{2{{1{(+p11)}}}})>(^{2{(&(-2'sd1))}}));
  assign y16 = {2{(4'd0)}};
  assign y17 = (((p2?p11:a3)?$unsigned((b3?a3:a0)):((p11?b3:b1)))>(({1{a0}}&{1{a1}})!==((2'd2)<(b3))));
endmodule
