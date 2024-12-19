// Seed: 992799775
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
    id_16
);
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ,  id_62  ,  id_63  ,  id_64  ,  id_65  ,  id_66  ,  id_67  ,  id_68  ,  id_69  ,  id_70  ,  id_71  ,  id_72  ,  id_73  ,  id_74  ,  id_75  ,  id_76  ,  id_77  ,  id_78  ,  id_79  ,  id_80  ,  id_81  ,  id_82  ,  id_83  ,  id_84  ,  id_85  ,  id_86  ,  id_87  ,  id_88  ,  id_89  ,  id_90  ,  id_91  ,  id_92  ,  id_93  ,  id_94  ,  id_95  ,  id_96  ,  id_97  ,  id_98  ,  id_99  ,  id_100  ,  id_101  ,  id_102  ,  id_103  ,  id_104  ,  id_105  ,  id_106  ,  id_107  ,  id_108  ,  id_109  ,  id_110  ,  id_111  ,  id_112  ,  id_113  ,  id_114  ,  id_115  ;
  wire id_116;
  assign id_15 = id_62 - 1;
  wire id_117;
  wire id_118;
  wire id_119;
  assign id_22 = 1'h0;
  always_comb @(posedge 1) begin : LABEL_0$display
    ;
    id_28 = id_44;
  end
  wire id_120;
  wire id_121 = 1;
  wire id_122;
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
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_19 = id_16 == id_8;
  always @(posedge id_16 == id_9 or posedge 1 - id_5) #1;
  wire id_20, id_21;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_19,
      id_9,
      id_2,
      id_19,
      id_6,
      id_19,
      id_15,
      id_17,
      id_9,
      id_16,
      id_9,
      id_14,
      id_1,
      id_20
  );
  assign modCall_1.id_108 = 0;
  wire id_22;
  wire id_23;
  or primCall (
      id_7, id_18, id_15, id_8, id_9, id_4, id_12, id_21, id_2, id_19, id_14, id_5, id_16, id_17
  );
  wire id_24;
endmodule
