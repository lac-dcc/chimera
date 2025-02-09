module expression_00835(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (~&{(|{{((2'd3)<=(3'sd2))},(^((5'sd2)<(5'sd4)))})});
  localparam [4:0] p1 = (&{{{2{{(((-3'sd3)!=(3'd4))|{(3'd5),(4'd7),(5'sd4)})}}}}});
  localparam [5:0] p2 = {2{(~({4{(2'd2)}}?((2'd3)?(-4'sd4):(5'd12)):{4{(5'sd11)}}))}};
  localparam signed [3:0] p3 = (((3'sd2)?(3'd6):(4'd12))^~((2'd2)===(-2'sd1)));
  localparam signed [4:0] p4 = ((5'd4)&&(-2'sd0));
  localparam signed [5:0] p5 = {(~&({(3'd4),(-2'sd1),(-3'sd2)}?{3{(2'd3)}}:((5'd17)<(2'd1)))),((6'd2 ** (5'd16))-(~|((-2'sd0)==(2'sd0))))};
  localparam [3:0] p6 = {3{(2'd0)}};
  localparam [4:0] p7 = {3{(-4'sd2)}};
  localparam [5:0] p8 = ((5'sd2)*(3'd7));
  localparam signed [3:0] p9 = (((5'd17)<<<(4'sd3))<((5'sd8)!==(4'sd5)));
  localparam signed [4:0] p10 = (~|(((3'sd1)>>>(4'd3))<<((2'd3)>(-2'sd1))));
  localparam signed [5:0] p11 = {({(3'd3),(2'd1),(5'd25)}>>>((4'd11)!==(-4'sd1))),(&(!((4'd9)==(3'd0)))),(4'd2 ** ((4'd11)!==(4'd0)))};
  localparam [3:0] p12 = {(3'd1)};
  localparam [4:0] p13 = ((~|(3'd2))?((5'sd8)^~(-4'sd4)):((2'sd0)?(5'd15):(5'd8)));
  localparam [5:0] p14 = (5'd8);
  localparam signed [3:0] p15 = {3{(((3'sd3)&&(4'd4))>=((-3'sd2)+(-3'sd2)))}};
  localparam signed [4:0] p16 = ({(4'd3),(3'd6)}?{2{(3'sd2)}}:((3'sd3)?(3'd0):(5'd12)));
  localparam signed [5:0] p17 = ({(2'sd1)}|(3'd4));

  assign y0 = (^(~^(!(b5&p10))));
  assign y1 = (((b2+a4)>>(5'd0))>>({b4,a1,b0}!=(b1!==a5)));
  assign y2 = (((a3==b1)<(p1&p0))-{1{((a3&b4)===(a5^~b3))}});
  assign y3 = ((p12-p16)<(&p7));
  assign y4 = (a1?p17:p2);
  assign y5 = {2{(+({1{(5'd11)}}===(~&(-5'sd13))))}};
  assign y6 = (~(-{(+{{((~&p7)<{a3})},(~|{a3,p10,a0}),(&((~a2)^~(~^a4)))})}));
  assign y7 = ({1{$signed(({$unsigned(a4),{2{a3}},{1{b0}}}))}}-{3{$unsigned({2{a3}})}});
  assign y8 = (-(2'sd0));
  assign y9 = {(~&(!{{p0,p0},(~(-p3))}))};
  assign y10 = (-4'sd3);
  assign y11 = (~p10);
  assign y12 = {2{{4{{1{p7}}}}}};
  assign y13 = ((-a0)?(&b5):(!p0));
  assign y14 = {(4'd7),(a1&&b4)};
  assign y15 = ({$unsigned(b0)});
  assign y16 = (4'sd2);
  assign y17 = (($unsigned((~|(^{{(~&b4)},((~p16)),(!{p13})})))));
endmodule
