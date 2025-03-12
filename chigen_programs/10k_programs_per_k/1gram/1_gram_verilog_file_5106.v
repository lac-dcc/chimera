// Seed: 897436517
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input wand id_2,
    output uwire id_3,
    input supply0 id_4,
    output tri0 id_5,
    input tri0 id_6
);
  wire id_8, id_9, id_10;
  logic id_11;
  wire [1 : (  -1  )] id_12;
  wire id_13;
  logic id_14;
  assign id_0 = -1'b0;
  always_comb @(posedge id_6) id_11 = -1;
  logic id_15;
  wire id_16, id_17, id_18, id_19;
  wire id_20, id_21;
endmodule
module module_1 #(
    parameter id_3 = 32'd98
) (
    input  tri   id_0,
    input  uwire id_1,
    output logic id_2
    , id_13,
    input  uwire _id_3,
    input  tri0  id_4,
    output wand  id_5,
    input  wor   id_6,
    output tri0  id_7,
    output tri   id_8,
    input  tri0  id_9,
    output tri0  id_10,
    input  uwire id_11
);
  always id_2 = id_1;
  wire [-1 'b0 : id_3] id_14;
  reg id_15;
  always_comb id_13 <= ~id_1 == -1;
  assign id_15 = id_3;
  assign id_8  = -1'b0;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_7,
      id_9,
      id_8,
      id_6
  );
  assign modCall_1.id_5 = 0;
  wire id_16;
  always id_15 <= $realtime;
endmodule
