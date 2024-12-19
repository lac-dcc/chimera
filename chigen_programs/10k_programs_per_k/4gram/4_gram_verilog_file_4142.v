// Seed: 4272340029
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input wire id_3
    , id_22,
    input wire id_4,
    input wire id_5,
    output wire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input wor id_9,
    output supply1 id_10,
    output wand id_11,
    input wor id_12,
    output wor id_13,
    output uwire id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wor id_17,
    output supply0 id_18,
    input tri1 id_19,
    input wand id_20
);
  byte id_23;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output wor id_2,
    output logic id_3,
    input tri0 id_4,
    input wire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri id_9,
    input supply1 id_10
);
  wire id_12;
  assign id_0 = id_1;
  wor id_13;
  assign id_0 = id_7 - id_13;
  always @(posedge 1'b0) id_3 = #id_14 1 * id_8 + id_13('b0, id_14 - id_8, ~id_13);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_9,
      id_5,
      id_9,
      id_6,
      id_6,
      id_4,
      id_10,
      id_0,
      id_2,
      id_4,
      id_6,
      id_0,
      id_4,
      id_8,
      id_0,
      id_0,
      id_1,
      id_7
  );
endmodule
