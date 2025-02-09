module expression_00122(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {1{((((-3'sd1)>>>(3'd0))||((4'd13)>>>(4'sd1)))<({2{(5'd8)}}!=={3{(-5'sd13)}}))}};
  localparam [4:0] p1 = {(~|{{(3'sd1),(-3'sd2),(3'sd1)},{(5'd25)}})};
  localparam [5:0] p2 = ({3{(5'd19)}}>>>((-2'sd0)>>>(2'd1)));
  localparam signed [3:0] p3 = ((2'd0)&(3'sd2));
  localparam signed [4:0] p4 = {1{(((6'd2 ** (3'd7))^((3'd0)?(3'd3):(3'sd3)))&&((~&(4'd10))<<{1{(2'd2)}}))}};
  localparam signed [5:0] p5 = ({4{(2'd0)}}<<{3{(5'sd5)}});
  localparam [3:0] p6 = ((5'd2 ** ((2'd0)>=(2'd1)))<=(((-4'sd0)>=(3'd7))>>>((-5'sd1)==(4'sd7))));
  localparam [4:0] p7 = (^(^(4'd13)));
  localparam [5:0] p8 = (&((^(5'd21))?(-(5'd8)):((5'd6)?(-5'sd11):(3'd6))));
  localparam signed [3:0] p9 = (4'sd6);
  localparam signed [4:0] p10 = (({(-5'sd12),(2'sd1)}&&((4'sd4)<=(3'sd1)))^{((5'sd4)^(-5'sd8)),{(3'sd2)},((3'sd1)>(4'd7))});
  localparam signed [5:0] p11 = (((2'sd1)?(5'sd7):(2'd0))?((4'd2)?(4'd13):(2'sd0)):(+(~&(~|(3'd7)))));
  localparam [3:0] p12 = ((+((4'd4)<<{(-5'sd15)}))^(((3'sd0)?(-2'sd0):(3'sd0))!==(~|{(-5'sd11),(-2'sd1)})));
  localparam [4:0] p13 = {3{((2'd0)!=((4'd0)?(3'sd0):(5'd22)))}};
  localparam [5:0] p14 = (((5'd11)||{(3'd0),(-5'sd11),(3'sd2)})-{3{{(2'd1)}}});
  localparam signed [3:0] p15 = {4{(~^(4'd4))}};
  localparam signed [4:0] p16 = {3{{2{((3'd0)>(2'd2))}}}};
  localparam signed [5:0] p17 = (|(&(^(-3'sd1))));

  assign y0 = (~|(((p4<<a0)?{p17,p5}:(p10?p8:b0))?((~^(p12>>p3))&&(b1!==b4)):((b1?p11:p11)^~(-4'sd1))));
  assign y1 = $signed((&(+($signed((~a0))))));
  assign y2 = {{{p2,p9},(p9>>>p0)}};
  assign y3 = ((a2&p3)>>(a5>=a3));
  assign y4 = (3'd7);
  assign y5 = {{1{{4{({2{b4}}==(a2-b2))}}}}};
  assign y6 = $signed((2'd1));
  assign y7 = (p15^~p11);
  assign y8 = {4{((~|p2)|(-p3))}};
  assign y9 = ({1{(-2'sd1)}}&(5'sd13));
  assign y10 = {$signed((~&(^$signed(p12)))),{4{p14}}};
  assign y11 = (6'd2 ** $unsigned(p13));
  assign y12 = ({4{(a0?b4:p9)}}?{2{(p9?a5:p1)}}:{2{(^{3{p0}})}});
  assign y13 = (-4'sd2);
  assign y14 = {(-3'sd3)};
  assign y15 = (~|((2'd3)&&(2'sd1)));
  assign y16 = {((4'sd6)<={p7,a2,p5}),(2'd3),(2'sd0)};
  assign y17 = ({2{p1}}!=$signed((3'd4)));
endmodule
