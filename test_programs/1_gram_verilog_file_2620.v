// Seed: 275914419
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output uwire id_2,
    input wand id_3,
    input wand id_4,
    input tri id_5,
    input tri1 id_6,
    input supply0 id_7,
    input tri id_8,
    input wor id_9,
    output wor id_10,
    output supply0 id_11,
    output tri1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    input wire id_15
);
  wire id_17;
  always_latch id_11 = -1;
  wire id_18, id_19;
  assign id_1 = ~-1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wand  id_1,
    input  wor   id_2,
    input  uwire id_3
);
  wire id_5;
  wire id_6;
  always_latch id_5 = id_3 < -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2
  );
  assign id_0 = 1;
  wire id_7 = id_3;
endmodule
