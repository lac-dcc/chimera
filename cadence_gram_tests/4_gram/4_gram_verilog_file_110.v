// Seed: 3975808784
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  assign module_1.id_21 = 0;
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
    id_19
);
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = $realtime;
  assign id_6 = -1;
  id_20(
      .id_0()
  );
  reg id_21;
  module_0 modCall_1 (
      id_2,
      id_14,
      id_7,
      id_8,
      id_2,
      id_8,
      id_15,
      id_13,
      id_15,
      id_17,
      id_13,
      id_13,
      id_9,
      id_14
  );
  wire id_22;
  initial begin : LABEL_0
    id_21 <= $realtime;
  end
  `define pp_23 0
  id_24(
      .id_0($realtime), .id_1((id_6)), .id_2()
  );
  wire id_25;
endmodule
