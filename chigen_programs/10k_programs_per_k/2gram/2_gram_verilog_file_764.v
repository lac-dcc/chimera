// Seed: 2341564315
module module_0 (
    output tri id_0,
    output wand id_1,
    input tri id_2,
    input tri id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    output supply1 id_7,
    output tri0 id_8,
    output tri0 id_9,
    input tri1 id_10,
    input wor id_11,
    input tri id_12
);
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wire id_0,
    input tri id_1,
    output wire id_2,
    input tri0 id_3,
    output supply0 id_4
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_0,
      id_4,
      id_1,
      id_1,
      id_3
  );
endmodule
