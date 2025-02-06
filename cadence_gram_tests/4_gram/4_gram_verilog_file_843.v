// Seed: 3759439434
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_23(
      .id_0($realtime), .id_1($realtime), .id_2($realtime), .id_3()
  );
  wand id_24;
  wire id_25;
  wire id_26;
  wire id_27;
  assign id_13 = -1;
  assign id_22 = id_27;
  id_28(
      .id_0(1'h0),
      .id_1(id_23),
      .id_2($realtime),
      .id_3(id_8[1'b0]),
      .id_4(-1),
      .id_5(id_24 | id_15),
      .id_6($realtime),
      .id_7(id_7)
  ); id_29(
      .id_0(-1'b0), .id_1(-1), .id_2(id_23)
  );
  wire id_30;
  assign id_14 = -1'b0;
endmodule
module module_1 (
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
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_12(
      $realtime, 1
  );
  wire id_13;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_6,
      id_7,
      id_11,
      id_13,
      id_9,
      id_8,
      id_11,
      id_9,
      id_11,
      id_11,
      id_2,
      id_9,
      id_4,
      id_13,
      id_9,
      id_9,
      id_7,
      id_2,
      id_9,
      id_9
  );
  assign id_4 = $realtime;
  logic [7:0] id_14 = id_8;
  wire id_15;
  wire id_16;
  assign id_8[$realtime] = id_5[1];
  wire id_17;
endmodule
