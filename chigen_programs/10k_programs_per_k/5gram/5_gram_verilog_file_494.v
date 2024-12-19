// Seed: 1595614535
module module_0 (
    output wire id_0,
    input wire id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wire id_6,
    input wire id_7,
    output tri id_8,
    output tri id_9
);
  wire id_11;
  wire id_12, id_13;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input tri id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply0 id_6,
    output wor id_7,
    output uwire id_8,
    output supply0 id_9,
    input uwire id_10,
    input supply0 id_11,
    output wor id_12,
    input wand id_13,
    input supply1 id_14,
    output uwire id_15,
    input wor id_16,
    output wire id_17,
    input supply1 id_18,
    input tri0 id_19,
    output tri id_20,
    input supply1 id_21
);
  xor primCall (id_9, id_19, id_2, id_5, id_21, id_18, id_0, id_3, id_16, id_4, id_14);
  module_0 modCall_1 (
      id_9,
      id_10,
      id_1,
      id_19,
      id_9,
      id_20,
      id_4,
      id_11,
      id_17,
      id_9
  );
  assign modCall_1.id_4 = 0;
endmodule
