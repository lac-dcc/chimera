// Seed: 1507399455
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wire id_3,
    input supply0 id_4,
    input wand id_5,
    input tri id_6,
    output wor id_7,
    output tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    output supply0 id_11,
    input wire id_12,
    input wand id_13,
    output supply0 id_14,
    output tri0 id_15,
    output supply1 id_16,
    output uwire id_17,
    output wand id_18,
    output supply0 id_19,
    output tri1 id_20#(.id_25(-1)),
    input tri id_21,
    input wor id_22,
    output tri1 id_23,
    id_26
);
  assign id_16 = -1;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input supply1 id_2,
    input wire id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    output wand id_7,
    input tri id_8,
    input tri1 id_9,
    input wire id_10,
    inout wor id_11,
    output supply0 id_12,
    input supply0 id_13,
    input supply0 id_14,
    input wor id_15,
    input tri1 id_16,
    output tri1 id_17
);
  assign id_1 = 1'b0;
  nand primCall (
      id_12, id_4, id_0, id_2, id_6, id_15, id_10, id_9, id_8, id_14, id_11, id_13, id_3, id_16
  );
  module_0 modCall_1 (
      id_4,
      id_16,
      id_17,
      id_2,
      id_2,
      id_13,
      id_4,
      id_7,
      id_11,
      id_17,
      id_2,
      id_5,
      id_15,
      id_2,
      id_7,
      id_11,
      id_1,
      id_17,
      id_11,
      id_12,
      id_1,
      id_8,
      id_11,
      id_12
  );
endmodule
