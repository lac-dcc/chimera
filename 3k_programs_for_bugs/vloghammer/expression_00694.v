module expression_00694(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (-(-(~((-{2{(5'sd13)}})=={1{{4{(-4'sd6)}}}}))));
  localparam [4:0] p1 = ((2'd0)+(~&(((-4'sd5)!=(4'd5))>(&(5'sd11)))));
  localparam [5:0] p2 = {4{{1{(^(5'sd10))}}}};
  localparam signed [3:0] p3 = (&(((4'd11)?(2'sd0):(4'd8))^~((-5'sd8)?(5'sd6):(3'sd1))));
  localparam signed [4:0] p4 = {(~&((4'sd7)?(2'sd1):(2'd2))),(&(!((4'd7)&&(5'sd5)))),((~(5'd28))||{(3'd6)})};
  localparam signed [5:0] p5 = {4{(3'd6)}};
  localparam [3:0] p6 = (4'd5);
  localparam [4:0] p7 = (-{3{(~^(((2'd3)<=(5'd28))>=(~&(2'd3))))}});
  localparam [5:0] p8 = (|(3'sd3));
  localparam signed [3:0] p9 = ({(-4'sd2),(2'd1)}>={4{(5'd8)}});
  localparam signed [4:0] p10 = (((5'sd5)?(4'd3):(-4'sd1))?({(-4'sd6),(5'd13),(4'd6)}=={(4'd5)}):((4'd14)?(2'd1):(5'sd13)));
  localparam signed [5:0] p11 = (((((5'sd6)>=(2'sd1))%(-5'sd6))+((-5'sd2)===((3'd4)?(5'sd8):(-5'sd5))))+(((2'd2)?(2'sd0):(-5'sd13))%(3'd7)));
  localparam [3:0] p12 = ((((2'sd1)===(5'd4))===(&(~&(4'd13))))===(3'd4));
  localparam [4:0] p13 = {(~^(+{(2'd1),(-5'sd3),(2'd2)})),(^((-5'sd4)==(5'sd12))),(!(+((3'sd3)^~(5'd23))))};
  localparam [5:0] p14 = (((-5'sd12)?(5'sd9):(4'd10))?(3'd2):(-3'sd3));
  localparam signed [3:0] p15 = {{{(-2'sd1)},{(5'd17)}},{{(4'd2),(2'sd1),(5'd15)}},{{(2'sd0),(4'd10)},{(3'sd1),(2'd3)}}};
  localparam signed [4:0] p16 = {2{(5'd30)}};
  localparam signed [5:0] p17 = ({(-2'sd0),(2'sd0),(4'd8)}!=={(3'd7),(3'd2),(-5'sd5)});

  assign y0 = (~^((p7?a4:a4)?$signed($unsigned(p5)):(p3?b3:p7)));
  assign y1 = (3'd6);
  assign y2 = {($signed((((b4===b0)<<<(a3!=p0))))||((|({4{a3}}<<<(p17>a5)))))};
  assign y3 = ((^((p14>=p0)*(!(a2<=b0))))>=(^((5'd28)<<(~&(!(~&a2))))));
  assign y4 = ({2{{b0}}}+{3{{a1,p11,a4}}});
  assign y5 = ((5'd2 ** {a1,b2})>>>{2{(p0||p7)}});
  assign y6 = (((a4&b1)+(|b0))?{(~|{a4,a4,b1})}:(^({3{b5}}!=={a3,a1,b2})));
  assign y7 = (~&(2'd2));
  assign y8 = (a2^~p13);
  assign y9 = (b1?b2:b5);
  assign y10 = ((-(&a3))||(5'd2 ** b0));
  assign y11 = (5'sd10);
  assign y12 = {2{(~&((b5||a1)<=(b5|a4)))}};
  assign y13 = ((a4?a4:b4)?(&b2):(b3<a5));
  assign y14 = (~|{(~&($signed((a4<<<p10))&&(p14>=p12))),((p9?b2:p0)<={(a2===a0),(p9?p6:p3)})});
  assign y15 = $signed((~^(($unsigned(p3)<<(b5))>>$unsigned((p16?a4:b4)))));
  assign y16 = (((a4<=b2)!=={4{b0}})<<{1{{4{(p10|p14)}}}});
  assign y17 = ((((a1<<a3)>>(b0>p9))^$signed(((p5+a2))))+((3'sd3)<<<(-2'sd1)));
endmodule
