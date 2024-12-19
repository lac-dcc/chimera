// Seed: 3761864968
module module_0 #(
    parameter id_5 = 32'd76,
    parameter id_6 = 32'd98
) (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  static id_3(
      .id_0(""), .id_1(1'b0), .id_2(1), .id_3(1), .id_4(1), .id_5(1), .id_6(id_2 == id_1)
  );
  wire id_4;
  defparam id_5.id_6 = 1'd0; id_7(
      .id_0(1), .id_1(1'h0), .id_2(id_5), .id_3(id_3), .id_4(1'b0), .id_5(1), .id_6(id_3), .id_7(1)
  );
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1 == id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_3;
  wire id_4;
  wire id_5;
endmodule
