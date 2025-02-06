// Seed: 1225562038
module module_0;
  wire id_1;
  reg  id_2;
  id_3(
      .id_0(id_2), .id_1(-1), .id_2($realtime), .id_3(id_2), .id_4()
  );
  always @(negedge 1'b0) id_2 <= $realtime;
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
    id_39
);
  output wire id_39;
  output wire id_38;
  inout wire id_37;
  input wire id_36;
  input wire id_35;
  output wire id_34;
  input wire id_33;
  inout wire id_32;
  input wire id_31;
  inout wire id_30;
  inout wire id_29;
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  input wire id_24;
  input wire id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1 or posedge $realtime) begin : LABEL_0
    id_18 <= !id_22 > $realtime ? id_19 : id_5;
  end
  module_0 modCall_1 ();
  assign id_6 = id_19;
  id_40(
      $realtime, id_23, id_18, (!id_26)
  );
  or primCall (
      id_1,
      id_11,
      id_12,
      id_13,
      id_14,
      id_16,
      id_19,
      id_22,
      id_23,
      id_24,
      id_26,
      id_27,
      id_28,
      id_29,
      id_3,
      id_30,
      id_31,
      id_32,
      id_33,
      id_35,
      id_36,
      id_37,
      id_5,
      id_6,
      id_7,
      id_9
  );
  wire id_41;
  id_42(
      .id_0($realtime), .id_1(id_14), .id_2(1'b0), .id_3(($realtime))
  );
endmodule
