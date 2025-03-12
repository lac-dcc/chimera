// Seed: 2497050043
module module_0 #(
    parameter id_10 = 32'd75,
    parameter id_16 = 32'd55,
    parameter id_7  = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output supply0 id_6;
  output reg id_5;
  output wire id_4;
  output tri1 id_3;
  output wire id_2;
  output wire id_1;
  wire [(  -1 'b0 ) : -1] _id_7;
  logic id_8;
  assign id_6 = 1;
  wire [1 : 1] id_9;
  for (_id_10 = id_8[-1 : id_10]; id_10; id_5 = id_9) logic id_11;
  assign id_3 = -1;
  logic [7:0][id_7 : -1  /  id_7] id_12;
  wire id_13;
  wire id_14, id_15;
  wire _id_16 = id_15;
  wire id_17;
  assign id_10 = id_12[1*id_16];
endmodule
module module_1 #(
    parameter id_14 = 32'd79,
    parameter id_3  = 32'd50,
    parameter id_4  = 32'd68,
    parameter id_5  = 32'd71,
    parameter id_6  = 32'd73,
    parameter id_7  = 32'd31,
    parameter id_8  = 32'd81
) (
    input wand id_0,
    output logic id_1,
    input wand id_2,
    input tri1 _id_3,
    input tri0 _id_4,
    output wand _id_5,
    input tri0 _id_6,
    input tri0 _id_7[-1 : ~  id_8],
    input supply0 _id_8[id_5  -  id_3 : -1]
);
  initial
  `define pp_10 0
  parameter id_11 = 1;
  id_12 :
  assert property (@(-1 or id_4) id_2 == 1) id_1 <= `pp_10;
  assign `pp_10[-1][id_8 : id_4] = 1'h0 && 1;
  wire id_13, _id_14;
  if (id_11) logic id_15;
  reg [id_7 : 1] id_16, id_17, id_18[id_5 : id_6], id_19, id_20;
  wire [id_14 : id_4] id_21, id_22;
  assign id_20 = id_4;
  module_0 modCall_1 (
      id_21,
      id_11,
      id_13,
      id_22,
      id_19,
      id_22
  );
  parameter id_23 = -1'b0;
  always id_18 <= id_15;
endmodule
