// Seed: 1013860737
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input tri0 id_2,
    input supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    input wor id_6,
    output wire id_7,
    input wire id_8,
    input wire id_9,
    input tri0 void id_10,
    input supply0 id_11,
    input tri1 id_12,
    output wand id_13
);
  wire id_15;
  assign id_1 = 1;
  assign module_1.id_5 = 0;
  wire id_16;
  assign id_1 = id_11;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3
);
  wand id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_5,
      id_5,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_0
  );
  final id_5 = id_3;
endmodule
