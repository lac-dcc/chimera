// Seed: 1090001603
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_5(
      .id_0(1'b0),
      .id_1(id_6),
      .id_2(id_1),
      .id_3(!id_1),
      .id_4(id_2 ^ 1'b0),
      .id_5(1'b0),
      .id_6(id_3),
      .id_7(id_6),
      .id_8(id_6),
      .id_9(1)
  );
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd10,
    parameter id_8 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  defparam id_7.id_8 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_2
  );
endmodule
