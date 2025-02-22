module expression_00016(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = ({(3'd1),(5'sd11)}>>>((5'd25)|(5'sd0)));
  localparam [4:0] p1 = (5'sd12);
  localparam [5:0] p2 = (2'd0);
  localparam signed [3:0] p3 = ((((2'd1)?(-2'sd0):(2'd1))-(-3'sd3))&&{(-4'sd3),(-5'sd6),(4'd6)});
  localparam signed [4:0] p4 = (|{1{({4{(-2'sd0)}}?((2'd2)?(4'd8):(-2'sd1)):(~^{3{(2'd2)}}))}});
  localparam signed [5:0] p5 = {4{{1{((5'd2)+(5'd16))}}}};
  localparam [3:0] p6 = {3{(&(-5'sd1))}};
  localparam [4:0] p7 = (((2'sd1)&&(5'sd4))?(&((-2'sd1)/(5'd1))):(|((5'sd1)?(4'd13):(4'sd1))));
  localparam [5:0] p8 = (3'd1);
  localparam signed [3:0] p9 = ((3'd6)/(5'd23));
  localparam signed [4:0] p10 = ((4'sd3)?(5'd20):(4'sd1));
  localparam signed [5:0] p11 = {{(4'sd6)}};
  localparam [3:0] p12 = ({3{((-2'sd0)^(-2'sd1))}}>=(((-3'sd0)==(2'd3))?((2'd0)?(5'sd7):(5'd6)):{4{(3'd1)}}));
  localparam [4:0] p13 = ((5'sd13)<<<(-3'sd2));
  localparam [5:0] p14 = ({((-{(3'sd3),(-2'sd0)})^(-{(5'sd5)}))}!={{(2'sd0),(3'sd0)},(~&((-3'sd1)+(-3'sd2)))});
  localparam signed [3:0] p15 = ((3'd4)?(2'sd0):(4'd5));
  localparam signed [4:0] p16 = ({2{(5'd9)}}=={1{(2'sd1)}});
  localparam signed [5:0] p17 = ((-{3{(-4'sd7)}})!=(5'd19));

  assign y0 = $signed($unsigned((((5'd25)<<$unsigned((2'sd1))))));
  assign y1 = (~^((b3&&b4)<=(b4+p15)));
  assign y2 = $unsigned({4{(~(~(~b5)))}});
  assign y3 = (2'sd1);
  assign y4 = (|((-4'sd5)>((3'sd0)===(-5'sd0))));
  assign y5 = (!(!(({b2,p7}^~{b2,p17,a5})&({2{p15}}==(p15^p5)))));
  assign y6 = (!{2{(~&{2{{4{b1}}}})}});
  assign y7 = {{4{{4{p0}}}},((p10<<p17)^~(~|(p2||p10)))};
  assign y8 = (b0<<p13);
  assign y9 = (5'sd9);
  assign y10 = {4{(3'sd0)}};
  assign y11 = (({2{$signed({4{b0}})}})+(((b5|b2)?{1{b3}}:(~^a3))&((~&a5)?(a0-a0):{3{b1}})));
  assign y12 = {2{(((a3|a4)!=={1{b1}})^~(+{3{p5}}))}};
  assign y13 = (-4'sd3);
  assign y14 = {1{{3{(p11!=p15)}}}};
  assign y15 = (~&(~((&(^(-(((~p15)||(p8==a4))))))-(|$unsigned((&($unsigned(p0)||(p8+p5))))))));
  assign y16 = ((!(~&((~|(a4>>>b2))<<(-(b1+b5)))))^~(((b4>=b3)<(b2!=p12))<(~(&(a4&a1)))));
  assign y17 = ((^(|{2{(b0>=p3)}}))|{(4'd2 ** {4{b0}})});
endmodule
