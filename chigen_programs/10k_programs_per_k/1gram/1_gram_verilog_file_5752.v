// Seed: 3221353376
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    output tri0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    input wire id_11,
    input supply1 id_12,
    output supply1 id_13,
    input supply0 id_14,
    input supply0 id_15,
    input wor id_16,
    output wire id_17
);
  assign id_17 = 1;
  wire id_19, id_20;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    output wand id_4,
    input wor id_5,
    output wor id_6,
    input uwire id_7
);
  wire id_9, id_10;
  xor primCall (id_2, id_5, id_3, id_10, id_7, id_0, id_1, id_9);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_6,
      id_4,
      id_2,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_5,
      id_2,
      id_5,
      id_3,
      id_7,
      id_2
  );
endmodule
