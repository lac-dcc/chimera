// Seed: 2814726841
module module_0 (
    id_1#(
        .id_2({1 || 1}),
        .id_3(id_2),
        .id_4(id_2),
        .id_5(id_2)
    )
);
  inout wire id_1;
  assign id_4 = id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  reg id_10;
  bit id_11, id_12, id_13;
  module_0 modCall_1 (id_7);
  id_14 :
  assert property (@(posedge -1 or -1) id_7)
    if (1) begin : LABEL_0
      if (1'h0 === -1) begin : LABEL_0
        id_6 <= (id_13);
      end
    end else id_6 <= id_5;
  assign id_5 = id_10;
  wire id_15;
endmodule
