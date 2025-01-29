// Seed: 3781415934
module module_0 (
    input  wor   id_0,
    input  uwire id_1,
    input  tri   id_2,
    output wire  id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  wire  id_6,
    input  wire  id_7,
    input  tri0  id_8,
    input  wand  id_9,
    input  uwire id_10,
    output uwire id_11,
    input  wor   id_12,
    output wire  id_13,
    id_17,
    input  wire  id_14,
    output wand  id_15
);
  assign id_13 = 1;
  wire id_18;
  assign module_1.id_5 = 0;
  assign id_13 = 1;
  assign id_3 = id_7;
  integer id_19, id_20;
  assign id_15 = id_14;
  initial assign id_15 = 1'b0;
endmodule
macromodule module_1 (
    input wire id_0,
    output wire id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    input wand id_5,
    output tri id_6,
    output supply1 id_7,
    input tri0 id_8,
    output uwire id_9,
    output supply1 id_10,
    output supply0 id_11,
    input wand id_12,
    output wire id_13,
    output tri id_14,
    output wire id_15,
    input wand id_16
);
  wire id_18, id_19, id_20;
  module_0 modCall_1 (
      id_5,
      id_16,
      id_5,
      id_13,
      id_4,
      id_5,
      id_3,
      id_12,
      id_16,
      id_16,
      id_12,
      id_11,
      id_3,
      id_11,
      id_16,
      id_13
  );
  assign id_1 = 1;
endmodule
