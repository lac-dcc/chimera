// Seed: 1478434870
module module_0 #(
    parameter id_15 = 32'd32
) (
    input  wire  id_0,
    input  tri   id_1,
    input  tri0  id_2,
    output uwire id_3,
    output tri0  id_4,
    input  wire  id_5,
    input  tri   id_6,
    input  tri0  id_7,
    input  wand  id_8,
    input  tri0  id_9,
    output tri1  id_10,
    input  wand  id_11,
    output tri0  id_12
);
  wire id_14;
  parameter id_15 = 1;
  assign id_10 = id_11;
  wire [1 : -1] id_16;
  assign id_4 = !id_11;
  defparam id_15.id_15 = -1 - 1;
  logic [-1 : 1 'b0] id_17;
  parameter id_18 = id_15;
  assign id_17 = id_0;
  parameter id_19 = id_18;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wire id_3,
    output wand id_4,
    output tri id_5,
    input uwire id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9
);
  assign id_4 = id_6;
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_1,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_1,
      id_1,
      id_4,
      id_7,
      id_3
  );
  assign modCall_1.id_15 = 0;
endmodule
