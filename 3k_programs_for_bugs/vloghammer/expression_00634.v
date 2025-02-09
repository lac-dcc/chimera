module expression_00634(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (-((^(~^(5'd17)))?((-2'sd0)?(-5'sd9):(-2'sd0)):(&{2{(-2'sd1)}})));
  localparam [4:0] p1 = ((!((3'd7)===(!(5'sd2))))>(5'd1));
  localparam [5:0] p2 = ((5'd8)+(3'sd3));
  localparam signed [3:0] p3 = ({{(-4'sd1),(5'sd12)},{(3'd4)}}!=(((2'sd0)|(5'd12))+((5'sd13)>>>(3'd7))));
  localparam signed [4:0] p4 = ({4{(-2'sd0)}}?((-2'sd0)?(5'd12):(4'd6)):{1{((5'd22)^(3'd2))}});
  localparam signed [5:0] p5 = (!{((-4'sd7)||(3'sd2)),{4{(3'd5)}},{(2'd2),(4'd0)}});
  localparam [3:0] p6 = (((5'd8)>>>(-2'sd0))?((5'sd15)?(3'd2):(5'sd11)):((-5'sd4)?(3'd3):(5'sd13)));
  localparam [4:0] p7 = {(3'd0),(5'd9),(3'd0)};
  localparam [5:0] p8 = {(((3'sd0)?(-3'sd0):(2'd1))<={2{(4'd15)}})};
  localparam signed [3:0] p9 = {4{{2{(2'd2)}}}};
  localparam signed [4:0] p10 = {{(4'd14),(5'd7)},(+(|(-5'sd11))),(5'd6)};
  localparam signed [5:0] p11 = (5'sd14);
  localparam [3:0] p12 = {({((3'd1)!=(2'd1))}-((5'sd10)!=(5'sd5))),{({(3'd4),(2'sd1)}<<<((5'd7)<=(-4'sd7)))}};
  localparam [4:0] p13 = (~&(4'sd2));
  localparam [5:0] p14 = ((~|((4'd8)?(2'd2):(-3'sd2)))!==((~(5'd12))+{(4'sd3),(5'd17)}));
  localparam signed [3:0] p15 = (((3'd5)<=(5'd21))&((4'd12)>(-2'sd1)));
  localparam signed [4:0] p16 = (-(-{1{(~(2'sd0))}}));
  localparam signed [5:0] p17 = {1{{2{(~&{3{(-5'sd3)}})}}}};

  assign y0 = (~^(((&p7)>>>$unsigned(p8))));
  assign y1 = (((a3^p2)%b1)?((b1===b5)&(b5?a2:b2)):(&(b4<b1)));
  assign y2 = (((p11!=a4)?(b5==b2):(b2!=p15))&&((b0>>>a5)/b2));
  assign y3 = ((a1?a1:b5)?(p8?a4:p2):(~|(p10?b2:b0)));
  assign y4 = (-(|(-((~|{a1,a5,p12})?(!(~b5)):{(a3?p17:b3)}))));
  assign y5 = ($signed((|($signed(((p17/p4)<(p16)))||((p16!=p5)>=(~|a5))))));
  assign y6 = (a0?p2:b2);
  assign y7 = (b5?p9:a4);
  assign y8 = (~^(|(-$signed(((~&(!b0))===(a0+b5))))));
  assign y9 = (2'd3);
  assign y10 = (-3'sd3);
  assign y11 = ({p14,p13,p4}<<<(-4'sd7));
  assign y12 = ((a2%p0)/p0);
  assign y13 = $signed((4'd3));
  assign y14 = (4'd1);
  assign y15 = {1{((p14?p6:p8)&&{4{p7}})}};
  assign y16 = {4{(4'd12)}};
  assign y17 = ((~|(~&((b5>>>b1)^(b5&&a3))))>$signed((5'd2 ** (3'd1))));
endmodule
