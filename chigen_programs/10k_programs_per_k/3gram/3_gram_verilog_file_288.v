// Seed: 3178583493
module module_0 (
    output wand  id_0,
    input  wand  id_1,
    output uwire id_2,
    input  tri   id_3,
    output tri0  id_4,
    input  uwire id_5
);
  assign id_2 = id_1;
  wire id_7;
  assign id_4 = id_3;
  assign id_2 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    output uwire id_1,
    input  tri   id_2
);
  assign id_1 = id_0 && 1 && id_2 && -1'h0;
  wire [1 : -1] id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_0
  );
endmodule
module module_2 #(
    parameter id_16 = 32'd4,
    parameter id_2  = 32'd28,
    parameter id_20 = 32'd27,
    parameter id_24 = 32'd50,
    parameter id_30 = 32'd48
) (
    input  uwire id_0,
    output uwire id_1,
    output wand  _id_2,
    input  wire  id_3,
    input  wand  id_4,
    output tri   id_5,
    input  uwire id_6,
    output uwire id_7,
    input  tri1  id_8,
    output wor   id_9,
    input  tri0  id_10
);
  wire  id_12  ,  id_13  ,  id_14  ,  id_15  ,  _id_16  ,  id_17  ,  id_18  ,  id_19  ,  _id_20  ,  id_21  ,  id_22  ,  id_23  ,  _id_24  ,  id_25  ,  id_26  ,  id_27  ;
  wire [id_20 : id_16] id_28;
  assign id_18 = id_20;
  wire [id_24 : ~  1] id_29, _id_30;
  logic [id_2 : 1] id_31 = -1 * 1, id_32, id_33;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_9,
      id_4,
      id_9,
      id_4
  );
  assign modCall_1.id_4 = 0;
  logic [1  +  -1 : id_30] id_34;
endmodule
