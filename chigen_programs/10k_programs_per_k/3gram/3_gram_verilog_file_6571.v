// Seed: 3632708696
module module_0 #(
    parameter id_3 = 32'd42,
    parameter id_6 = 32'd92
) (
    output tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    output uwire _id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 _id_6,
    output tri1 id_7,
    output tri1 id_8,
    input wor id_9
);
  wire id_11;
  assign module_1.id_8 = 0;
  logic [id_6 : id_3] id_12;
  logic [  -1 : id_6] id_13;
endmodule
module module_1 #(
    parameter id_7 = 32'd8
) (
    output supply1 id_0,
    output wand id_1
    , id_11,
    output tri id_2,
    input tri0 id_3,
    input wire id_4,
    input uwire id_5,
    input tri id_6,
    input tri _id_7,
    output uwire id_8,
    output supply1 id_9
);
  supply1 id_12 = {1, id_4};
  tri1 [-1 : ~  id_7] id_13 = -1;
  localparam id_14 = -1, id_15 = id_12, id_16 = id_1++;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_3,
      id_15,
      id_3,
      id_3,
      id_16,
      id_8,
      id_1,
      id_4
  );
endmodule
