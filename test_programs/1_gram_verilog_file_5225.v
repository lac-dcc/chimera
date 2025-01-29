// Seed: 124411969
program module_0 (
    input wor id_0,
    input wire id_1,
    output uwire id_2,
    input wand id_3,
    output wor id_4,
    input supply0 id_5,
    input uwire id_6,
    input supply0 id_7,
    output supply1 id_8,
    output supply0 id_9,
    input wire id_10,
    input wand id_11,
    input supply0 id_12,
    input tri0 id_13,
    input uwire id_14,
    output tri id_15,
    output supply1 id_16,
    input tri0 id_17,
    input uwire id_18,
    input tri id_19,
    input supply1 id_20,
    input tri id_21
);
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    output wor id_4,
    output wor id_5
);
  assign (highz1, supply0) id_4 = -1;
  xor primCall (id_4, id_3, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_11 = 0;
  wire id_7, id_8 = -1'h0;
endmodule
