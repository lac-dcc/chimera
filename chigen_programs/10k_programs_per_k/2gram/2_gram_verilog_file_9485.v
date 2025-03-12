// Seed: 2814964583
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri id_3
);
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd38
) (
    input  tri1 _id_0,
    output tri1 id_1,
    output tri0 id_2,
    input  tri  id_3,
    input  tri  id_4
);
  wire [id_0 : 1] id_6;
  localparam integer id_7 = 1;
  tri0 id_8;
  id_9(
      1, 1, 1'b0
  );
  wire id_10;
  assign id_1 = !id_4 != id_9;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
  assign id_10 = id_7;
  assign id_8 = -1;
endmodule
