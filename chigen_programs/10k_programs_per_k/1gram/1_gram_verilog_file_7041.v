// Seed: 3300998681
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    output wor id_4,
    input tri1 id_5,
    input tri id_6,
    input wand id_7,
    input supply1 id_8,
    input supply0 id_9,
    output wor id_10,
    inout wire id_11,
    output wand id_12,
    input tri id_13,
    input uwire id_14,
    input uwire id_15,
    input wor id_16,
    output wand id_17
);
  wire id_19;
  always_latch id_4 = 1;
  always_comb id_10 = 1;
  supply1 id_20 = 1 ? id_8 : 1;
  wire id_21;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    input  wand id_3,
    output tri1 id_4,
    input  tri0 id_5,
    input  wor  id_6,
    input  wor  id_7,
    input  tri  id_8
    , id_11,
    output tri0 id_9
);
  assign id_11 = id_6;
  wire id_12;
  tri id_13, id_14, id_15, id_16;
  supply1 id_17;
  assign id_14 = id_17;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_5,
      id_16,
      id_5,
      id_8,
      id_13,
      id_17,
      id_7,
      id_9,
      id_15,
      id_11,
      id_0,
      id_1,
      id_13,
      id_2,
      id_9
  );
  wire id_18;
  always @(negedge 1) @(posedge 1) id_15 = id_2;
endmodule
