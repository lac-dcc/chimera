// Seed: 98492563
module module_0 (
    output wor id_0,
    input wire id_1,
    output tri1 id_2,
    input supply1 id_3,
    output wor id_4,
    input wire id_5,
    input wor id_6,
    input uwire id_7
    , id_17,
    input tri id_8,
    input tri id_9,
    output supply1 id_10,
    input supply1 id_11,
    input supply1 id_12,
    output tri0 id_13,
    input wand id_14,
    input wire id_15
);
  wire id_18;
  wire id_19;
  assign id_2 = -1;
  parameter id_20 = -1;
  assign id_17 = 1 - id_15;
  wire id_21;
  ;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    output logic id_3,
    output wand  id_4
);
  always_latch @(posedge 1 or negedge id_0) id_3 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_4,
      id_1,
      id_0,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
  parameter id_6 = 1;
  wire id_7;
endmodule
