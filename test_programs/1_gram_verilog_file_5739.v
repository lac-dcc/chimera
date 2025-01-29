// Seed: 2681276556
module module_0 (
    output tri id_0,
    output supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    output tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    output tri0 id_7,
    id_16,
    output tri id_8,
    output wand id_9,
    output wire id_10,
    input uwire id_11,
    output supply1 id_12,
    output tri id_13,
    output supply1 id_14
);
  supply1 id_17 = -1;
  assign module_1.type_0 = 0;
  wor id_18;
  assign id_7 = -1'h0;
  wire id_19, id_20, id_21;
  always_ff id_16 = id_18 - (-1'd0);
  assign id_18 = id_16;
  wire id_22, id_23;
endmodule
module module_1 (
    output tri id_0,
    input wire id_1,
    output wire id_2,
    output wand id_3,
    output logic id_4,
    input tri0 id_5,
    input wor id_6,
    input wire id_7,
    output supply1 id_8,
    input supply1 id_9,
    input supply1 id_10
);
  assign id_4 = id_7 - id_1;
  initial id_4 <= 1;
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_8,
      id_1,
      id_10,
      id_8,
      id_3,
      id_8,
      id_3,
      id_9,
      id_0,
      id_3,
      id_8
  );
endmodule
