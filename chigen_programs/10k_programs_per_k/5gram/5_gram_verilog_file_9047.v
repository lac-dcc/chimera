// Seed: 1697874277
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    input wand id_4,
    input uwire id_5,
    input wand id_6,
    input tri1 id_7,
    output tri id_8,
    input tri0 id_9,
    output tri1 id_10,
    output wor id_11,
    input wor id_12,
    input wire id_13,
    input tri0 id_14,
    output tri id_15,
    output wand id_16
);
  wire [1 'b0 : 1] id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27;
endmodule
module module_1 #(
    parameter id_20 = 32'd79
) (
    input supply0 id_0,
    input wire id_1,
    output wand id_2,
    output tri id_3,
    output supply1 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    output wand id_9,
    input wor id_10,
    input tri1 id_11,
    input tri1 id_12,
    input wire id_13,
    input uwire id_14,
    output wire id_15,
    input wor id_16,
    output wor id_17,
    input supply1 id_18,
    input tri0 id_19,
    output wand _id_20
);
  wire id_22;
  logic [1 : id_20] id_23;
  module_0 modCall_1 (
      id_14,
      id_10,
      id_1,
      id_4,
      id_14,
      id_19,
      id_0,
      id_11,
      id_17,
      id_13,
      id_9,
      id_15,
      id_10,
      id_0,
      id_8,
      id_15,
      id_4
  );
  assign modCall_1.id_14 = 0;
  assign id_9 = id_8;
  assign id_2 = id_10;
  assign id_17 = 1 == id_14;
  wire id_24;
endmodule
