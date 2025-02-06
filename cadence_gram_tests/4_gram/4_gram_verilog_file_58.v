// Seed: 2540766997
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
    id_44,
    id_45,
    id_46,
    id_47,
    id_48,
    id_49,
    id_50,
    id_51,
    id_52,
    id_53,
    id_54,
    id_55,
    id_56,
    id_57,
    id_58,
    id_59,
    id_60,
    id_61,
    id_62,
    id_63,
    id_64
);
  input wire id_64;
  output wire id_63;
  output wire id_62;
  input wire id_61;
  input wire id_60;
  input wire id_59;
  output wire id_58;
  inout wire id_57;
  input wire id_56;
  inout wire id_55;
  inout wire id_54;
  input wire id_53;
  input wire id_52;
  inout wire id_51;
  output wire id_50;
  inout wire id_49;
  input wire id_48;
  input wire id_47;
  output wire id_46;
  inout wire id_45;
  inout wire id_44;
  inout wire id_43;
  output wire id_42;
  input wire id_41;
  inout wire id_40;
  output wire id_39;
  output wire id_38;
  input wire id_37;
  inout wire id_36;
  inout wire id_35;
  inout wire id_34;
  input wire id_33;
  inout wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  output wire id_28;
  output wire id_27;
  input wire id_26;
  input wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_65;
  wire id_66;
  id_67(
      $realtime, 1'b0, id_3, 1'b0, id_11, -1
  );
  assign id_65 = 1;
  assign id_16 = id_32[$realtime];
  id_68(
      .id_0(-1), .id_1(((id_50 && -1))), .id_2(1)
  );
  assign id_8  = id_61[$realtime];
  assign id_65 = id_9 == $realtime;
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_11 = id_9[-1'b0];
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_7,
      id_7,
      id_10,
      id_8,
      id_8,
      id_3,
      id_6,
      id_3,
      id_8,
      id_4,
      id_3,
      id_8,
      id_4,
      id_3,
      id_7,
      id_5,
      id_3,
      id_3,
      id_10,
      id_3,
      id_3,
      id_6,
      id_6,
      id_5,
      id_2,
      id_2,
      id_5,
      id_3,
      id_11,
      id_6,
      id_5,
      id_3,
      id_3,
      id_6,
      id_10,
      id_8,
      id_3,
      id_3,
      id_10,
      id_8,
      id_7,
      id_3,
      id_8,
      id_8,
      id_7,
      id_7,
      id_2,
      id_10,
      id_3,
      id_10,
      id_8,
      id_8,
      id_5,
      id_10,
      id_2,
      id_1,
      id_10,
      id_9,
      id_8,
      id_4,
      id_7
  );
  id_12(
      .id_0(id_3)
  );
  uwire id_13;
  wire  id_14;
  assign id_13 = $realtime;
  specify
    specparam id_15 = id_8;
    $width(negedge id_16 &&& $realtime, id_8, $realtime + id_11[$realtime], id_17);
  endspecify
endmodule
