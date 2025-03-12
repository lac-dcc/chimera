// Seed: 974238060
module module_0;
  bit id_1, id_2;
  always @(posedge 1'b0 - id_1 or posedge id_2) begin : LABEL_0
    id_2 <= 1'b0;
    id_2 <= !id_1 == id_2;
    id_1 <= -1;
  end
endmodule
module module_1 (
    id_1
);
  inout reg id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial id_1 = #1 id_1;
endmodule
module module_2 #(
    parameter id_1 = 32'd96
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  wire id_4;
  wire id_5;
  logic [-1 : 1] id_6;
  module_0 modCall_1 ();
  wire  [  -1 'd0 :  !  id_1  ]  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ;
  always @(posedge |id_2 or posedge id_20) begin : LABEL_0
    $unsigned(90);
    ;
  end
endmodule
