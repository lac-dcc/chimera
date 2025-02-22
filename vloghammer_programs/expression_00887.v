module expression_00887(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (4'd2);
  localparam [4:0] p1 = ((~|((^(-2'sd0))^~((4'sd5)?(-4'sd5):(5'd16))))^~(4'sd2));
  localparam [5:0] p2 = ({(-((3'd2)|(5'sd12))),{4{(2'd2)}}}>({(3'd7),(5'sd15),(-3'sd1)}==(~^{(5'd6),(-4'sd3)})));
  localparam signed [3:0] p3 = (~(&(~^(&(+(~&(5'd27)))))));
  localparam signed [4:0] p4 = ((^(+((&{2{(3'd2)}})||(~((3'd6)-(3'sd2))))))&{3{(~((4'd5)===(2'sd0)))}});
  localparam signed [5:0] p5 = ({(~(5'sd7)),{(4'd9),(2'sd0),(2'd3)}}?{(+(3'sd3)),((2'd2)>>>(3'sd0))}:({(3'd3),(-3'sd0)}?((5'd24)?(-5'sd15):(-4'sd0)):(4'd10)));
  localparam [3:0] p6 = {4{{4{(4'd12)}}}};
  localparam [4:0] p7 = {3{{3{(5'd21)}}}};
  localparam [5:0] p8 = (4'd2 ** {4{(2'd2)}});
  localparam signed [3:0] p9 = (+(-4'sd5));
  localparam signed [4:0] p10 = ({1{({(5'd0),(2'd3),(-5'sd1)}?(-(3'd4)):{(5'sd1),(3'd2)})}}+{((4'sd0)^(3'sd2)),((2'd3)&(-4'sd6)),((2'd3)?(5'd9):(4'd6))});
  localparam signed [5:0] p11 = ((~|(~&(-4'sd6)))!=={4{(3'sd0)}});
  localparam [3:0] p12 = {(2'd1)};
  localparam [4:0] p13 = {3{((5'd29)===(4'd1))}};
  localparam [5:0] p14 = (({4{(4'd1)}}^~(4'd4))&{4{(~|(2'd2))}});
  localparam signed [3:0] p15 = (~(|(&(+(+(^(~&(~&(|(!(+(~(~^(~(5'sd0)))))))))))))));
  localparam signed [4:0] p16 = (!((5'd17)&{{(2'd2),(3'd1)}}));
  localparam signed [5:0] p17 = ({(4'd3)}?{(2'd2),(-4'sd7)}:((4'd9)==(4'd6)));

  assign y0 = (+(|(~^((~|{(~^{p8}),(b4!==a3)})&&(+(|(!(~^{p4,p10}))))))));
  assign y1 = {{({a3,p2,p15}?(&b3):(!p3)),(4'd9),(2'sd0)}};
  assign y2 = {1{{2{(4'sd5)}}}};
  assign y3 = ({1{{p10}}}&&(p15&p9));
  assign y4 = (~&((p14&&p17)<<<(~&p10)));
  assign y5 = {2{{4{a2}}}};
  assign y6 = (p15-p1);
  assign y7 = {({3{b3}}!==(2'd2)),({p13,p2,b3}&&{3{p6}}),({b3,p17}||(a1|p1))};
  assign y8 = ((p6?p13:p8)^(p10?p15:p15));
  assign y9 = (&{2{{b0,a2,p8}}});
  assign y10 = {3{{1{(-{4{a1}})}}}};
  assign y11 = ({4{b2}}!==(b3==b2));
  assign y12 = (((-a5)?(-a1):(p1))?{(p0&p0),(&{a4,p1})}:$signed((~{3{(~&p3)}})));
  assign y13 = (-(2'd2));
  assign y14 = (((~^a1)||(p11?p8:p9))?((3'sd0)^~(b1+b3)):(3'd4));
  assign y15 = {4{((b2)-(a1?p3:a0))}};
  assign y16 = ((a0!=p9)<{p9,p1,p16});
  assign y17 = (5'sd7);
endmodule
