// Seed: 4114755797
module module_0 (
    output tri0 id_0,
    input wor id_1
    , id_12,
    output supply1 id_2,
    output wor id_3,
    output supply1 id_4,
    output wand id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10
);
  wire id_13;
  wire id_14;
  assign id_13 = 1;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    input wire id_2,
    input wor id_3,
    output supply1 id_4,
    output tri0 id_5,
    input wor id_6
);
  assign id_1 = |1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_6,
      id_3,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.type_7 = 0;
  assign id_0 = id_3;
endmodule
