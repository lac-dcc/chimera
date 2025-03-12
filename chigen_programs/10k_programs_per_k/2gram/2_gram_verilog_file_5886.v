// Seed: 2688540070
module module_0 (
    input wand id_0,
    input wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    input wor id_6,
    output wire id_7,
    output tri0 id_8,
    output uwire id_9
);
  assign id_3 = id_6;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output uwire id_1,
    output logic id_2,
    input  wand  id_3,
    input  wire  id_4,
    output tri   id_5,
    input  uwire id_6,
    input  wand  id_7,
    input  tri0  id_8
);
  wire id_10;
  wire id_11 = id_7;
  bit [~  -1 'b0 : ~  -1] id_12;
  wor id_13;
  always_comb id_12 <= -1'b0;
  assign id_12 = (id_11);
  wire id_14;
  initial id_2 = 'h0;
  logic id_15;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_1,
      id_5,
      id_8,
      id_1,
      id_6,
      id_5,
      id_1,
      id_5
  );
  assign id_5  = id_3;
  assign id_13 = -1'b0;
endmodule
