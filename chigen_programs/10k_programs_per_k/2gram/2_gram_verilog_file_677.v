// Seed: 601095587
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2
);
  reg  id_4;
  wire id_5;
  assign id_4 = 1;
  assign id_4 = id_4;
  assign id_4 = id_4;
  reg id_6;
  logic [7:0] id_7;
  uwire id_8;
  if (1) begin : LABEL_0
    wire id_9;
    id_10(
        .id_0(id_5)
    );
    uwire  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  =  1  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
  end else begin : LABEL_0
    always id_4 <= 1'd0;
    wire id_29;
    id_30(
        .id_0(1 * id_8),
        .id_1(id_2),
        .id_2(1'b0),
        .id_3(id_29),
        .id_4(1),
        .id_5(id_8),
        .id_6(1),
        .id_7(id_0)
    );
    wire id_31;
    wire id_32;
  end
  assign id_8 = id_7[1'b0];
  assign id_4 = id_6;
  assign id_0 = 1;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1,
    input  wor  id_2
);
  tri0 id_4 = 1;
  always @((1'b0 && id_0)) id_4 = id_0(id_4);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.id_16 = 0;
endmodule
