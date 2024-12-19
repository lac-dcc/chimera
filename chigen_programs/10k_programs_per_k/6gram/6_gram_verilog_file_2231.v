// Seed: 2090071076
module module_0;
  id_1(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_2),
      .id_4(1),
      .id_5(1),
      .id_6(id_2 < id_2),
      .id_7(),
      .id_8(1 >= id_2),
      .id_9(1),
      .id_10(1),
      .id_11(1'b0),
      .id_12(""),
      .id_13(1),
      .id_14(id_2)
  );
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output tri   id_2,
    output logic id_3
);
  always @(posedge 1) begin : LABEL_0
    id_3 <= 1'b0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
