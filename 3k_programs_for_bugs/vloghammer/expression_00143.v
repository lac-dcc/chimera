module expression_00143(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {(5'd25),(2'd2)};
  localparam [4:0] p1 = (3'd0);
  localparam [5:0] p2 = ((((2'sd0)>>>(5'd31))<=(^((3'sd3)^~(-2'sd1))))<<<((!((3'd5)==(5'd14)))!==(^{(2'sd0),(4'd4)})));
  localparam signed [3:0] p3 = (3'd3);
  localparam signed [4:0] p4 = (~{1{(~{3{(|(!(2'd2)))}})}});
  localparam signed [5:0] p5 = {2{{4{(4'd8)}}}};
  localparam [3:0] p6 = (~&((~|(5'd16))|{(2'd0)}));
  localparam [4:0] p7 = (|(+{1{(!(((2'd2)&&(2'd3))<{2{(-2'sd1)}}))}}));
  localparam [5:0] p8 = ((-4'sd4)?({(3'sd3)}+((2'd0)<<<(2'd1))):(4'd5));
  localparam signed [3:0] p9 = {2{(-5'sd4)}};
  localparam signed [4:0] p10 = (|(5'sd12));
  localparam signed [5:0] p11 = {{(5'd16),(5'd18)},(~(5'd28)),(~&(4'sd3))};
  localparam [3:0] p12 = (~(((-2'sd1)?(-4'sd5):(5'sd1))?((-3'sd2)?(3'd0):(2'd3)):(~&(3'd5))));
  localparam [4:0] p13 = (^(-(!(~^(~^(|(~(!(((-2'sd0)!=(4'd4))&&((-4'sd3)|(2'd1)))))))))));
  localparam [5:0] p14 = {({2{{4{(-2'sd1)}}}}>({4{(3'sd2)}}>>>{(-3'sd2),(3'd5)}))};
  localparam signed [3:0] p15 = ({((3'sd1)?(3'd0):(-2'sd1))}?{{4{(5'd9)}}}:({(2'sd1),(-3'sd3),(-4'sd6)}?{1{(5'd19)}}:{1{(5'd2)}}));
  localparam signed [4:0] p16 = ((-(((-4'sd0)?(3'd6):(5'sd1))&&((2'sd1)|(4'sd5))))&((2'sd1)^~((5'sd2)>>(-2'sd0))));
  localparam signed [5:0] p17 = (((~|(5'sd13))<{(4'd15)})?(((2'sd1)?(3'd0):(2'd1))==((5'sd14)==(4'd9))):(3'sd3));

  assign y0 = {3{(~p8)}};
  assign y1 = (-({p10,p13,p15}?$unsigned((p14?p17:p8)):{(p11|p10),(p2)}));
  assign y2 = (-((((b5)!=(a2&&b5)))===($signed((+b3))>>((a0)))));
  assign y3 = (((a5?a3:a4)!==(~|((a5-b3))))<<<($signed($signed((b5?b0:a3)))!==($signed(b3)<=(a2==b3))));
  assign y4 = ((~^(b1>a3))?(p7?b2:b0):(p16?a1:a5));
  assign y5 = ((-(^(~a5)))>>((b4&a0)>(b4===b4)));
  assign y6 = {4{{{p15,b1}}}};
  assign y7 = (-(-4'sd3));
  assign y8 = ((-3'sd0));
  assign y9 = (4'd2 ** p7);
  assign y10 = (~|(((b4>>a5)<=(a2<=p14))!=(+((-3'sd3)!=$unsigned(p0)))));
  assign y11 = ((p13?p7:a0)||(p12?p14:p10));
  assign y12 = ((a5!=p11)?(a3?p15:a1):(~^a3));
  assign y13 = (~{(((a3&a5)===(b2<a5))!==(~&(!(~|b2))))});
  assign y14 = (+(3'd7));
  assign y15 = (^{4{(&{3{p17}})}});
  assign y16 = ((b5?b1:p12)?{4{b3}}:(a4+p9));
  assign y17 = ((3'sd0)<<<(5'sd8));
endmodule
