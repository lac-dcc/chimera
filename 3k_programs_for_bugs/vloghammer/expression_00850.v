module expression_00850(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {((5'd1)?(5'sd3):(-2'sd1)),((-3'sd0)?(4'sd7):(5'd12)),((4'd2)^~(4'sd3))};
  localparam [4:0] p1 = {((5'd23)<<<(4'd12)),((3'd2)<<<(-3'sd1)),((4'd10)|(-4'sd1))};
  localparam [5:0] p2 = ((!(((-3'sd0)>=(2'd2))^~((3'sd2)+(-4'sd4))))<<<(~(~|(((2'd1)>>(4'sd5))&&((3'd4)>>>(5'd17))))));
  localparam signed [3:0] p3 = (~|(((~(5'sd2))^((3'd3)<=(-2'sd0)))!==(((5'sd0)!=(-2'sd1))<=((4'd6)>>>(3'd6)))));
  localparam signed [4:0] p4 = (((5'sd13)^(-4'sd4))?{(3'd0)}:((-3'sd0)|(5'd12)));
  localparam signed [5:0] p5 = (2'd0);
  localparam [3:0] p6 = (((-2'sd1)?(-4'sd4):(-4'sd0))^~((5'd20)?(-4'sd1):(2'd2)));
  localparam [4:0] p7 = (5'sd11);
  localparam [5:0] p8 = (+((4'sd5)<(-5'sd13)));
  localparam signed [3:0] p9 = {3{(~|(-((-2'sd0)>=(-2'sd1))))}};
  localparam signed [4:0] p10 = {4{(~(2'd1))}};
  localparam signed [5:0] p11 = (&{{(2'd2),(3'sd0),(-5'sd2)}});
  localparam [3:0] p12 = (~&((((4'sd0)+(2'd2))>=((3'd3)|(3'd0)))!=(!(&(((4'd8)<(4'sd7))^((4'sd7)&(2'd1)))))));
  localparam [4:0] p13 = ((~^(((5'sd9)<<(-2'sd1))!==((5'sd2)!==(5'd2))))!==(~|(-(((4'd0)|(-2'sd1))>>(-(~^(3'sd0)))))));
  localparam [5:0] p14 = (4'd11);
  localparam signed [3:0] p15 = (-3'sd1);
  localparam signed [4:0] p16 = (((5'd5)?(2'sd0):(3'sd1))=={1{{4{(2'sd1)}}}});
  localparam signed [5:0] p17 = ((3'd6)<(-4'sd6));

  assign y0 = (({a5,b3,b4}===(!a0))>>>((b3&&p11)<={p9}));
  assign y1 = ({(p3>>a5),{1{{b3,a4,b5}}},(p3?a2:a5)}&((b2>=a5)?{3{p13}}:(a1-a2)));
  assign y2 = (^(6'd2 ** (a1?b0:a0)));
  assign y3 = ($signed($signed((-2'sd0)))?(&(3'd3)):(-((~|(a5?a2:b5)))));
  assign y4 = (+$unsigned({1{(~(~^(|{1{p5}})))}}));
  assign y5 = ({3{{2{a5}}}}===(~&(b1?a5:b2)));
  assign y6 = (({2{a2}}?{(a2?b3:b0)}:(p0?b0:a2))==(({2{b3}}!=(a0?a1:b0))&&{b5,b1,a0}));
  assign y7 = (3'sd2);
  assign y8 = (b3+a1);
  assign y9 = (+(+(~|(^(+(~(!(^(!(!(~|(&(!(~&(^(!(~b2)))))))))))))))));
  assign y10 = (p0!=a4);
  assign y11 = {2{{3{(b1!==b1)}}}};
  assign y12 = ((a1?b4:a3)?(|(^(^p9))):(~|(b3?a3:a1)));
  assign y13 = (-3'sd1);
  assign y14 = (((-(a1?p13:p12))<<<(2'd2))&&(-3'sd3));
  assign y15 = (5'd2);
  assign y16 = (+p17);
  assign y17 = (~&(((b1<=a4)?(b1===a5):(b2||a0))<=((+(p16?a1:p10))<(-2'sd1))));
endmodule
