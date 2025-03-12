// Seed: 2287037016
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    input supply1 id_3,
    input wor id_4
    , id_11,
    output tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input supply1 id_8,
    input supply1 id_9
);
  logic id_12;
  assign module_1.id_13 = 0;
  logic id_13;
  initial begin : LABEL_0
    id_11 <= "";
  end
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output wand id_2,
    output tri1 id_3,
    input wire id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    output wire id_12,
    output tri0 id_13
    , id_24,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input tri id_17,
    output tri id_18,
    input supply0 id_19,
    input uwire id_20,
    input uwire id_21,
    input uwire id_22
);
  always_ff assign id_13 = id_21;
  always_latch @(*) id_24 = -1;
  nand primCall (
      id_13, id_5, id_14, id_16, id_17, id_7, id_4, id_8, id_21, id_22, id_24, id_10, id_11, id_19
  );
  assign id_2 = id_16;
  module_0 modCall_1 (
      id_2,
      id_18,
      id_13,
      id_5,
      id_16,
      id_0,
      id_14,
      id_20,
      id_22,
      id_9
  );
endmodule
