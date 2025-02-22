module expression_00267(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (+(~(((~|((5'sd11)<<(-3'sd2)))<<<(~|(+(2'd0))))<<<(((5'd15)?(-4'sd3):(5'd30))?((-2'sd0)|(5'sd3)):(~|(-3'sd0))))));
  localparam [4:0] p1 = ((-2'sd1)?(((-2'sd1)===(2'd1))!=((3'd6)||(-3'sd0))):(3'd2));
  localparam [5:0] p2 = {2{{1{({1{{2{(-4'sd4)}}}}===(~(^(3'sd0))))}}}};
  localparam signed [3:0] p3 = (((-5'sd4)?(2'd3):(4'sd3))?(3'd0):(-3'sd2));
  localparam signed [4:0] p4 = ((((3'd3)==(-5'sd12))===(4'd0))>>>(+(4'sd5)));
  localparam signed [5:0] p5 = {(6'd2 ** {(2'd1),(3'd2)}),{2{{2{(-2'sd1)}}}}};
  localparam [3:0] p6 = (4'd8);
  localparam [4:0] p7 = {(|(-{2{(-4'sd6)}})),({4{(-4'sd0)}}||{3{(-2'sd1)}}),(^(^((5'd25)!==(5'd22))))};
  localparam [5:0] p8 = ((&((|(4'd3))?((4'd12)+(3'd3)):((3'd0)?(2'd0):(2'sd1))))===((~&(&(4'd7)))?((-2'sd0)?(2'sd0):(5'd3)):((4'd4)?(4'sd7):(2'd0))));
  localparam signed [3:0] p9 = {3{(3'sd1)}};
  localparam signed [4:0] p10 = (^{((((2'd2)+(2'sd0))+((-5'sd3)<(5'd28)))?((-2'sd0)?(4'sd4):(4'd13)):((~^(-4'sd1))&(|(-4'sd7))))});
  localparam signed [5:0] p11 = (~|((2'd0)?(4'd10):(3'sd2)));
  localparam [3:0] p12 = ({{1{(2'd3)}},{3{(-2'sd0)}},((4'd9)<(5'd31))}||{{1{({(4'd11),(4'sd1)}+{(2'd2),(5'd31)})}}});
  localparam [4:0] p13 = (((((-3'sd0)>(-5'sd2))!==((3'd7)!==(4'd15)))!==(((3'sd1)<=(5'd1))!==((5'sd12)<=(2'd1))))||(((5'd2 ** (5'd30))<=((3'd3)+(2'd0)))+(((5'd12)-(3'd2))||((-4'sd5)>=(5'd6)))));
  localparam [5:0] p14 = ((4'd2)!=(-4'sd5));
  localparam signed [3:0] p15 = ((((5'sd0)&&(3'sd2))%(-3'sd0))>=(((5'sd11)*(2'd1))>=((5'd14)%(2'sd1))));
  localparam signed [4:0] p16 = {4{((-4'sd6)|(4'sd2))}};
  localparam signed [5:0] p17 = ({(~&(4'd10)),{4{(3'sd3)}}}^~(+{3{(-2'sd1)}}));

  assign y0 = $unsigned(({b2,a5,b4}===(&(~|a2))));
  assign y1 = ({((p0?p3:p9)|{b0,p12,a4}),$signed(((p2?b4:p8)?(p14?p10:p1):$signed(p14)))});
  assign y2 = (4'd7);
  assign y3 = (p17>>>p13);
  assign y4 = {((a2?a2:b1)?(3'sd3):{p6,b2}),(~(-3'sd3))};
  assign y5 = (~&(-(3'sd0)));
  assign y6 = ({(~^{{3{a4}},(+a5),(!b2)})}?(|(!{(^{3{p11}})})):{{{a2}},{b5,b2}});
  assign y7 = (|(-4'sd3));
  assign y8 = (-4'sd2);
  assign y9 = (-3'sd0);
  assign y10 = ((~((~|(~|a2))/b3))|(~&((+(&(a0-b2)))^((4'd2 ** a1)!==(~&b1)))));
  assign y11 = (~&({1{(a1?a5:b3)}}?(b0?p4:b5):(a1===b2)));
  assign y12 = (~((~^p4)&&(p6>>>p13)));
  assign y13 = {(~^$unsigned((-2'sd1)))};
  assign y14 = {(~^{1{{1{{1{a1}}}}}}),((a2<<a1)?(5'd30):(a2?b1:a0)),({a2,a0,b2}?(b5?b4:a0):(a1?b2:b1))};
  assign y15 = (+(~(-(~&(~|(5'd31))))));
  assign y16 = (-5'sd5);
  assign y17 = (p1?p7:b3);
endmodule
