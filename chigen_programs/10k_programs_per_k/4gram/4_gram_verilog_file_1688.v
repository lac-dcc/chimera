// Seed: 1403819729
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wire id_3,
    input supply1 id_4,
    input wor id_5,
    output wor id_6,
    input supply1 id_7,
    output wor id_8
    , id_19,
    input tri id_9,
    input tri0 id_10,
    input uwire id_11,
    input wor id_12,
    input uwire id_13,
    input wire id_14,
    output tri id_15,
    output wand id_16,
    output tri0 id_17
);
  assign id_16 = 1 - id_10;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd2,
    parameter id_7 = 32'd4
) (
    output wire id_0,
    input  tri1 id_1
);
  logic [1 : ""] _id_3 = 1, id_4, id_5, id_6, _id_7;
  logic [-1 : id_3] id_8;
  parameter id_9 = 1;
  wire [id_7 : {  1  { "" }  }] id_10;
  wire id_11, id_12, id_13;
  wire id_14;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0
  );
  logic id_15, id_16;
endmodule
