// Seed: 2396178290
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output tri0 id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    input tri id_6,
    output tri0 id_7,
    input tri id_8,
    input uwire id_9,
    output wand id_10,
    output wand id_11,
    output supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    input wand id_16
);
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd72,
    parameter id_1 = 32'd46
) (
    input tri0 _id_0,
    input uwire _id_1,
    input wire id_2,
    output tri id_3,
    input supply1 id_4
);
  assign id_3 = 1'b0;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_4,
      id_2,
      id_3,
      id_3,
      id_3,
      id_4,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_8 = 0;
  assign id_6 = id_0;
  wire id_7;
  wire [id_0 : -1] id_8;
  wire [1 : 1] id_9;
  assign id_6[id_1] = id_0;
  logic id_10;
  wire  id_11;
endmodule
