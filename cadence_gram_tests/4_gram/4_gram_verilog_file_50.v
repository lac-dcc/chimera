// Seed: 1954260262
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
    id_21
);
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_22(
      .id_0(id_18 == $realtime)
  );
  wire id_23;
  specify
    (id_24 + => id_25) = (id_12  : id_7  : -1, $realtime : 1  : $realtime);
  endspecify
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
    id_21,
    id_22,
    id_23
);
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_24;
  assign id_5 = 1;
  xnor primCall (
      id_1,
      id_12,
      id_9,
      id_25,
      id_24,
      id_13,
      id_3,
      id_4,
      id_23,
      id_27,
      id_14,
      id_26,
      id_8,
      id_19,
      id_6
  );
  wire id_25;
  id_26(
      .id_0(id_22),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(1),
      .id_4(),
      .id_5(id_7),
      .id_6(-1),
      .id_7(id_3)
  );
  wire id_27;
  assign id_26 = id_3;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_6,
      id_12,
      id_27,
      id_2,
      id_12,
      id_25,
      id_11,
      id_14,
      id_9,
      id_27,
      id_4,
      id_20,
      id_13,
      id_25,
      id_15,
      id_1,
      id_21,
      id_7,
      id_1
  );
  assign id_4 = $realtime;
  wire id_28;
endmodule
