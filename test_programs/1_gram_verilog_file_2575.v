// Seed: 301021740
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output supply0 id_9,
    input wire id_10,
    output tri0 id_11
);
  assign id_8 = 1 + id_5;
  always_latch id_1 = id_5;
  wire id_13;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    output uwire id_2,
    output uwire id_3,
    input wire id_4,
    output supply0 id_5,
    id_9,
    input wire id_6,
    input uwire id_7
);
  wire id_10;
  assign id_9 = id_7;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_9,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_1,
      id_7,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
