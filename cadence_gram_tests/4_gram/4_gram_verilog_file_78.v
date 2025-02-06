// Seed: 2522158445
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_7(
      .id_0(id_6), .id_1(id_4)
  );
  wire id_8;
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
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40,
    id_41,
    id_42,
    id_43,
    id_44
);
  input wire id_44;
  inout wire id_43;
  input wire id_42;
  output wire id_41;
  output wire id_40;
  inout wire id_39;
  output wire id_38;
  output wire id_37;
  output wire id_36;
  inout wire id_35;
  input wire id_34;
  inout wire id_33;
  inout wire id_32;
  inout wire id_31;
  output wire id_30;
  output wire id_29;
  inout wire id_28;
  output wire id_27;
  inout wire id_26;
  inout wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_45;
  module_0 modCall_1 (
      id_45,
      id_9,
      id_28,
      id_33,
      id_33,
      id_28
  );
  always @(posedge -1 or negedge -1) id_8 <= #1 $realtime;
  specify
    $setuphold(posedge id_46, posedge id_47, 1, -1);
    $width(negedge id_48, id_42, $realtime);
    $hold(posedge id_49[$realtime] &&& id_15[-1 :-1], negedge id_50 &&& !id_14, id_15);
  endspecify
endmodule
