// Seed: 3305539171
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    input supply1 module_0,
    output supply0 id_7,
    input wand id_8,
    output tri1 id_9,
    input tri1 id_10,
    output wor id_11,
    input wor id_12,
    input tri id_13,
    input wire id_14,
    input wor id_15
    , id_22,
    input wor id_16,
    output wire id_17,
    input uwire id_18,
    output wand id_19,
    input wire id_20
);
  parameter id_23 = 1 - 1;
  parameter id_24 = 1 - 1;
  wire  id_25;
  logic id_26 = 1;
endmodule
module module_1 #(
    parameter id_17 = 32'd2
) (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wire id_5,
    input uwire id_6,
    input tri0 id_7,
    input tri1 id_8,
    output wire id_9,
    output tri1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    output uwire id_16,
    input tri0 _id_17,
    input wor id_18,
    output tri1 id_19
);
  wire ["" : id_17] id_21;
  logic id_22;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_19,
      id_8,
      id_3,
      id_3,
      id_14,
      id_19,
      id_14,
      id_16,
      id_12,
      id_10,
      id_13,
      id_4,
      id_0,
      id_7,
      id_11,
      id_10,
      id_1,
      id_9,
      id_8
  );
  assign modCall_1.id_20 = 0;
endmodule
