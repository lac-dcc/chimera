module expression_00491(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((~|(3'd5))>(|(2'd1)))!=(((2'd0)<=(3'd5))!==((-5'sd15)-(4'd3))));
  localparam [4:0] p1 = (^(~{(3'sd1),(4'd5),(5'd31)}));
  localparam [5:0] p2 = (|{{(4'd4),(5'sd15),(2'd2)},{(-4'sd6)}});
  localparam signed [3:0] p3 = (~&{(3'd5),(-5'sd12),(3'd7)});
  localparam signed [4:0] p4 = ((!((2'd2)^(4'sd3)))-(-5'sd8));
  localparam signed [5:0] p5 = {1{((-(~|(((3'd3)===(4'd12))&&(!(-4'sd5)))))^((&((-5'sd4)>>>(-2'sd0)))&((5'd6)!==(5'sd2))))}};
  localparam [3:0] p6 = ((-2'sd0)||(5'sd6));
  localparam [4:0] p7 = (((4'd12)/(5'sd6))>=((4'sd7)^~(5'd8)));
  localparam [5:0] p8 = {{(~^(~|(2'sd0))),{(4'd7),(5'sd10),(4'sd3)}}};
  localparam signed [3:0] p9 = ((-5'sd14)===(5'd30));
  localparam signed [4:0] p10 = (~^(~&(~&(5'd31))));
  localparam signed [5:0] p11 = ((((3'sd3)||(5'd28))^((5'd15)|(2'd3)))-{(5'd2 ** (5'd4)),{(3'sd2),(5'd25),(3'd4)},((3'd5)===(4'sd2))});
  localparam [3:0] p12 = (({(3'd4)}==={4{(4'sd4)}})?(^((-4'sd0)?(4'd11):(4'd4))):{2{(~&(3'sd3))}});
  localparam [4:0] p13 = {(5'd21)};
  localparam [5:0] p14 = ((|(5'd24))?((2'd3)===(5'sd5)):(-(-4'sd2)));
  localparam signed [3:0] p15 = ((~^(~^(3'd3)))?(+(4'd10)):((4'd13)^(3'd3)));
  localparam signed [4:0] p16 = {(((-4'sd5)&&(-3'sd3))&((-3'sd2)>(5'd16))),(((3'd6)|(-2'sd1))^~((4'sd1)!==(2'd1))),(((2'd3)?(-3'sd1):(3'd3))?((-2'sd0)?(-4'sd2):(-4'sd3)):((-5'sd8)?(4'd5):(4'd3)))};
  localparam signed [5:0] p17 = (3'sd1);

  assign y0 = $signed((~^(^{2{b1}})));
  assign y1 = (|((+((a5?a0:a5)|(!p9)))?(-{(~^p2),(a3?p4:a4)}):$unsigned({(b2?b5:p17),$signed(p4)})));
  assign y2 = {1{(~&(|(({4{b3}}>(!b0))?((b4?a5:b5)!==(a3||b2)):((p8)?(a1||b0):(p9>>b1)))))}};
  assign y3 = ((((5'sd12)&&(a2===a4))<<(3'd6))<={2{((4'd11)<={3{a3}})}});
  assign y4 = ((p15<<<p13));
  assign y5 = {({2{(a1<=b2)}}?({3{p15}}?(a4?p4:a1):(-5'sd10)):{3{(a2?p4:p16)}})};
  assign y6 = (p13?p13:p14);
  assign y7 = (~|((~&p5)<<<{1{a0}}));
  assign y8 = {4{{3{(b3?p1:a4)}}}};
  assign y9 = (4'd2 ** (-(~p6)));
  assign y10 = (-2'sd1);
  assign y11 = $signed((-(~((a5^p11)))));
  assign y12 = (((a3?a1:b0)%b2)>((b1?a4:b3)|(a0-a2)));
  assign y13 = {$signed(({{b0,a5},(p15||a3),(p11^~b0)})),({(a3>>>b0),(+b5),(a4===a0)}>(-(|$unsigned((|a1)))))};
  assign y14 = {$unsigned(a0),{3{b1}}};
  assign y15 = (3'd2);
  assign y16 = (+(!(~&{4{{2{p7}}}})));
  assign y17 = ((b2===a1)<={p14,p13});
endmodule
