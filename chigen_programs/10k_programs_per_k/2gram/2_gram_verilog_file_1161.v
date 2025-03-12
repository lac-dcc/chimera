// Seed: 2375297223
module module_0 (
    output wand id_0,
    input wor id_1
    , id_21,
    input wire id_2,
    input wire id_3,
    output wor id_4,
    output wire id_5
    , id_22,
    output tri0 id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wor id_9,
    input tri1 id_10,
    output wor id_11,
    output supply1 id_12,
    input tri0 id_13,
    input tri0 id_14,
    input wor id_15,
    input wire id_16,
    input wand id_17,
    input uwire id_18,
    input tri1 id_19
);
  wire id_23;
  assign id_5 = 1;
  assign id_6 = id_15;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2
);
  bit id_4;
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
  always_latch #(1'h0) id_4 = new(1, id_4);
  wire id_5;
endmodule
