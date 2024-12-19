// Seed: 3224672595
module module_0 (
    input wire id_0,
    output supply0 id_1,
    output wand id_2,
    input wor id_3,
    output tri0 id_4,
    input wire id_5,
    output wire id_6,
    output supply0 id_7,
    output tri1 id_8,
    input tri1 id_9,
    input tri id_10,
    output tri id_11,
    input wire id_12,
    input wand id_13,
    input wand id_14
);
  wire id_16;
  assign id_11 = id_13;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    output wire id_2,
    input wor id_3,
    input supply0 id_4,
    input supply1 id_5
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_2,
      id_0,
      id_2,
      id_5,
      id_5,
      id_0,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_12 = 0;
  xor primCall (id_0, id_5, id_1);
endmodule
