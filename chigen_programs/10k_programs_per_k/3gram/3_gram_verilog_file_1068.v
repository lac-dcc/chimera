// Seed: 3514123814
module module_0 (
    output tri id_0,
    logic id_19,
    input wand id_1,
    input supply0 id_2,
    input wire id_3,
    output tri id_4,
    input wor id_5,
    input supply1 id_6,
    input wire id_7,
    input wor id_8,
    input tri1 id_9,
    output wor id_10,
    input supply0 id_11
    , id_20,
    input uwire id_12,
    input wand id_13,
    output wire id_14,
    output wand id_15,
    input wire id_16,
    input tri id_17
);
  assign id_19 = id_12;
  assign module_1.id_2 = 0;
  always_ff @(id_2 or posedge 1) id_19 = id_11;
  assign id_10 = id_13 - 1;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    output wire id_2,
    input wor id_3,
    output supply0 id_4,
    output wire id_5,
    output wor id_6,
    input wand id_7,
    output wor id_8,
    output wor id_9
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_5,
      id_0,
      id_7,
      id_1,
      id_1,
      id_1,
      id_8,
      id_3,
      id_3,
      id_1,
      id_9,
      id_4,
      id_3,
      id_3
  );
endmodule
