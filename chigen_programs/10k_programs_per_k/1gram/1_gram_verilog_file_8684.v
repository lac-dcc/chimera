// Seed: 3890041299
module module_0 (
    input uwire id_0,
    input tri   id_1
);
  parameter id_3 = 1;
  wire id_4;
  wire id_5, id_6;
  assign id_6 = id_1;
  assign id_6 = id_0;
  assign id_5 = id_5;
  wire [1 'b0 : 1] id_7;
endmodule
module module_1 #(
    parameter id_1 = 32'd27,
    parameter id_4 = 32'd90,
    parameter id_8 = 32'd59
) (
    input uwire id_0,
    input uwire _id_1,
    input wor id_2,
    input tri id_3,
    input wand _id_4[id_8 : id_1],
    input wire id_5,
    output wor id_6,
    output supply0 id_7,
    input supply1 _id_8
);
  logic [7:0] id_10;
  logic id_11;
  nor primCall (id_6, id_11, id_3, id_2, id_10);
  assign id_11[1][id_4] = id_10[1?$realtime : 1'h0] - id_3;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_12, id_13, id_14, id_15;
endmodule
