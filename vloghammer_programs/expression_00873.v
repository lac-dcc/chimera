module expression_00873(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = ((((2'd2)^~(-3'sd3))!=((5'd26)>(4'd10)))^~(~|(2'sd1)));
  localparam [4:0] p1 = {(5'd4)};
  localparam [5:0] p2 = ((~(^(-4'sd5)))+(!(~|(4'sd7))));
  localparam signed [3:0] p3 = {2{{3{(3'd5)}}}};
  localparam signed [4:0] p4 = ((~|((~|(5'd27))&{(2'd2),(-2'sd0),(4'sd4)}))<<(+(+((5'd16)!==(2'd1)))));
  localparam signed [5:0] p5 = ((4'd15)?(4'sd7):(-4'sd4));
  localparam [3:0] p6 = (~^(~&(-(((~^(-4'sd2))^~(|(5'sd3)))||(~&(~^(~&((4'd15)?(2'd3):(5'd15)))))))));
  localparam [4:0] p7 = (((2'd2)!=(-2'sd0))?((-5'sd9)&(4'd3)):{3{(-3'sd2)}});
  localparam [5:0] p8 = ({{(2'd1)},((4'd10)<<(2'd2))}!=((5'sd1)-(~^(-2'sd1))));
  localparam signed [3:0] p9 = (-((5'sd3)?(5'd12):(2'd2)));
  localparam signed [4:0] p10 = (((-3'sd3)&&(3'sd0))>=(-{(-3'sd2)}));
  localparam signed [5:0] p11 = (+(+(^({3{(5'd7)}}?(|(&(~(4'd11)))):{4{(-2'sd0)}}))));
  localparam [3:0] p12 = ({2{{(3'd1),(5'd30)}}}>>>(|(~|(~^(5'd0)))));
  localparam [4:0] p13 = {(-2'sd0),(5'sd12),(2'sd1)};
  localparam [5:0] p14 = ({2{(-2'sd0)}}<<((3'd7)&&(3'd6)));
  localparam signed [3:0] p15 = ((((-5'sd8)<=(-5'sd2))&(~|(-5'sd4)))>>(((-3'sd2)<=(-5'sd13))!=((-5'sd4)-(2'sd1))));
  localparam signed [4:0] p16 = (((3'sd1)/(3'd4))?(~((2'd2)?(4'd8):(2'd2))):((3'd4)?(3'd4):(4'sd2)));
  localparam signed [5:0] p17 = ({(!(((2'sd1)<=(2'd2))^((4'd11)<(-5'sd14))))}>>>(!(((4'sd7)^(-3'sd3))!=((2'd1)<<(2'sd1)))));

  assign y0 = {3{{{1{p3}},(~p8)}}};
  assign y1 = (((a2^~b3)-(2'd2))?{({b1}?(b3>a2):{4{a4}})}:{3{(b5-a3)}});
  assign y2 = ((-a0)===(a0^b4));
  assign y3 = $unsigned((~^(p0?a3:a5)));
  assign y4 = (({3{p2}}-(p11-p8))>=((a4<=b0)!==(a4^a5)));
  assign y5 = ((6'd2 ** (~&(b2<=p7)))>>>((b0?b3:p1)?(^(~|b2)):(a2?b5:a1)));
  assign y6 = {2{b3}};
  assign y7 = (&({4{a0}}==(3'sd2)));
  assign y8 = (({4{$unsigned(a2)}})>=(({({a3}|{p0,p2}),{2{(p6||p15)}}})));
  assign y9 = ((!{p11})>(&$unsigned(a2)));
  assign y10 = (~&({3{(~&{4{p0}})}}^~(3'd2)));
  assign y11 = (-3'sd2);
  assign y12 = (((b1>a2)?$unsigned({1{b1}}):(a1&&b3))>=((a4?a1:b2)?(b0<<a0):{1{(b3?b5:b3)}}));
  assign y13 = $signed($signed(((4'd8)>>>{{a3}})));
  assign y14 = {{{{1{(&(~p15))}},{(~{p13,p12,p1})}}}};
  assign y15 = (p6*p3);
  assign y16 = (~(((p0?p12:p4))?(~(p10?p2:p4)):(~|(~(p4%p1)))));
  assign y17 = ((b0-a0));
endmodule
