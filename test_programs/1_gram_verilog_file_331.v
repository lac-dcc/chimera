// Seed: 927269968
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wire id_5
);
  wire id_7, id_8;
  wire id_9;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    input tri1 id_2,
    id_13,
    input logic id_3,
    input wand id_4,
    output supply1 id_5,
    output wire id_6,
    input tri0 id_7,
    output tri1 id_8,
    input tri0 id_9,
    input wor id_10,
    output logic id_11
);
  logic id_14, id_15;
  id_16 :
  assert property (@(-1 || 1) id_15) id_13 <= -1;
  assign id_11 = id_15;
  always_comb id_15 <= -1;
  assign id_11 = id_0;
  wire id_17;
  assign id_16 = id_3;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_2,
      id_1,
      id_1,
      id_4
  );
  assign id_11 = id_13;
endmodule
