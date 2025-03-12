// Seed: 370216653
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input uwire id_5,
    input tri id_6,
    input wand id_7,
    input uwire id_8,
    output wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    output wor id_12,
    input wor id_13,
    output uwire id_14,
    input wand id_15,
    input tri0 id_16
);
  parameter id_18 = -1;
  wire  id_19;
  logic id_20;
  wire  id_21;
  assign id_10 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    output wand id_4,
    input wor id_5,
    input tri0 id_6,
    input wire id_7,
    input supply1 id_8
    , id_13,
    input wor id_9,
    output tri0 id_10,
    output wire id_11
);
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_5,
      id_9,
      id_3,
      id_10,
      id_2,
      id_4,
      id_1,
      id_11,
      id_2,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
