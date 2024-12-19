// Seed: 994411526
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    input wire id_4,
    output wor id_5
    , id_16,
    output tri id_6,
    input wand id_7,
    input tri0 id_8,
    input wand id_9,
    output wor id_10,
    input wor id_11,
    output wor id_12,
    output supply1 id_13,
    input supply1 id_14
);
  wire id_17;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri id_3,
    input supply1 id_4,
    output wire id_5,
    input wire id_6,
    input tri1 id_7,
    input uwire id_8,
    input uwire id_9
);
  assign id_5 = id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_9,
      id_5,
      id_5,
      id_1,
      id_2,
      id_1,
      id_5,
      id_3,
      id_5,
      id_5,
      id_9
  );
  or primCall (id_5, id_6, id_4, id_3, id_8, id_7, id_0, id_1);
endmodule
