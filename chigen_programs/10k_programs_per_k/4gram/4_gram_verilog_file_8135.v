// Seed: 2724952162
module module_0 (
    input wand id_0,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    input wor module_0,
    input wire id_7,
    input tri0 id_8
);
  wire id_10;
  ;
  wire id_11;
endmodule
module module_1 #(
    parameter id_10 = 32'd37,
    parameter id_12 = 32'd28,
    parameter id_5  = 32'd75,
    parameter id_6  = 32'd7,
    parameter id_7  = 32'd74
) (
    input wand id_0,
    input uwire id_1,
    input wand id_2,
    input uwire id_3,
    input tri id_4,
    input tri1 _id_5,
    input wand _id_6,
    input supply1 _id_7,
    output tri0 id_8
);
  parameter id_10 = -1'b0;
  wire [id_5 : id_10  <  id_7] id_11;
  parameter id_12 = id_10;
  wire id_13;
  ;
  nand primCall (id_8, id_1, id_13, id_3, id_12, id_16, id_4, id_0);
  wire [1 : -1] id_14;
  assign id_8 = -1 && id_5;
  logic [id_12 : id_6] id_15 = -1, id_16 = -1 & -1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_8,
      id_3,
      id_4,
      id_8,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
