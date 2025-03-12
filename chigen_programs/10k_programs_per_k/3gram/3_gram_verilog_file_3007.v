// Seed: 1789006816
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wire id_2,
    input tri id_3,
    output supply1 id_4,
    output tri0 id_5,
    output tri id_6,
    input tri id_7
    , id_19,
    input supply1 id_8,
    output wand id_9,
    input uwire id_10,
    output wand id_11,
    output wand id_12
    , id_20,
    output uwire id_13,
    output wand id_14,
    input wire id_15,
    output wor id_16,
    output uwire id_17
);
  assign id_20 = 1;
  assign module_1.id_1 = 0;
  localparam id_21 = -1'b0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    output supply0 id_4,
    output logic id_5,
    input tri0 id_6,
    input wor id_7
);
  assign id_4 = id_1 + id_3;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_6,
      id_0,
      id_4,
      id_4,
      id_4,
      id_6,
      id_3,
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4
  );
  always_comb id_5 = #id_9 id_3;
endmodule
