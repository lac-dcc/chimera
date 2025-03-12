// Seed: 439803498
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wire id_2,
    output tri1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input uwire id_6,
    output tri id_7,
    input supply0 id_8,
    input tri1 id_9,
    output wand id_10,
    input uwire id_11,
    output wor id_12,
    input tri1 id_13
    , id_16,
    input wire id_14
);
  supply0 id_17;
  assign id_17 = 1;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input wor id_2,
    input wire id_3,
    output supply0 id_4,
    output wand id_5
);
  wire id_7 = id_0;
  or primCall (id_1, id_2, id_7, id_3, id_0);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0,
      id_1,
      id_3,
      id_1,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_0,
      id_2
  );
endmodule
