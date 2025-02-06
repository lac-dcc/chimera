// Seed: 4133801273
module module_0;
  id_1(
      .id_0($realtime), .id_1(id_2), .id_2($realtime), .id_3(id_3), .id_4($realtime)
  );
  assign id_1 = (id_3);
  wire id_4;
endmodule
module module_1 #(
    parameter id_40 = 32'd7,
    parameter id_41 = 32'd59
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
    id_36
);
  inout wire id_36;
  inout wire id_35;
  input wire id_34;
  output wire id_33;
  inout wire id_32;
  inout wire id_31;
  inout wire id_30;
  inout wire id_29;
  output wire id_28;
  inout wire id_27;
  output wire id_26;
  input wire id_25;
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_37(
      .id_0($realtime), .id_1(id_24), .id_2()
  ); id_38(
      .id_0(1), .id_1(id_31), .id_2($realtime), .id_3(!id_19), .id_4()
  );
  wire id_39 = id_7;
  defparam id_40.id_41 = id_25 | id_9[$realtime] | ($realtime ? id_5 : id_16);
  xnor primCall (
      id_1,
      id_10,
      id_12,
      id_13,
      id_15,
      id_16,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_25,
      id_27,
      id_29,
      id_30,
      id_31,
      id_32,
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
      id_5,
      id_6,
      id_7,
      id_9
  );
  wire id_42;
  assign id_33 = $realtime;
  id_43(
      .id_0($realtime), .id_1(id_29), .id_2($realtime)
  );
  module_0 modCall_1 ();
  wire id_44, id_45;
endmodule
