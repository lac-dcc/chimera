// Seed: 925323194
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input uwire id_3,
    output uwire id_4,
    output uwire id_5,
    output wire id_6,
    output tri0 id_7,
    input tri0 id_8,
    input uwire id_9,
    output wor id_10,
    input wor id_11,
    input tri1 id_12,
    output tri1 id_13,
    output wand id_14
);
  always @(~id_8 == id_9) release id_5;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input wand id_2,
    input wor id_3,
    output supply0 id_4
);
  assign id_4 = id_1 ? id_2 - 1 | id_3 : 1 == 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_2,
      id_4,
      id_1,
      id_3,
      id_4,
      id_4
  );
endmodule
