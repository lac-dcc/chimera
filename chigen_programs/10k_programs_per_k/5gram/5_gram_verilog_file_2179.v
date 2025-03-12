// Seed: 1977789128
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 sample,
    output uwire id_6,
    input supply1 id_7,
    input tri id_8,
    input tri0 id_9,
    output tri0 id_10,
    output wand id_11,
    input wire id_12,
    input supply1 id_13,
    output wand id_14,
    input uwire id_15
);
  assign id_6 = id_7;
  reg  id_17;
  wire module_0;
  always @(1'b0 == id_8, id_5 or posedge id_13) id_17 = id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd79
) (
    output wire id_0,
    input  tri0 id_1,
    input  tri1 id_2,
    input  tri1 id_3,
    input  tri1 _id_4,
    input  wand id_5
);
  wire id_7[];
  wire [-1  <  id_4 : 1] id_8;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_2,
      id_3,
      id_3,
      id_0,
      id_1,
      id_2,
      id_5,
      id_0,
      id_0,
      id_5,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_17 = 0;
endmodule
