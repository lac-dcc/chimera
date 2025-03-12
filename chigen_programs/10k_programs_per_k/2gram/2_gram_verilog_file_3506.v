// Seed: 2501288630
module module_0 (
    input  wor   id_0,
    output tri   id_1,
    input  uwire id_2,
    input  wor   id_3,
    output uwire id_4,
    input  wire  id_5
    , id_12,
    output tri   id_6,
    input  tri   id_7,
    input  tri0  id_8,
    input  wor   id_9,
    input  tri1  id_10
);
  id_13 :
  assert property (@(-1) id_9)
  else;
endmodule
module module_1 #(
    parameter id_11 = 32'd94
) (
    input  uwire id_0,
    input  uwire id_1,
    output logic id_2,
    input  tri   id_3,
    input  wand  id_4,
    output wire  id_5,
    input  tri1  id_6,
    input  wor   id_7,
    input  tri0  id_8,
    input  uwire id_9,
    output logic id_10,
    input  uwire _id_11,
    input  wire  id_12,
    input  wand  id_13
);
  initial begin : LABEL_0
    id_10 <= (-1);
    if (1)
      if (1) id_2 <= 1;
      else id_2 += id_7;
    id_2 <= -1'h0;
  end
  wire  [  id_11  :  -1  ]  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ;
  logic id_30[-1 : id_11];
  ;
  assign id_2 = 1;
  wire id_31;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_12,
      id_5,
      id_7,
      id_5,
      id_4,
      id_12,
      id_6,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
