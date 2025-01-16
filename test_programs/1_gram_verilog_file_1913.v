// Seed: 281439829
program module_0 ();
  parameter id_1 = 1'b0;
  assign id_2 = id_1;
  assign id_1 = id_2;
endmodule
module automatic module_1;
  id_1(
      .id_0(id_2),
      .id_1(1 ? -1 + id_2 : id_2),
      .id_2((1)),
      .id_3(1),
      .id_4(id_2),
      .id_5(id_2),
      .id_6(id_2),
      .id_7(1 - id_3),
      .id_8(1'b0),
      .id_9(-1'b0),
      .id_10(-1 & 1),
      .id_11(id_4),
      .id_12(""),
      .id_13(1)
  );
  reg id_5 = id_3 && -1;
  id_6 :
  assert property (@(posedge id_5) id_5) begin : LABEL_0
    if ((1)) id_5 <= -1;
    else return id_1;
    id_3 = 1'b0;
  end
  wire id_7, id_8, id_9, id_10, id_11;
  module_0 modCall_1 ();
endmodule
