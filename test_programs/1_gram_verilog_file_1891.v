// Seed: 123902948
module module_0 (
    output tri1 id_0,
    output wor id_1,
    input supply0 id_2,
    output wand id_3,
    input tri0 id_4,
    output wand id_5,
    input wand id_6,
    input tri1 id_7,
    input supply0 id_8,
    output supply0 id_9,
    input wor id_10,
    output wire id_11,
    output tri1 id_12,
    input tri id_13,
    input supply1 id_14
);
  wire id_16, id_17;
  assign id_3 = 1;
  wire id_18, id_19;
  wire id_20 = id_8;
  assign id_11 = id_6.id_14;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output logic id_2,
    input  tri1  id_3,
    output logic id_4,
    input  logic id_5,
    output tri0  id_6,
    output logic id_7,
    input  logic id_8,
    output tri   id_9
);
  assign id_4 = id_8;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_3,
      id_9,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_9,
      id_3,
      id_9,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_14 = 0;
  always_comb if (1'b0) @(posedge id_5) @(1) @(posedge id_1) id_7 <= -1;
  logic id_11;
  logic id_12, id_13;
  assign id_7  = id_13;
  assign id_11 = id_8;
  assign id_2  = id_1;
  assign id_0  = id_5;
  always id_2 <= 1;
  wire id_14;
  wire id_15, id_16, id_17;
endmodule
