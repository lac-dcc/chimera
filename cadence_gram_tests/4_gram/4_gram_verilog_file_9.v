// Seed: 57441032
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
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_23;
  assign id_3 = id_5;
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
    id_23,
    id_24,
    id_25
);
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_26(
      .id_0()
  );
  assign id_1[$realtime] = id_20[$realtime];
  module_0 modCall_1 (
      id_23,
      id_6,
      id_8,
      id_17,
      id_8,
      id_15,
      id_25,
      id_8,
      id_25,
      id_23,
      id_11,
      id_19,
      id_8,
      id_17,
      id_12,
      id_3,
      id_17,
      id_12,
      id_13,
      id_13,
      id_25,
      id_13
  );
  wire id_27;
  wire id_28;
  wire id_29;
  id_30(
      .id_0(~id_21), .id_1($realtime), .id_2(1), .id_3($realtime), .id_4(-1)
  );
  wire id_31 = id_31#(id_16);
  wire id_32;
  wire id_33;
  assign id_3 = $realtime;
  parameter id_34 = 1;
  wire id_35;
  supply1 id_36;
  specify
    (id_37 - => id_38) = (-1  : id_11 == id_36  : $realtime, -1  : id_12  : id_36);
  endspecify
endmodule
