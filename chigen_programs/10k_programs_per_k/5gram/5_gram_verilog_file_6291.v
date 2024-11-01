// Seed: 2463460316
module module_0 (
    input wire id_0,
    input wire id_1,
    output wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wire id_6,
    output tri0 id_7,
    output wor id_8,
    output tri0 id_9,
    output supply1 id_10,
    input wor id_11,
    input supply1 id_12,
    output wand id_13,
    input wor id_14,
    output wor id_15,
    output uwire id_16,
    input wand id_17,
    input uwire id_18
);
  tri0 id_20;
  wire id_21;
  wire id_22;
  wire id_23;
  assign id_13 = id_4 == id_20;
  assign id_2  = id_17;
  assign id_2  = id_12;
endmodule
module module_1 (
    output wire  id_0,
    input  tri1  id_1,
    output tri   id_2,
    input  tri0  id_3,
    input  tri0  id_4
    , id_14, id_15,
    output tri   id_5,
    output wire  id_6,
    output wand  id_7,
    output tri   id_8,
    input  tri   id_9,
    input  wire  id_10,
    output uwire id_11,
    output wor   id_12
);
  assign id_2 = id_1;
  assign id_5 = id_14 ? 1'b0 : 1;
  module_0(
      id_4,
      id_3,
      id_11,
      id_4,
      id_9,
      id_2,
      id_4,
      id_5,
      id_11,
      id_12,
      id_0,
      id_10,
      id_10,
      id_12,
      id_4,
      id_11,
      id_0,
      id_3,
      id_4
  );
  generate
    assign id_0 = 1;
  endgenerate
endmodule
