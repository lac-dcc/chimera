// Seed: 1218913221
module module_0 #(
    parameter id_18 = 32'd5
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
    _id_18,
    id_19
);
  output wire id_19;
  inout wire _id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout tri0 id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_13 = 1;
  wire [1 : id_18] id_20;
endmodule
module module_1 #(
    parameter id_13 = 32'd76,
    parameter id_4  = 32'd69
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input logic [7:0] id_8;
  input logic [7:0] id_7;
  inout supply0 id_6;
  output logic [7:0] id_5;
  input wire _id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_11 == id_8[-1];
  logic id_12;
  ;
  parameter id_13 = 1;
  wire [-1 : id_4] id_14;
  assign id_5 = id_7;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_2,
      id_12,
      id_14,
      id_12,
      id_11,
      id_6,
      id_9,
      id_14,
      id_11,
      id_6,
      id_14,
      id_14,
      id_11,
      id_10,
      id_13,
      id_12
  );
  assign modCall_1.id_18 = 0;
  assign id_5[-1] = ~id_7[id_13];
  wire  [  1 'd0 :  -1  ]  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ,  id_62  ,  id_63  ,  id_64  ,  id_65  ,  id_66  ,  id_67  ,  id_68  ,  id_69  ,  id_70  ,  id_71  ,  id_72  ,  id_73  ,  id_74  ,  id_75  ,  id_76  ,  id_77  ,  id_78  ,  id_79  ,  id_80  ,  id_81  ,  id_82  ,  id_83  ,  id_84  ,  id_85  ,  id_86  ,  id_87  ,  id_88  ,  id_89  ,  id_90  ,  id_91  ,  id_92  ,  id_93  ,  id_94  ,  id_95  ;
endmodule
