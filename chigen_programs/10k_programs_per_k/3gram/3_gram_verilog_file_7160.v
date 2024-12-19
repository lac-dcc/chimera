// Seed: 4025792759
module module_0 ();
  assign id_1 = 1'b0;
  assign module_1.id_3 = 0;
  id_2(
      .id_0(id_1),
      .id_1(id_1),
      .id_2(1'b0),
      .id_3(id_1),
      .id_4(1),
      .id_5(""),
      .id_6({1'd0, id_1}),
      .id_7((1 >> 1)),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(id_1),
      .id_12(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_4;
  assign id_4 = 1'b0;
  wire id_5;
  always @(posedge id_3 or posedge 1) begin : LABEL_0
    if (1) id_4 <= 1'b0;
    else id_3 <= 1'b0;
  end
  module_0 modCall_1 ();
endmodule
