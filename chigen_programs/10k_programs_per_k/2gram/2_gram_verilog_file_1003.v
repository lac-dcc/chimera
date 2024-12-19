// Seed: 1020853132
module module_0;
  tri id_1;
  always begin : LABEL_0
    @(1'b0 ? id_1 : 1);
  end
  module_3 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1;
  tri0 id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  for (id_3 = id_3; id_1; id_1 = 1) begin : LABEL_0
    assign id_2 = id_1;
  end
endmodule
module module_2 (
    output wire id_0
);
  id_2(
      .id_0(), .id_1(1), .id_2(id_0)
  );
  wire id_3;
  module_0 modCall_1 ();
endmodule
module module_3 ();
  assign id_1 = 1;
endmodule
