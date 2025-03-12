// Seed: 3169097230
module module_0 #(
    parameter id_35 = 32'd13
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
    id_33
);
  input wire id_33;
  inout wire id_32;
  inout wire id_31;
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  inout wire id_27;
  output wire id_26;
  output wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout logic [7:0] id_22;
  output wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  assign module_1.id_7 = 0;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_34;
  wire [-1 : ""] _id_35;
  assign id_22[id_35] = id_19;
endmodule
module module_1 #(
    parameter id_3 = 32'd17,
    parameter id_7 = 32'd92
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  inout wire _id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4
  );
  assign id_2[id_3&-1] = -1;
  wire id_5 = id_2;
  wire id_6, _id_7, id_8;
  assign id_2[id_7-:id_3] = 1;
endmodule
