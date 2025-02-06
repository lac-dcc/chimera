// Seed: 1258520092
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  id_8(
      .id_0($realtime),
      .id_1(id_3),
      .id_2(id_1),
      .id_3(-1'b0 == id_3),
      .id_4(!id_5),
      .id_5($realtime),
      .id_6()
  );
  wire id_9;
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
    id_21
);
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_1 or posedge -1) begin : LABEL_0
    id_1 <= id_20;
    if ($realtime) id_17 = 1;
  end
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_8,
      id_2,
      id_9,
      id_12
  );
endmodule
