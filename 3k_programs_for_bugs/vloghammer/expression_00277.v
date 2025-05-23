module expression_00277(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = {(~|(2'd0)),((4'd8)===(4'd15))};
  localparam [4:0] p1 = (^(~&(^((5'd27)*(5'd28)))));
  localparam [5:0] p2 = {3{(~|{1{(3'sd2)}})}};
  localparam signed [3:0] p3 = (~|(4'd7));
  localparam signed [4:0] p4 = (~(!(2'd1)));
  localparam signed [5:0] p5 = (5'd18);
  localparam [3:0] p6 = {(((3'd0)|(3'd6))^~{1{(5'd17)}}),{4{(3'd1)}},(((4'd14)|(5'd18))|{(2'd1)})};
  localparam [4:0] p7 = ({4{(-3'sd3)}}<=(-2'sd1));
  localparam [5:0] p8 = ((((3'd6)?(2'sd0):(3'd2))!=(^(3'd4)))<<<(((-4'sd3)<=(4'd13))<(~(4'sd4))));
  localparam signed [3:0] p9 = {4{(~(5'd14))}};
  localparam signed [4:0] p10 = ((((2'd0)==(-2'sd1))<<<((3'd7)%(5'd26)))<<<(((-3'sd3)===(-2'sd1))*((5'sd9)<=(5'd21))));
  localparam signed [5:0] p11 = ({4{(2'd1)}}|{4{(5'd6)}});
  localparam [3:0] p12 = {3{(~|{3{(3'd1)}})}};
  localparam [4:0] p13 = (5'd11);
  localparam [5:0] p14 = ((2'd3)&&(+(-((-4'sd1)|(-5'sd3)))));
  localparam signed [3:0] p15 = (&{4{{2{(2'd2)}}}});
  localparam signed [4:0] p16 = (((2'd1)^(-2'sd0))&(-((2'sd1)===(5'd17))));
  localparam signed [5:0] p17 = (((3'd6)?(2'd1):(3'd6))-{4{(3'd7)}});

  assign y0 = (((3'd4)&&(~(p8==p16)))>>>(((-4'sd0)*(&b5))||(+(p13&p1))));
  assign y1 = (($signed({2{p4}})&({(~&p1)}))<{{(p13?p3:p16),(-$signed(p11)),{p5,p10,p5}}});
  assign y2 = (~({1{{3{p7}}}}>=((a4<<<p3)!=(^a5))));
  assign y3 = (p4|a2);
  assign y4 = (~(-(((b0<<<a4)^{4{a4}})&&((-(4'd2 ** a1))<<<{1{(b2)}}))));
  assign y5 = (-5'sd13);
  assign y6 = (^$unsigned(((~&$unsigned($signed((~&(~&p0)))))|(4'sd5))));
  assign y7 = (((-3'sd3)?(b4?b1:b5):(a4?a0:a5))>>((b5>=b4)?(-5'sd11):(-3'sd1)));
  assign y8 = (p11?p10:p0);
  assign y9 = $signed((-({{p6,p15}}^(p4?p5:p14))));
  assign y10 = {({a4,p13,p2}-{4{p9}}),({3{p4}}&(a0?b4:p1))};
  assign y11 = ({(+(+{{p9},{3{p6}}}))}?(~^(|(5'd8))):{2{{4{p11}}}});
  assign y12 = (((b3===a4)/a2)||((b1>>>b2)===(a1-a1)));
  assign y13 = (5'd2 ** (p7>>p8));
  assign y14 = {{(p16==b0),(b1!==a4),(~|p7)},{(5'd2 ** b1),{1{p11}},(~^p13)}};
  assign y15 = ((a0<<p15)?(b1>>p11):(p15<<p14));
  assign y16 = {3{(p17?p0:p11)}};
  assign y17 = ({((p11||p0)||{p2}),{p4,p12,p11}}||({a0,b4,b4}!=={(b3&&a3),(-b0)}));
endmodule
