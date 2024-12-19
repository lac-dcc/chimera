// Seed: 307993642
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wand id_3,
    input uwire id_4,
    input wire id_5,
    input tri id_6,
    input wor id_7,
    input wor id_8,
    input wand id_9,
    output tri0 id_10,
    input wire id_11,
    output wor id_12,
    input wor id_13
    , id_22,
    input supply0 id_14,
    output wor id_15,
    input wor id_16,
    output tri1 id_17,
    output supply0 id_18,
    output tri0 id_19,
    input tri0 id_20
);
  wire id_23;
  assign id_19 = 1'h0;
  wire id_24;
  always_latch @(1) cover (id_13);
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    input tri1 id_2,
    output tri0 id_3,
    output supply1 id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_4,
      id_1,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1,
      id_3,
      id_3,
      id_4,
      id_1
  );
endmodule
