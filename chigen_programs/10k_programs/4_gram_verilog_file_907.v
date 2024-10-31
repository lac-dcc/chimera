// Seed: 7677310
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_11 = 32'd24,
    parameter id_12 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  module_0(
      id_2, id_1, id_10, id_10
  ); defparam id_11.id_12 = id_12; id_13(
      .id_0(id_4),
      .id_1(1),
      .id_2(id_12),
      .id_3(~id_4[1 : 1]),
      .id_4(1),
      .id_5((id_9)),
      .id_6(id_1),
      .id_7((id_9)),
      .id_8(id_1 - 1)
  );
  wire id_14;
endmodule
