// Seed: 505292748
module module_0;
  always #1
    if (1) begin : LABEL_0
      id_1 <= 1;
    end else begin : LABEL_0
      id_2[1-:1] = 1'd0;
    end
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  uwire id_3;
  module_0 modCall_1 ();
  id_4(
      .id_0((id_3)),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(id_1[1] - 1),
      .id_5((1)),
      .id_6((id_2)),
      .id_7(id_1),
      .id_8(1),
      .id_9(id_3 - id_2),
      .id_10(~1'b0)
  );
endmodule
