// Seed: 1027739758
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wire id_3,
    input wire id_4,
    output wand id_5,
    input tri0 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input tri id_10,
    output tri0 id_11
);
  wire id_13;
  assign id_11 = id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    input tri0 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.type_20 = 0;
endmodule
