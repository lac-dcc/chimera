// Seed: 657568539
module module_0 (
    input supply1 id_0
    , id_8,
    output tri1 id_1,
    output tri1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6
);
  always begin : LABEL_0
    id_8 <= 1;
  end
endmodule
module module_1 #(
    parameter id_15 = 32'd26,
    parameter id_2  = 32'd94,
    parameter id_4  = 32'd16
) (
    input  tri  id_0,
    input  wire id_1,
    input  wire _id_2,
    input  tri0 id_3,
    input  tri  _id_4,
    input  tri0 id_5,
    input  tri  id_6,
    output wor  id_7,
    input  tri1 id_8,
    output tri0 id_9,
    output tri  id_10,
    input  wand id_11,
    input  tri  id_12,
    output tri0 id_13
);
  wire [1 'b0 : -1] _id_15, id_16, id_17;
  logic [7:0][id_4] id_18, id_19;
  logic id_20;
  ;
  assign id_13 = id_1 !== id_20[id_2];
  parameter id_21 = 1;
  logic id_22 = id_3;
  wire  id_23;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_13,
      id_3,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_2 = 0;
  if (id_21[-1]) assign id_9 = id_3;
  wire [-1 'b0 : id_15] id_24, id_25, id_26;
endmodule
