// Seed: 4256323507
module module_0 (
    input supply0 id_0,
    output tri id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri id_8,
    output wor id_9,
    output uwire id_10,
    output wor id_11,
    output uwire id_12
);
  always @(id_6 or 1) id_8 = 1;
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2,
    input tri1 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    output wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_4,
      id_5,
      id_1,
      id_7,
      id_2,
      id_4,
      id_7,
      id_7
  );
  initial assume (1);
endmodule
