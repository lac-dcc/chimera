// Seed: 1494517464
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wand id_5,
    input tri0 id_6,
    output tri1 id_7,
    output supply0 id_8,
    input tri id_9,
    output supply0 id_10,
    output wor id_11,
    output wand id_12,
    input supply1 id_13,
    output tri0 id_14,
    input uwire id_15,
    input wand id_16,
    output supply0 id_17,
    output supply1 id_18
);
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input wand id_3,
    output wand id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply1 id_7
    , id_10,
    output uwire id_8
);
  wire id_11;
  xor primCall (id_4, id_7, id_11, id_2, id_10, id_6, id_1);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5,
      id_8,
      id_7,
      id_8,
      id_8,
      id_5,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
