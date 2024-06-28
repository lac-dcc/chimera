`timescale 1ps / 1 ps
module module_0 (
    input signed id_1,
    output logic id_2,
    inout [id_1 : id_2] id_3,
    input logic [id_3 : id_2] id_4
);
  logic id_5 (
      .id_2(id_4),
      .id_3(id_1)
  );
  id_6 id_7 (
      .id_5(id_4[id_5+:id_4]),
      .id_5(id_1)
  );
  id_8 id_9 (
      .id_4(id_7),
      .id_5(id_5),
      .id_4(id_2),
      .id_5(id_5)
  );
  id_10 id_11 (
      .id_7(id_2),
      .id_5(id_5)
  );
  id_12 id_13 (
      .id_11(id_4),
      .id_14(id_2),
      .id_1 (id_3),
      .id_9 (id_4)
  );
  id_15 id_16 (
      .id_13(1),
      .id_1 (id_4)
  );
  id_17 id_18 (
      .id_3 (id_3),
      .id_1 (id_4),
      .id_16(id_14)
  );
  id_19 id_20 (
      .id_13(id_16),
      .id_18({id_2, id_13})
  );
  id_21 id_22 (
      .id_7 (id_5),
      .id_14(id_14)
  );
  id_23 id_24 (
      .id_22(id_22),
      .id_25(id_4)
  );
  assign id_13 = id_25;
  id_26 id_27 (
      .id_25(id_9),
      .id_18(id_24[id_3]),
      .id_7 (id_3)
  );
  id_28 id_29 (
      .id_13(id_25),
      .id_3 (id_25),
      .id_4 (1),
      .id_3 (id_4),
      .id_16(id_18),
      .id_18(id_14),
      .id_4 (id_7),
      .id_3 (id_9),
      .id_14(id_27),
      .id_18(1),
      .id_18(id_14),
      .id_27(id_11)
  );
  id_30 id_31 (
      .id_11(id_22),
      .id_24(id_18)
  );
  id_32 id_33 (
      .id_5 (id_14),
      .id_7 (id_2),
      .id_20(1)
  );
  id_34 id_35 (
      .id_13(id_9 == 1),
      .id_1 (id_29),
      .id_11(id_20)
  );
  id_36 id_37 (
      .id_1 (id_4),
      .id_22(id_16),
      .id_5 (id_1)
  );
  assign id_22 = id_20[id_29] ? id_13 : id_9;
  id_38 id_39 (
      .id_7 (1),
      .id_11(id_2),
      .id_20(id_29),
      .id_18(id_1),
      .id_7 (id_13),
      .id_35(id_27 == id_37)
  );
  id_40 id_41 (
      .id_22(id_20),
      .id_20(id_25)
  );
  id_42 id_43 (
      .id_37(id_4),
      .id_29(id_35),
      .id_37(id_7),
      .id_5 (id_9),
      .id_27(id_14)
  );
  logic [id_14 : id_1] id_44 (
      .id_41(id_20),
      .id_7 (id_5),
      .id_14(1),
      .id_31(id_35)
  );
  id_45 id_46 (
      .id_9 (id_9),
      .id_33(id_31),
      .id_4 (id_44),
      .id_20(id_44)
  );
  id_47 id_48 (
      .id_11(id_2),
      .id_18(id_41)
  );
  id_49 id_50 (
      .id_22(id_1),
      .id_4 (id_2)
  );
  id_51 id_52 (
      .id_13(id_20),
      .id_5 (id_35),
      .id_22(id_11 & id_31),
      .id_20(id_2)
  );
  id_53 id_54 (
      .id_20(id_25),
      .id_37(id_52[id_20[id_50]]),
      .id_44(1),
      .id_9 (id_27)
  );
  logic id_55 (
      .id_54(id_7),
      .id_4 (id_1)
  );
  id_56 id_57 (
      .id_24(id_29),
      .id_13(id_20),
      .id_44(id_39),
      .id_33(id_25),
      .id_31(id_9)
  );
  assign id_22 = id_5;
  id_58 id_59 (
      .id_4 (id_41 << id_2),
      .id_50(id_9)
  );
  logic id_60;
  id_61 id_62 (
      .id_9 (id_25),
      .id_57(id_52),
      .id_43(id_14)
  );
  id_63 id_64 (
      .id_48(id_57),
      .id_27(id_60),
      .id_62(id_60),
      .id_25(id_16),
      .id_44(id_39),
      .id_29(id_31),
      .id_50(id_29),
      .id_48(id_57),
      .id_22(1)
  );
  assign id_3 = id_24;
  id_65 id_66 (
      .id_62(id_25),
      .id_5 (1),
      .id_35(id_44)
  );
  id_67 id_68 (
      .id_64(id_5),
      .id_66(id_31),
      .id_66(id_13[id_39]),
      .id_33(id_62),
      .id_50(1),
      .id_54(id_52),
      .id_64(id_11),
      .id_57({1, id_35}),
      .id_64(id_14)
  );
  id_69 id_70 (
      .id_41(id_66),
      .id_37(id_62),
      .id_3 (id_29),
      .id_25(id_4),
      .id_48(id_35[id_35]),
      .id_14(id_18),
      .id_13((id_46) * id_50 * id_68 - id_52 | id_46),
      .id_44(id_33)
  );
endmodule
