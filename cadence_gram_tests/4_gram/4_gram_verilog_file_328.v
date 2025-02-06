// Seed: 1198975850
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
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_11(
      id_6, id_7, $realtime
  );
  wire id_12;
  assign id_10 = -1;
  wire id_13;
endmodule
module module_1 #(
    parameter id_21 = 32'd29,
    parameter id_22 = 32'd82
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_10,
      id_18,
      id_10,
      id_6,
      id_4,
      id_12,
      id_19,
      id_8
  );
  id_20(
      .id_0($realtime), .id_1(id_7), .id_2(id_9[1'b0] == -1)
  ); defparam id_21.id_22 = $realtime;
endmodule
