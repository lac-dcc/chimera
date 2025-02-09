module expression_00303(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {{{((2'd2)>>(5'd15)),{(3'd4)},{(-2'sd1),(-4'sd4)}},{1{(&(-((2'd1)+(5'd28))))}}}};
  localparam [4:0] p1 = (((4'd10)<=(-3'sd2))>=((3'd3)<<<(5'd6)));
  localparam [5:0] p2 = (4'sd3);
  localparam signed [3:0] p3 = ({4{(3'd6)}}^~(-5'sd9));
  localparam signed [4:0] p4 = {{2{{(3'sd1),(2'd2)}}}};
  localparam signed [5:0] p5 = {(-(~^((+(2'd1))-((2'd0)!=(4'd13))))),((~|((3'd2)>>>(2'd2)))||{(4'sd0),(2'd0),(3'sd3)})};
  localparam [3:0] p6 = ({{(2'd0),(4'd2),(2'd1)}}!=={(5'sd6),(-3'sd1),(3'sd1)});
  localparam [4:0] p7 = (&(((5'd8)||((-4'sd2)/(-3'sd0)))^((+((2'sd0)==(-3'sd1)))&(!((5'sd7)%(4'd13))))));
  localparam [5:0] p8 = (((-5'sd8)-(2'd1))<<(~(-5'sd4)));
  localparam signed [3:0] p9 = ((5'd3)?((-5'sd0)|(-2'sd1)):(-4'sd6));
  localparam signed [4:0] p10 = {4{{1{((5'd13)?(2'sd1):(3'sd2))}}}};
  localparam signed [5:0] p11 = (|(-3'sd3));
  localparam [3:0] p12 = ({(5'sd13)}?((-5'sd4)-(2'd3)):((2'sd1)==(3'd1)));
  localparam [4:0] p13 = ((~^{2{((2'd3)?(5'sd0):(-4'sd1))}})?(^((-4'sd0)?(3'd4):(5'd1))):(~|{3{(-2'sd0)}}));
  localparam [5:0] p14 = (4'd3);
  localparam signed [3:0] p15 = (5'd23);
  localparam signed [4:0] p16 = {(|{{1{(|(^(-2'sd1)))}},(~^{1{{(2'd1),(2'd0),(5'd22)}}})})};
  localparam signed [5:0] p17 = ({3{{3{(-2'sd0)}}}}<<<({1{(-3'sd2)}}&&((5'd23)==(5'sd1))));

  assign y0 = $unsigned($unsigned($unsigned($unsigned(((+(!(~b1)))?((b4<<<a2)==(+b5)):(-(b2&a2)))))));
  assign y1 = $unsigned((2'd2));
  assign y2 = (4'd1);
  assign y3 = {({1{($unsigned($signed({{1{(+(|a1))}}})))}}),$unsigned({2{{$signed(b5),{2{a0}}}}})};
  assign y4 = ($signed((^((p5!=b2))))+(~&(+(b2>>>a2))));
  assign y5 = (((a3?b4:b4)?(p1||b0):(&p16))|(~|(!(~&(~^(&(&p6)))))));
  assign y6 = (p11);
  assign y7 = {3{(2'd0)}};
  assign y8 = (p3&a4);
  assign y9 = (!{{1{p1}}});
  assign y10 = (4'd2 ** {2{a0}});
  assign y11 = $signed({p5,p0});
  assign y12 = ((~|(a3^b2))!==(&(~b3)));
  assign y13 = $signed({((p4?p16:p11)+{p2}),$unsigned((a4?p13:p2))});
  assign y14 = (&($unsigned({(~^{(~|p15),{b0}})})));
  assign y15 = (-((-(|(^$signed((2'd2)))))|(5'd29)));
  assign y16 = {1{(~^((b5?p0:b2)?(~p8):{3{a5}}))}};
  assign y17 = {{4{{b2,b5,b3}}},{4{(3'sd3)}}};
endmodule
