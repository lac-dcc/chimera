module expression_00108(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {4{{2{(2'sd0)}}}};
  localparam [4:0] p1 = ({(5'd14),(4'd11),(5'd5)}>>>((~|(2'd3))-((3'sd0)==(5'd23))));
  localparam [5:0] p2 = ((~|{4{(4'd1)}})<{(|(4'sd0)),{4{(4'sd5)}}});
  localparam signed [3:0] p3 = ({(5'd26)}<{(3'd0),(3'd4)});
  localparam signed [4:0] p4 = {1{{2{(&(^{4{(3'd6)}}))}}}};
  localparam signed [5:0] p5 = (~&(|((~&((4'd0)?(3'd5):(-4'sd5)))+(~((2'd0)?(4'sd2):(2'd1))))));
  localparam [3:0] p6 = (((4'd6)===(2'd2))?((5'sd14)^~(-2'sd1)):((5'd29)?(4'sd0):(2'd3)));
  localparam [4:0] p7 = (6'd2 ** (|(~(4'd13))));
  localparam [5:0] p8 = (~(-{4{((2'd2)&(-3'sd1))}}));
  localparam signed [3:0] p9 = {((((5'd25)<(4'd6))<((-3'sd0)?(2'sd1):(4'sd7)))&&({(-4'sd5),(3'sd0)}<<{(3'd1)})),(((2'd0)?(-3'sd0):(3'sd2))>=((2'd0)?(-5'sd15):(4'sd3)))};
  localparam signed [4:0] p10 = ((~&(~((~|(2'd0))-(!(3'd4)))))|(~(~&(~|(&{1{(4'd1)}})))));
  localparam signed [5:0] p11 = {({2{(2'd2)}}||{3{(4'd8)}})};
  localparam [3:0] p12 = (!(+(-((((3'sd1)>>(5'sd12))>=((-3'sd2)<(-2'sd0)))?((~(-5'sd7))==((3'd3)?(2'sd1):(2'd2))):(~(!(~&(-2'sd0))))))));
  localparam [4:0] p13 = (5'd20);
  localparam [5:0] p14 = {({(2'd1),(-2'sd0),(5'sd14)}-((5'd22)>=(5'd12))),{1{{(((-3'sd3)-(4'd15))^~((5'd11)?(3'sd0):(2'sd1)))}}}};
  localparam signed [3:0] p15 = (|((((-4'sd1)>>(5'd20))?(2'sd0):(2'sd0))-(2'd2)));
  localparam signed [4:0] p16 = (|(((5'd24)-(5'sd2))<((-4'sd2)>(4'd13))));
  localparam signed [5:0] p17 = {{2{((-2'sd1)<<<(-4'sd5))}},((-5'sd15)?(-5'sd4):(5'd2))};

  assign y0 = (~&(-2'sd1));
  assign y1 = (p12<<p11);
  assign y2 = (!((b2?b0:b3)?(2'd2):(~(-2'sd0))));
  assign y3 = (2'd3);
  assign y4 = (4'sd7);
  assign y5 = (({b3,p14}&(p13?p1:p12))>>>(5'd31));
  assign y6 = (~^{{p11,p3,p14},(-{p13,p5})});
  assign y7 = ((~&{2{b1}})>>(p3>>p17));
  assign y8 = $unsigned((|$unsigned($unsigned({1{({2{(b5<a5)}}!=={2{{1{{4{a4}}}}}})}}))));
  assign y9 = $unsigned({1{$unsigned({3{{3{$signed(b1)}}}})}});
  assign y10 = (((^$unsigned(b4))||(+(b3<<<b5)))?{{b4,p6,b0},(~(b4>>>a3))}:({a2,b0,b5}!=(&(&a4))));
  assign y11 = (+(!$signed((4'd13))));
  assign y12 = ({{2{{3{p1}}}}}<(~&(2'sd1)));
  assign y13 = (&(&(~(p16?p15:p13))));
  assign y14 = (3'd6);
  assign y15 = {((b5!=p3)^~(a3===a5)),((a5<<<a2)===(a5&a0)),((p1-b0)<(b1||a3))};
  assign y16 = (((p17?b0:p16)+(p13?p17:b1))|((b0?b5:a2)<=((b2^a1)%p5)));
  assign y17 = (&(&(5'd2)));
endmodule
