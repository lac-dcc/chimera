module expression_00093(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((5'sd2)?(-4'sd4):(3'd0))^((2'd3)>=(4'd5)));
  localparam [4:0] p1 = ((3'd0)|(-5'sd2));
  localparam [5:0] p2 = {4{({4{(4'sd0)}}&(^(4'd9)))}};
  localparam signed [3:0] p3 = (3'sd0);
  localparam signed [4:0] p4 = ({1{{4{(4'd14)}}}}?{1{((-3'sd3)?(4'sd3):(-4'sd6))}}:(((4'd4)?(-5'sd13):(4'd8))?((-4'sd5)===(5'sd6)):((-2'sd0)&&(2'sd0))));
  localparam signed [5:0] p5 = ((4'sd3)===(5'd21));
  localparam [3:0] p6 = {{2{((5'sd10)>(4'd9))}},{(~|{(5'd24),(4'd8)})}};
  localparam [4:0] p7 = (&((((5'd18)>(-5'sd10))-(&((3'sd3)>>(2'd1))))<(+((4'd2 ** (4'd5))+(~&(^(3'sd2)))))));
  localparam [5:0] p8 = (^((5'sd3)!=(-5'sd6)));
  localparam signed [3:0] p9 = (~|((^(~^(+((4'd12)-(2'd3)))))<<(|(((3'd3)>>(2'd2))===((2'd1)&&(-5'sd4))))));
  localparam signed [4:0] p10 = (3'd6);
  localparam signed [5:0] p11 = {4{((+(-4'sd4))+(+(2'd0)))}};
  localparam [3:0] p12 = (-(2'd3));
  localparam [4:0] p13 = (((5'd22)^~(4'd5))|((3'd0)*(5'd4)));
  localparam [5:0] p14 = ((3'd3)<<(-3'sd2));
  localparam signed [3:0] p15 = (((4'd7)<=(-5'sd2))&&(~|(4'd3)));
  localparam signed [4:0] p16 = (+((&{(3'sd0),(-4'sd0),(3'd0)})^~(2'd0)));
  localparam signed [5:0] p17 = {4{{2{(-3'sd1)}}}};

  assign y0 = {(-5'sd7),({4{b5}}^~{p10,a5,p6}),{(^{b5,b0,b1})}};
  assign y1 = {{(p15^~p6),(&p13)},({p16}<<<(p3-p11)),(~^{(p14^p17)})};
  assign y2 = ($unsigned((a4*p12))/b2);
  assign y3 = ({(|(~b0))}?{(~^a4),{a5,a4,b2}}:{b1,b3,b0});
  assign y4 = (6'd2 ** (2'd0));
  assign y5 = ({a3,b5}|{1{a3}});
  assign y6 = (b1!=p9);
  assign y7 = (p7?p16:p12);
  assign y8 = {{4{b5}},{1{{{2{a2}},(a5>p7)}}}};
  assign y9 = {2{(a2+p14)}};
  assign y10 = (|(-(+$signed((-3'sd3)))));
  assign y11 = {3{{1{(a0||b1)}}}};
  assign y12 = (((p0>>>p9)>>{3{p16}})!=((p7|p9)|(a2>>>p7)));
  assign y13 = ((p6>=b0)?{3{p6}}:{b0,p5,p12});
  assign y14 = (((b3>b1)?$unsigned(b0):(^a0))?$unsigned((((!b3))^~{3{b3}})):((5'd2 ** b1)?(~&b5):(~a1)));
  assign y15 = (b0%p14);
  assign y16 = {{2{{2{(3'sd2)}}}}};
  assign y17 = (({(p0?p7:b5)}>=((p13?a3:p16)>(p10)))!={1{({{2{p15}}}<=(p5?p15:p17))}});
endmodule
