// Seed: 2289005682
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2
    , id_16,
    output tri id_3,
    input wand id_4,
    input wand id_5,
    input wor id_6,
    output supply1 id_7,
    input tri1 id_8,
    output supply1 id_9,
    output supply1 id_10,
    output wire id_11,
    input wand id_12,
    input supply1 id_13,
    input tri id_14
);
  assign id_10 = id_12 - id_1;
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    input tri0 id_2,
    output supply0 id_3,
    input uwire id_4,
    input wire id_5,
    input wire id_6,
    output supply0 id_7,
    output wor id_8,
    input wire id_9,
    output supply0 id_10,
    input tri1 id_11,
    input uwire id_12,
    output tri1 id_13,
    input wire id_14,
    input tri0 id_15,
    output uwire id_16,
    input tri id_17,
    input supply1 id_18,
    input tri0 id_19,
    output wor id_20,
    input supply0 id_21
);
  always_latch @(posedge -1) id_0 <= 1;
  always_ff @(id_21 or negedge ~1);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_8,
      id_9,
      id_19,
      id_4,
      id_3,
      id_17,
      id_13,
      id_16,
      id_8,
      id_21,
      id_5,
      id_4
  );
  assign modCall_1.id_11 = 0;
endmodule
