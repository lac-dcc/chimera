// Seed: 1690581367
module module_0;
  supply0 id_1;
  wor id_2 = id_1 - 1;
  supply1 id_3 = 1'h0;
  uwire id_4 = id_2;
  wire id_5;
endmodule
module module_1 #(
    parameter id_7 = 32'd15,
    parameter id_8 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  defparam id_7.id_8 = id_1 ^ 1'b0;
  module_0 modCall_1 ();
endmodule
module module_2 (
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always id_6 = #id_10 1'b0;
  module_0 modCall_1 ();
  id_11(
      .id_0(id_5),
      .id_1(1),
      .id_2(id_3),
      .id_3(1'h0 == 1),
      .id_4(1 && id_8 === 1),
      .id_5(id_1),
      .id_6(id_4),
      .id_7(id_5),
      .id_8(1),
      .id_9(id_6),
      .id_10(1),
      .id_11(1),
      .id_12((1)),
      .id_13(1 != 1),
      .id_14(1'b0),
      .id_15(1 == id_9),
      .id_16(1 == id_4),
      .id_17(id_7),
      .id_18(id_6 == id_4)
  );
endmodule
