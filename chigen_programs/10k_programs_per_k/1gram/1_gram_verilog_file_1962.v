// Seed: 3670476034
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    output uwire id_6,
    input tri id_7,
    input wor id_8,
    input uwire id_9,
    input tri id_10,
    input wire id_11,
    input supply1 id_12,
    output supply0 id_13,
    output tri id_14[1 : 1],
    output tri1 id_15,
    input tri1 id_16,
    input tri1 id_17,
    input wand id_18,
    output wor id_19,
    output supply1 id_20
);
  struct packed {
    logic id_22;
    id_23 id_24;
  } id_25;
  logic id_26;
endmodule
module module_1 #(
    parameter id_1 = 32'd60
) (
    input tri0 id_0,
    input wor _id_1,
    output tri0 id_2,
    input supply0 id_3,
    input tri id_4[id_1 : 1],
    output wand id_5,
    input uwire id_6
);
  logic id_8;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_3,
      id_6,
      id_0,
      id_2,
      id_0,
      id_3,
      id_6,
      id_4,
      id_3,
      id_3,
      id_5,
      id_2,
      id_2,
      id_3,
      id_4,
      id_3,
      id_5,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
