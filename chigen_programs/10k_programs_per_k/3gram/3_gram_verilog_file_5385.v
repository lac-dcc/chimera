// Seed: 3603243594
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    output wire id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    output uwire id_7,
    input uwire id_8,
    input tri id_9,
    input uwire id_10,
    output tri0 id_11,
    output wire id_12,
    output tri1 id_13,
    input uwire id_14,
    input tri1 id_15,
    input supply0 id_16,
    input wire id_17,
    output uwire id_18,
    output tri1 id_19,
    input wor id_20,
    input tri0 id_21
);
  wire  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ,  id_62  ,  id_63  ,  id_64  ,  id_65  ,  id_66  ,  id_67  ,  id_68  ,  id_69  ,  id_70  ,  id_71  ,  id_72  ,  id_73  ,  id_74  ,  id_75  ,  id_76  ,  id_77  ,  id_78  ,  id_79  ,  id_80  ,  id_81  ,  id_82  ,  id_83  ,  id_84  ,  id_85  ,  id_86  ,  id_87  ,  id_88  ,  id_89  ,  id_90  ,  id_91  ,  id_92  ;
  wire id_93;
  wire id_94;
endmodule
module module_1 #(
    parameter id_10 = 32'd39,
    parameter id_9  = 32'd92
) (
    input wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    output tri1 id_4,
    input tri1 id_5
);
  wire id_7;
  wire id_8;
  nand (id_3, id_7, id_0, id_5, id_2, id_1, id_8);
  module_0(
      id_2,
      id_5,
      id_4,
      id_3,
      id_0,
      id_1,
      id_5,
      id_3,
      id_0,
      id_0,
      id_0,
      id_4,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_0
  ); defparam id_9.id_10 = 1;
endmodule
