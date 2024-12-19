// Seed: 3625546664
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wor id_4,
    output tri1 id_5,
    input supply0 id_6,
    output tri0 id_7,
    input wor id_8,
    input supply0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    output wand id_12,
    input uwire id_13,
    output supply1 id_14,
    input tri id_15,
    output supply1 id_16,
    input tri id_17,
    input wand id_18,
    input wire id_19,
    input wire id_20,
    input tri0 id_21,
    input tri1 id_22,
    input uwire id_23
);
  wire id_25;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    inout tri1 id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    output wire id_6,
    output supply1 id_7,
    output tri0 id_8
);
  xor primCall (id_2, id_3, id_1, id_4, id_0);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5,
      id_8,
      id_5,
      id_6,
      id_3,
      id_2,
      id_4,
      id_8,
      id_7,
      id_1,
      id_7,
      id_0,
      id_2,
      id_4,
      id_1,
      id_5,
      id_2,
      id_2,
      id_2,
      id_5
  );
  assign modCall_1.type_30 = 0;
endmodule
