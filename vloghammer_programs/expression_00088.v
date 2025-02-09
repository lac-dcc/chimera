module expression_00088(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (&(-4'sd5));
  localparam [4:0] p1 = (~^(^(5'd27)));
  localparam [5:0] p2 = {((~|((2'sd1)&(-3'sd1)))<<{(3'd4),(3'sd0)}),(+{((-5'sd3)&&(3'sd0)),{(3'd5),(5'd27)},{(-3'sd3),(-5'sd4)}})};
  localparam signed [3:0] p3 = (^(-4'sd0));
  localparam signed [4:0] p4 = (((2'd2)?(2'sd0):(-3'sd0))<<<(2'd0));
  localparam signed [5:0] p5 = {((-3'sd0)|(4'sd2)),(6'd2 ** (5'd24))};
  localparam [3:0] p6 = ((~^(~|(~{1{{4{(5'd20)}}}})))&&(-((^(4'sd2))^~((-2'sd1)<<<(-3'sd3)))));
  localparam [4:0] p7 = ((4'd12)>>(4'd2));
  localparam [5:0] p8 = ((4'd9)==(4'd10));
  localparam signed [3:0] p9 = (5'd30);
  localparam signed [4:0] p10 = (2'd3);
  localparam signed [5:0] p11 = (!(-((&((2'd2)+(2'd3)))!=(|((4'sd3)<(2'sd1))))));
  localparam [3:0] p12 = (5'sd11);
  localparam [4:0] p13 = {1{{{4{(5'sd12)}}}}};
  localparam [5:0] p14 = {{((2'd1)?((4'sd7)?(5'd3):(5'sd12)):((-4'sd2)?(2'd0):(-4'sd5))),{(-4'sd0),(6'd2 ** (5'd18)),((3'd3)?(4'sd2):(4'd2))}}};
  localparam signed [3:0] p15 = ((-5'sd0)?(3'sd1):(-3'sd0));
  localparam signed [4:0] p16 = (|(!(~(+(~^(&((5'sd3)===(2'd2))))))));
  localparam signed [5:0] p17 = ((-2'sd0)<(-4'sd1));

  assign y0 = ((3'sd2)+{2{p5}});
  assign y1 = (&p3);
  assign y2 = (~^(4'd6));
  assign y3 = (($signed(b0)<<(a4||a4))==(($signed(b1)==(b4<b1))));
  assign y4 = ({3{(a0>=a4)}}<<<{3{{3{p17}}}});
  assign y5 = (~|{2{(^$unsigned((!(p15>>p6))))}});
  assign y6 = (({b3,b3}^{b3,a3})^~{(a4<<a5),(a1||a0)});
  assign y7 = ({p16,p4}^(p1-p14));
  assign y8 = (p11?a2:a5);
  assign y9 = {{a1,a1,b5},(p0?b5:p2)};
  assign y10 = ((~^(^((5'sd1)-(~(p13<<p15)))))+(~|(((^p3)*(!p2))>=((-2'sd0)<(-3'sd1)))));
  assign y11 = (~^(p17?p14:a0));
  assign y12 = {1{(-(p13<<p10))}};
  assign y13 = (+{4{b2}});
  assign y14 = (-{1{{3{((b3<<<p10))}}}});
  assign y15 = ((4'sd4)>=(a2|b4));
  assign y16 = ((p10?p15:p14)+(p11));
  assign y17 = $signed((((|{2{(!b3)}})<{(b3<<b5),(a5>b4)})^(^(|({2{(^a2)}}^{3{a2}})))));
endmodule
