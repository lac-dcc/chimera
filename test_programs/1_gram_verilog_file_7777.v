// Seed: 3205301302
module module_0 (
    input wire id_0,
    output supply1 id_1,
    output supply1 id_2,
    output tri id_3,
    output tri id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output uwire id_8,
    input supply0 id_9,
    input supply0 id_10,
    input wor id_11,
    input wire id_12,
    input supply1 id_13,
    output wor id_14,
    output tri0 id_15,
    input uwire id_16,
    output wand id_17,
    input uwire id_18,
    input tri0 id_19,
    input supply1 id_20,
    input supply0 id_21,
    output supply1 id_22,
    input tri0 id_23,
    output wire id_24,
    output wire id_25,
    output wor id_26,
    input wand id_27,
    input supply0 id_28,
    input wand id_29,
    output tri id_30
);
  wire id_32;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output logic id_2,
    input supply0 id_3,
    output wor id_4,
    input logic id_5,
    input wire id_6,
    input supply1 id_7
);
  assign id_2 = id_5;
  wire id_9;
  initial
  fork
    id_2 <= 1;
  join
  always id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_6,
      id_1,
      id_4,
      id_0,
      id_1,
      id_0,
      id_7,
      id_1,
      id_4,
      id_4,
      id_7,
      id_4,
      id_1,
      id_6,
      id_7,
      id_1,
      id_4,
      id_7,
      id_4,
      id_4,
      id_4,
      id_6,
      id_3,
      id_0,
      id_4
  );
endmodule
