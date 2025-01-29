// Seed: 3254548208
module module_0 #(
    parameter id_2 = 32'd27
) (
    id_1
);
  inout wire id_1;
  defparam id_2 = 1;
  localparam id_3 = -1;
  assign module_1.id_1 = 0;
endmodule
program module_1;
  specify
    specparam id_1 = -1;
  endspecify
  module_0 modCall_1 (id_1);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  module_0 modCall_1 (id_3);
  wire id_9;
  assign id_6 = id_4;
  id_10(
      .id_0(id_3),
      .id_1(id_7),
      .id_2(id_5),
      .id_3(-1),
      .id_4(id_6),
      .id_5(1),
      .id_6(-1 - id_3),
      .id_7("" & 1),
      .id_8(""),
      .id_9(-1),
      .id_10(~1 == id_1)
  );
  localparam id_11 = 1;
  wire id_12;
  wire id_13;
endmodule
