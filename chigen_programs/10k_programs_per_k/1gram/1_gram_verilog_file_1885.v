// Seed: 1436053972
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
    id_23,
    id_24
);
  inout wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_25;
  wire id_26;
  id_27 :
  assert property (@(posedge "" && 1) id_14)
  else id_27 = 1;
  wire id_28;
  wire id_29;
  assign id_23 = 1;
  assign id_18 = id_27;
  wire id_30 = 1;
  wire id_31;
  tri1 id_32, id_33, id_34;
  always id_15 <= #1 id_34 << 1;
  always id_24 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_5, id_6;
  assign id_3 = id_5 - 1;
  assign id_5 = 1;
  tri0 id_7;
  assign id_3 = 1;
  assign id_3 = id_6;
  wire id_8, id_9;
  wire id_10;
  always $display(1, 1'b0, 1, id_7);
  wire id_11;
  task id_12;
    ;
  endtask
  wire id_13;
  wire id_14;
  wire id_15, id_16;
  wire id_17;
  initial id_3 <= !1'b0;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_14,
      id_17,
      id_10,
      id_4,
      id_8,
      id_13,
      id_17,
      id_7,
      id_9,
      id_9,
      id_11,
      id_13,
      id_5,
      id_13,
      id_11,
      id_7,
      id_16,
      id_9,
      id_13,
      id_7,
      id_16,
      id_13
  );
endmodule
