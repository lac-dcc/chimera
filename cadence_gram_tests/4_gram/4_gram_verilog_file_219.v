// Seed: 1569134385
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
    id_22,
    id_23
);
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_24;
  id_25(
      .id_0($realtime), .id_1(id_24)
  );
  assign id_3 = -1;
  wire id_26;
  wire id_27;
  wire id_28;
  wire id_29;
  always @(id_28) begin : LABEL_0
    id_13 = id_15;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_3,
      id_2,
      id_2,
      id_3,
      id_6,
      id_4,
      id_3,
      id_7,
      id_7,
      id_2,
      id_7,
      id_2,
      id_6,
      id_3,
      id_7,
      id_2,
      id_4,
      id_3
  );
  id_8(
      .id_0(id_7),
      .id_1(id_1[1'b0]),
      .id_2(id_2),
      .id_3(-1),
      .id_4(1'h0),
      .id_5(id_1),
      .id_6(1'b0 == $realtime),
      .id_7((id_5)),
      .id_8(),
      .id_9(id_6),
      .id_10($realtime),
      .id_11(id_7),
      .id_12(id_3),
      .id_13()
  );
  assign id_3 = $realtime;
endmodule
