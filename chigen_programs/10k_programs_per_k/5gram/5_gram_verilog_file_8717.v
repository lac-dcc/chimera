// Seed: 925618691
module module_0 (
    output wand id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    output tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wire id_8,
    input tri0 id_9,
    input tri1 id_10,
    output tri0 id_11,
    input wor id_12
);
  wire id_14;
  wire id_15;
  supply0 id_16 = id_5;
  wire id_17;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    input tri0 id_5
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_0,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_5,
      id_5,
      id_0,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
