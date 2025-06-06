module expression_00801(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((-5'sd3)!=={1{(-2'sd0)}})>>{3{(^(4'd12))}});
  localparam [4:0] p1 = {3{(3'd6)}};
  localparam [5:0] p2 = (~^(-(!(4'd2 ** {{(2'd0),(4'd6)}}))));
  localparam signed [3:0] p3 = {{(4'd14)},((-5'sd0)?(-4'sd6):(3'd6)),((3'd5)?(2'd3):(-3'sd2))};
  localparam signed [4:0] p4 = (((3'd6)?(5'd6):(2'd0))?((-4'sd7)|(5'd20)):((4'd12)<=(3'sd3)));
  localparam signed [5:0] p5 = (-3'sd1);
  localparam [3:0] p6 = (~|(-({2{(~&((2'd0)||(3'd5)))}}^~(4'd2 ** {4{(2'd0)}}))));
  localparam [4:0] p7 = {4{{3{(2'd2)}}}};
  localparam [5:0] p8 = (-2'sd0);
  localparam signed [3:0] p9 = (-(4'd0));
  localparam signed [4:0] p10 = ((((3'd3)&(-4'sd6))==((-3'sd0)==(2'd0)))!=(((2'sd1)===(3'd7))>={(-4'sd7),(5'sd13),(3'sd2)}));
  localparam signed [5:0] p11 = {3{(~{4{(2'd2)}})}};
  localparam [3:0] p12 = ({(4'sd7),(-4'sd5)}^~((-3'sd3)&&(4'sd5)));
  localparam [4:0] p13 = (^{({(4'sd4)}?{(2'd2),(-4'sd7)}:(4'sd2))});
  localparam [5:0] p14 = (((4'd3)>(5'd5))^((-3'sd1)?(5'sd11):(2'd1)));
  localparam signed [3:0] p15 = (((-3'sd0)+((5'sd5)&(3'd2)))<<<(2'd0));
  localparam signed [4:0] p16 = ((((3'sd0)/(2'sd0))+((-5'sd7)%(5'd4)))>>>(((-3'sd0)+(5'd17))%(3'sd2)));
  localparam signed [5:0] p17 = (3'd2);

  assign y0 = (~|{{$signed((b0|a2))},{a5,p13,b5},(|{{a5}})});
  assign y1 = (~^({3{a0}}<(p14?b3:a2)));
  assign y2 = ((!(&(~p5)))?((+a5)<<(a5?p16:p10)):((5'd6)&&(p15?p12:b5)));
  assign y3 = ((|(|{2{((4'sd1)=={4{p16}})}})));
  assign y4 = {3{{(p0?p9:p7),{1{p9}},(-2'sd1)}}};
  assign y5 = {(p6!=b0),({b1,a3})};
  assign y6 = (^(5'd19));
  assign y7 = ($unsigned(($signed(p14)<<<(p4+p10)))!=((p10-b2)+(p8^p3)));
  assign y8 = {a5,p5,p13};
  assign y9 = (p1==p0);
  assign y10 = (+(~^((b4===a2)?(6'd2 ** p2):(b2===b2))));
  assign y11 = (~|(~|(+((|$unsigned((2'd0)))))));
  assign y12 = ((b1<<a4)!==(~^(a0)));
  assign y13 = (((&((~|{4{a1}})|(b3==b0))))!=={4{(a3||b4)}});
  assign y14 = ((2'd3)<((2'sd1)!={2{$unsigned(p4)}}));
  assign y15 = {b4,b3,a5};
  assign y16 = $unsigned($unsigned(($unsigned(((5'd28)))!==((b5!=b2)>>(a5>>b0)))));
  assign y17 = (!(-(p15*a1)));
endmodule
