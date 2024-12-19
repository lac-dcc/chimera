// Seed: 2644893883
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_2) begin : LABEL_0
    id_2 = 1'd0;
    #1;
    if (1 == id_3)
      if (1) begin : LABEL_0
        id_4 <= 1;
      end else id_4 <= id_3 == 1;
    else id_1 <= id_4;
  end
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ;
  assign module_1.id_4 = 0;
  wire id_31;
  wire id_32;
endmodule
module module_1;
  tri id_1;
  id_3(
      .id_0(id_4), .id_1(id_2), .id_2(1'h0), .id_3(1 == 1), .id_4(id_1)
  );
  always @(posedge 1 or id_1) begin : LABEL_0
    id_4 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4
  );
endmodule
