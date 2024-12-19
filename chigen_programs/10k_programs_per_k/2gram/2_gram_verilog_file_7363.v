// Seed: 397333558
module module_0 (
    input wand id_0,
    output uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    output uwire id_4,
    input wand id_5,
    input tri1 id_6,
    output tri1 id_7,
    output supply1 id_8,
    input uwire id_9,
    output tri id_10,
    input wand id_11,
    input supply1 id_12,
    output wand id_13
);
  wire id_15;
  assign id_1 = 1;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply1 id_4
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_3,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_4,
      id_0,
      id_1,
      id_3,
      id_0
  );
endmodule
