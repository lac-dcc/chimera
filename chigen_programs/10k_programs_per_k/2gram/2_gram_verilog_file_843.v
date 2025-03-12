// Seed: 3597142410
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wire id_2,
    input wire id_3,
    input tri0 id_4,
    output tri1 id_5,
    input tri id_6,
    output tri id_7,
    output tri1 id_8,
    input wand id_9,
    input tri id_10,
    output wand id_11,
    input supply0 id_12,
    input uwire id_13,
    output supply0 id_14,
    input tri1 id_15,
    input uwire id_16
);
  logic id_18;
  ;
  assign id_14 = -1;
  always_comb id_18 = id_15;
  wire id_19;
  ;
  parameter id_20 = 1 || 1 || -1;
  parameter id_21 = id_20;
  assign id_19 = id_13;
  assign module_1.id_1 = 0;
  wire id_22 = id_21, id_23;
  int  id_24;
  id_25(
      -1, id_9
  );
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input wire id_2,
    input wire id_3,
    input supply1 id_4,
    output supply1 id_5,
    output uwire id_6,
    input tri1 id_7
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_1,
      id_3,
      id_6,
      id_1,
      id_6,
      id_6,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_0,
      id_2,
      id_3
  );
endmodule
