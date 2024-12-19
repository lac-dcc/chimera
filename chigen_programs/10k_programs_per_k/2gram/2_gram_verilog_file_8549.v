// Seed: 1593863308
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output supply0 id_2,
    input wire id_3,
    input supply0 id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri1 id_7,
    input wor id_8,
    input uwire id_9,
    input wire id_10,
    output wire id_11,
    input supply0 id_12,
    input supply1 id_13,
    input tri0 id_14
);
  wor id_16 = id_12;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wor id_2,
    output tri1 id_3,
    input uwire id_4,
    input wand id_5,
    input tri1 id_6,
    input wor id_7,
    input supply0 id_8
);
  assign id_2 = id_6 < id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_0,
      id_8,
      id_5,
      id_5,
      id_0,
      id_1,
      id_7,
      id_4,
      id_8,
      id_0,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
