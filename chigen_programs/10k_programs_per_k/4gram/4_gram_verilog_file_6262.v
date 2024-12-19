// Seed: 361537766
module module_0 ();
  always @(negedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  assign module_2.id_0 = 0;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri id_0
);
  id_2(
      .id_0(1), .id_1({1, id_0}), .id_2(1), .id_3(1), .id_4(1 - 1), .id_5(id_0), .id_6(id_3)
  );
  module_0 modCall_1 ();
endmodule
module module_3;
  wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_1 = id_1;
endmodule
