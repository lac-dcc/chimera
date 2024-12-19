// Seed: 939048787
module module_0;
  initial begin : LABEL_0
    assume #1  (id_1) $display(1, 1);
  end
endmodule
module module_1;
  id_2(
      .id_0(id_3 <= id_1),
      .id_1(id_1),
      .id_2(1),
      .id_3(1'd0),
      .id_4(id_3),
      .id_5(id_3),
      .id_6(1 > !id_1)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge id_5) begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 ();
endmodule
