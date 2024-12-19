// Seed: 867234285
module module_0 ();
  id_2(
      .id_0(1),
      .id_1(id_1),
      .id_2(1'd0),
      .id_3(id_1 == id_1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(id_1),
      .id_8(1),
      .id_9(id_1),
      .id_10(id_3)
  ); id_4 :
  assert property (@(1 or posedge id_1) id_3 - id_4)
  else;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  always #(id_1) id_2 = 1;
  wire id_3;
  tri  id_4;
  assign id_4 = id_2;
  always begin : LABEL_0
    if (1) id_2 = 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
