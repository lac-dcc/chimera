module expression_00828(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (((3'd7)==(2'sd1))*((-3'sd1)>(3'd3)));
  localparam [4:0] p1 = (3'd7);
  localparam [5:0] p2 = ((-{3{(5'sd15)}})<<<{1{((|(-4'sd1))+(~(4'd10)))}});
  localparam signed [3:0] p3 = (~(&(~^(2'd0))));
  localparam signed [4:0] p4 = (4'd2 ** ((2'd1)|(3'd7)));
  localparam signed [5:0] p5 = {{{(2'd0),(-4'sd1)}},((-2'sd0)!==(-3'sd0)),((3'd5)<=(4'sd4))};
  localparam [3:0] p6 = (({2{(2'sd0)}}>>{4{(3'd3)}})-(((2'd1)?(4'd15):(2'd3))!=((2'sd0)>=(3'd6))));
  localparam [4:0] p7 = ({3{((-4'sd2)!==(4'd15))}}!=={{({(-4'sd7),(5'd10)}^{4{(5'sd7)}})}});
  localparam [5:0] p8 = (~(-(|(2'd0))));
  localparam signed [3:0] p9 = (+(!(&((~&(3'sd3))>(!(4'd11))))));
  localparam signed [4:0] p10 = ({(+(4'd13)),{1{(-4'sd0)}},(+(-2'sd0))}<=(-4'sd5));
  localparam signed [5:0] p11 = (((-4'sd1)-(4'd4))-{1{((-5'sd11)-(2'd2))}});
  localparam [3:0] p12 = (~|((-(((2'sd0)^~(-5'sd11))-((4'sd3)===(-2'sd1))))?(((3'd0)?(2'd0):(-4'sd4))>=(+(3'sd3))):(((-2'sd0)!==(-4'sd1))-((2'd1)!==(-2'sd1)))));
  localparam [4:0] p13 = (((4'd9)?(5'd20):(3'sd2))>>((5'sd15)&(4'd6)));
  localparam [5:0] p14 = ({2{(^(-2'sd1))}}-(-3'sd0));
  localparam signed [3:0] p15 = (~(+(^(!(~&(|(~|(+(|(~(~^(~^(!(~^(&(5'sd1))))))))))))))));
  localparam signed [4:0] p16 = ((((5'd14)<<<(-4'sd2))<={(4'sd1)})==={1{(4'd4)}});
  localparam signed [5:0] p17 = {3{(4'd11)}};

  assign y0 = ((p11?p7:p0)?(p1?p17:p17):{1{{1{$signed(a4)}}}});
  assign y1 = ((5'd11)?((b1?a3:p8)>>(p9-p8)):(-2'sd1));
  assign y2 = (p15?a3:p3);
  assign y3 = {(4'd6)};
  assign y4 = ((((b5!=a0)<=(~&(b1===b4))))===((~|(b5!==a4))>>>({4{a4}}||(b2>a3))));
  assign y5 = (-p16);
  assign y6 = ((&b0)!==(~|b4));
  assign y7 = ((({2{p6}}<<<(5'd28))>(2'd2))=={1{{1{((-2'sd1)===(~|(a5!=b4)))}}}});
  assign y8 = {p11,p2};
  assign y9 = ({1{$unsigned(((b1^~a0)!=={3{b1}}))}}>>>{1{({2{b4}}===(|b4))}});
  assign y10 = (($unsigned(a2)>>>(p7?p3:p3))?$signed((a5+p10)):((p1)<<<$signed(p14)));
  assign y11 = (4'd0);
  assign y12 = ((2'd1)?(5'd2):($signed(a1)));
  assign y13 = (2'sd1);
  assign y14 = (~^$unsigned(((~^(b0?a2:a0))<<{{4{b3}},(&a1)})));
  assign y15 = {1{((2'd0)==((4'd2)<<<{4{a0}}))}};
  assign y16 = (-4'sd3);
  assign y17 = ((a4%a5)%b3);
endmodule
