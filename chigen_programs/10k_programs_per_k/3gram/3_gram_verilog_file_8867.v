// Seed: 12543426
module module_0 #(
    parameter id_17 = 32'd83
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire _id_17;
  ;
  wire [1 : id_17] id_18;
  always @(posedge id_4);
endmodule
module module_1 #(
    parameter id_12 = 32'd95,
    parameter id_17 = 32'd80,
    parameter id_48 = 32'd24,
    parameter id_8  = 32'd11,
    parameter id_9  = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    _id_9,
    id_10,
    id_11,
    _id_12,
    id_13
);
  input wire id_13;
  inout wire _id_12;
  input wire id_11;
  inout wire id_10;
  input wire _id_9;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_10,
      id_10,
      id_4,
      id_6,
      id_5,
      id_10,
      id_10,
      id_10,
      id_10,
      id_13,
      id_13,
      id_10,
      id_11,
      id_13
  );
  inout wire _id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  logic [id_12 : -1] id_14;
  ;
  wire [-1 : id_9] id_15;
  xor primCall (id_2, id_13, id_11, id_6, id_3, id_7, id_10);
  assign id_2[-1'h0] = id_14[id_8 : 1];
  wire  id_16  ,  _id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  [  id_17  :  1  ]  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  _id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ,  id_62  ,  id_63  ,  id_64  ,  id_65  ,  id_66  ,  id_67  ,  id_68  ,  id_69  ,  id_70  ,  id_71  ,  id_72  ,  id_73  ,  id_74  ;
  assign id_7[id_48] = -1 - 1;
endmodule
