// Seed: 2392476392
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wor id_3,
    input uwire id_4,
    inout wand id_5,
    input supply0 id_6,
    input uwire id_7,
    input wand id_8,
    input supply0 id_9,
    output tri1 id_10,
    output wor id_11,
    input wire id_12,
    input wire id_13
);
  logic [-1 : 1] id_15;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd60
) (
    input tri _id_0,
    inout uwire id_1,
    input uwire id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri id_5,
    output wire id_6,
    input wor id_7,
    input uwire id_8,
    input uwire id_9,
    input wand id_10,
    input wor id_11,
    output tri id_12,
    input tri id_13,
    output wor id_14
);
  parameter id_16 = 1'h0;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5,
      id_10,
      id_1,
      id_8,
      id_4,
      id_1,
      id_8,
      id_3,
      id_6,
      id_9,
      id_11
  );
  tri [1 : (  -1  ||  id_0  )] id_18;
  assign #1 id_18 = 1;
  wire id_19, id_20 = id_4;
endmodule
