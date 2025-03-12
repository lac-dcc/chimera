// Seed: 4286304491
module module_0 (
    input wor  id_0,
    input tri1 id_1,
    input tri  id_2
);
  wire  [  1  :  1  ]  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  tri1  id_3,
    output logic id_4
);
  initial begin : LABEL_0
    if (-1'b0) id_4 <= id_3;
    id_4 = -1;
  end
  id_6 :
  assert property (@(posedge -1) id_2)
  else if (1) begin : LABEL_1
    if (-1)
      if (1) id_4 <= -1'b0;
      else id_4 <= id_2;
  end
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
  assign id_0 = 1;
  wire id_8;
endmodule
