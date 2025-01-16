// Seed: 3301409709
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_9 = -1;
  always id_13 = id_10;
  wire id_18, id_19;
  wire id_20;
  parameter id_21 = id_15;
  parameter id_22 = 1;
endmodule
module module_1 #(
    parameter id_15 = 32'd36,
    parameter id_16 = 32'd60
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_12 :
  assert property (@(posedge -1) 1) id_1 = -1;
  wire id_13, id_14;
  defparam id_15 = 1, id_16 = 1; id_17(
      .id_0(1), .id_1(id_15), .id_2(id_1), .id_3(id_15), .id_4(id_2)
  );
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_5,
      id_4,
      id_5,
      id_8,
      id_13,
      id_2,
      id_14,
      id_9,
      id_2,
      id_11,
      id_13,
      id_15,
      id_13,
      id_2
  );
  wire id_18;
endmodule
