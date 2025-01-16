// Seed: 3291519104
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    output uwire id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wire id_8,
    input tri id_9,
    input supply1 id_10
);
  wire id_12;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6
);
  assign id_6 = id_1 - id_2;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3
  );
endmodule
