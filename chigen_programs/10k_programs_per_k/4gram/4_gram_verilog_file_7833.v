// Seed: 2353501800
module module_0 (
    input wor id_0,
    output wor id_1,
    input tri id_2,
    output tri0 id_3,
    output tri0 id_4,
    input uwire id_5,
    input wand id_6,
    output supply0 id_7,
    output tri1 id_8,
    output supply1 id_9,
    input tri1 id_10,
    output wire id_11,
    output wor id_12,
    input tri1 id_13,
    input wand id_14,
    input uwire id_15,
    output tri0 id_16,
    output wand id_17
);
  wire [-1  - "" : -1] id_19;
  wire id_20;
  assign id_7 = 1 + id_6;
endmodule
module module_1 #(
    parameter id_13 = 32'd21
) (
    output wor id_0,
    input wire id_1,
    input supply1 id_2,
    output wand id_3,
    output supply1 id_4,
    output supply0 id_5,
    output supply0 id_6,
    output supply1 id_7,
    input wand id_8,
    output tri id_9,
    input uwire id_10,
    output uwire id_11,
    input wor id_12,
    inout wor _id_13,
    output uwire id_14
);
  wire [id_13 : -1 'd0] id_16;
  logic id_17;
  wire id_18;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_5,
      id_4,
      id_1,
      id_8,
      id_11,
      id_3,
      id_7,
      id_10,
      id_9,
      id_3,
      id_12,
      id_1,
      id_12,
      id_3,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule
