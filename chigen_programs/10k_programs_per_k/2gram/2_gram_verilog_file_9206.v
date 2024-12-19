// Seed: 1778467032
module module_0 (
    output wand  id_0,
    input  wand  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  wor   id_5,
    input  wor   id_6,
    input  tri1  id_7,
    output tri   id_8,
    input  tri0  id_9
);
  wire id_11;
  wire  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output wire id_2
);
  uwire id_4 = 1;
  uwire id_5;
  always_ff begin : LABEL_0
    id_1 = id_4;
  end
  assign id_1 = 1;
  for (id_6 = 1'b0; {1, 1, id_5, 1'b0, id_0}; id_2 = id_6) begin : LABEL_0
    wire id_7;
    wire id_8;
  end
  wire id_9;
  assign id_5 = id_4 & id_6 & 1'b0;
  wand id_10;
  initial id_1 = 1 - 1 >= 1;
  module_0 modCall_1 (
      id_10,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_10,
      id_10,
      id_10,
      id_6
  );
  assign modCall_1.id_5 = 0;
  assign id_6 = id_10;
endmodule
