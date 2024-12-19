// Seed: 822891956
module module_0 (
    id_1
);
  input wire id_1;
  always_ff if (id_1) @(1 or 1);
  id_2(
      .id_0(1'b0 - id_1)
  );
  assign module_2.id_4 = 0;
  genvar id_3;
  wire id_4;
endmodule
macromodule module_1;
  wire id_1, id_2, id_3, id_4, id_5, id_6, id_7, id_8;
  module_0 modCall_1 (id_3);
endmodule
module module_2 #(
    parameter id_3 = 32'd68,
    parameter id_4 = 32'd29
);
  wire id_1;
  module_0 modCall_1 (id_1);
  always_latch id_1 = id_1;
  wire id_2;
  defparam id_3.id_4 = 1;
endmodule
