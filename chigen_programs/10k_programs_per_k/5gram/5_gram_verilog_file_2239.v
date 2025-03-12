// Seed: 1463967166
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    input wor id_5,
    input supply0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output supply0 id_9,
    output tri0 id_10
);
  wand id_12;
  assign id_9  = 1;
  assign id_12 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wor id_3,
    output supply0 id_4,
    input supply0 id_5,
    output wire id_6,
    output wor id_7,
    input tri1 id_8,
    input supply0 id_9
);
  logic id_11;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_9,
      id_9,
      id_1,
      id_8,
      id_6,
      id_3,
      id_6,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
