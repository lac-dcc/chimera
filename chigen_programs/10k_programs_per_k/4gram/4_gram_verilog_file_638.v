// Seed: 792849647
module module_0 (
    input wire id_0,
    input wire id_1,
    input wire id_2,
    input supply0 id_3,
    output uwire id_4,
    input tri0 id_5,
    output tri id_6,
    output supply1 id_7,
    input tri1 id_8,
    input wand id_9,
    input wire id_10,
    output uwire id_11,
    input tri0 id_12,
    output uwire id_13,
    output wor id_14
);
  wire [-1 : 1] id_16;
  supply0 id_17;
  assign id_13 = (-1);
  wire id_18;
  assign id_17 = -1 == id_5;
endmodule
module module_1 #(
    parameter id_7 = 32'd32
) (
    input uwire id_0,
    input supply1 id_1,
    input wand id_2,
    input uwire id_3,
    input wire id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 _id_7,
    output tri1 id_8,
    output wor id_9
);
  parameter id_11 = 1;
  logic [7:0][-1 : id_7] id_12;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_9,
      id_1,
      id_8,
      id_8,
      id_2,
      id_5,
      id_2,
      id_8,
      id_5,
      id_9,
      id_8
  );
  assign modCall_1.id_11 = 0;
  assign id_12[1] = 1 ? -1 : 1;
  logic id_13 = -1;
  logic [1 : 1 'd0] id_14;
endmodule
