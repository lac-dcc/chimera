// Seed: 517554208
module module_0 (
    output uwire id_0,
    output wor   id_1,
    output tri1  id_2,
    output wor   id_3,
    input  wor   id_4
);
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd6
) (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input tri1 _id_6,
    input tri1 id_7,
    input wor id_8,
    input tri0 id_9
);
  if (1'b0) begin : LABEL_0
    logic id_11;
  end
  wire ['b0 : id_6] id_12;
  if (1) begin : LABEL_1
    id_13 :
    assert property (@(posedge id_12 or id_6 < id_6) id_7)
    else;
  end
  bit
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36;
  assign id_22 = -1;
  assign id_25 = 1;
  final begin : LABEL_2
    id_33 = id_2;
  end
  assign id_12 = id_0;
  assign id_25 = -1'b0;
  wire id_37;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_9
  );
endmodule
