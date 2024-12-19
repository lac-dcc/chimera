// Seed: 3119279990
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11;
  id_12(
      .id_0(1'd0),
      .id_1(1),
      .id_2(id_7[1] - 1),
      .id_3(id_1),
      .id_4(id_13),
      .id_5(id_6),
      .id_6(),
      .id_7(id_1),
      .id_8(1),
      .id_9(),
      .id_10(1'd0)
  );
  wire id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_15 = 32'd72,
    parameter id_16 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  defparam id_15.id_16 = 1 - id_2[1-1];
  wire id_17;
  always force id_11 = 1;
  wire  id_18;
  uwire id_19 = 1;
  wire  id_20;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20,
      id_14,
      id_6,
      id_6,
      id_2,
      id_12,
      id_20,
      id_9
  );
endmodule
