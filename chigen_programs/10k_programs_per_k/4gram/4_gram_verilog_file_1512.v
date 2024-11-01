// Seed: 894595526
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input supply0 id_4
    , id_22,
    input wand id_5,
    input uwire id_6,
    output tri1 id_7,
    output tri1 id_8,
    input wire id_9,
    inout uwire id_10,
    output wor id_11
    , id_23,
    input wire id_12,
    input wand id_13,
    input uwire id_14,
    input wire id_15
    , id_24, id_25,
    input supply0 id_16,
    output wire id_17,
    input supply1 id_18,
    input tri id_19,
    output supply0 id_20
);
  always disable id_26;
endmodule
module module_1 (
    output uwire id_0,
    output tri   id_1
);
  wand id_4;
  wire id_5;
  tri0 id_6;
  assign id_3 = 1;
  wor id_7 = 1;
  module_0(
      id_4,
      id_6,
      id_6,
      id_0,
      id_6,
      id_4,
      id_6,
      id_1,
      id_0,
      id_6,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1
  ); id_8 :
  assert property (@(posedge id_4) id_6)
  else $display;
  wire id_9;
  assign id_0 = 1 ? 1 : id_4;
  uwire id_10 = id_4;
  wire  id_11;
  wire  id_12;
  wire  id_13;
  wire  id_14 = id_9#(.id_11(1)), id_15;
  assign id_0 = 1;
endmodule
