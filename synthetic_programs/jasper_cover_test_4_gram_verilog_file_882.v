module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  id_9 id_10 (
      .id_3(id_8),
      .id_4(1),
      .id_5(id_4)
  );
  logic id_11;
  id_12 id_13 (
      .id_8(id_4),
      .id_7(id_2),
      .id_1(id_10),
      .id_1(id_3),
      .id_6(1),
      .id_7(id_5),
      .id_1(id_8),
      .id_1(1'h0),
      .id_1(id_4),
      .id_1(id_8),
      .id_4(id_2)
  );
  id_14 id_15 (
      .id_13(id_8),
      .id_5 (id_2[id_3])
  );
  id_16 id_17 (
      .id_2 (id_11),
      .id_15(id_10),
      .id_8 (id_8),
      .id_10(id_13),
      .id_15(id_2),
      .id_10(id_13),
      .id_11(id_2),
      .id_7 (id_7),
      .id_3 (id_3)
  );
  id_18 id_19 (
      .id_1 (1),
      .id_11(id_10),
      .id_4 (id_10)
  );
  assign id_2 = id_3;
  logic id_20;
  id_21 id_22 (
      .id_20(id_20),
      .id_4 (id_10),
      .id_2 (id_20)
  );
  id_23 id_24 (
      .id_19(id_7),
      .id_3 (id_17),
      .id_17(id_2[id_3]),
      .id_2 (id_11),
      .id_22(id_13),
      .id_17(id_20),
      .id_15(id_3),
      .id_11(id_1),
      .id_2 (id_20)
  );
  id_25 id_26 (
      .id_24(1),
      .id_8 (id_2)
  );
  id_27 id_28 (
      .id_19(id_20),
      .id_15(id_26),
      .id_20(id_26),
      .id_7 (id_15),
      .id_6 (id_22),
      .id_6 (1),
      .id_8 (id_3),
      .id_24(id_5),
      .id_20(id_26)
  );
  assign id_10[id_6] = id_4;
  id_29 id_30 (
      .id_22(id_1),
      .id_13(id_10)
  );
  logic [id_3[(  id_3  )] : id_10] id_31 (
      .id_26(id_22),
      .id_6 (id_2)
  );
  id_32 id_33 (
      .id_1 (id_6),
      .id_13(id_24)
  );
  id_34 id_35 (
      .id_24(id_33),
      .id_31(id_13),
      .id_2 (id_31)
  );
  logic id_36;
  id_37 id_38 (
      .id_4 (id_26),
      .id_31(id_33),
      .id_6 (id_5),
      .id_7 (1),
      .id_24(id_11),
      .id_11(id_1)
  );
  id_39 id_40 (
      .id_36(id_17[id_6 : id_5]),
      .id_11(1),
      .id_28(id_31),
      .id_31(1)
  );
  assign id_38 = id_8;
  logic id_41;
  id_42 id_43 (
      .id_15(id_20),
      .id_26(id_7)
  );
  logic id_44;
  assign id_35 = id_15;
  always @(posedge id_28 or posedge id_43) begin
    id_19 <= id_1;
  end
  id_45 id_46 (
      .id_47(id_48[id_47]),
      .id_48(id_47),
      .id_47((id_49)),
      .id_49(id_50),
      .id_49(id_47)
  );
  id_51 id_52 (
      .id_50(id_46),
      .id_50(id_48),
      .id_50(id_49),
      .id_49(1),
      .id_48(id_48),
      .id_48(id_49),
      .id_47(id_50),
      .id_50(id_46),
      .id_49(id_49),
      .id_47(1),
      .id_47(1),
      .id_47(id_53),
      .id_46(id_47),
      .id_48(1)
  );
  id_54 id_55 (
      .id_49(id_49),
      .id_46(id_47),
      .id_46(id_52),
      .id_50(id_49),
      .id_48(id_49)
  );
  id_56 id_57 (
      .id_48(id_53),
      .id_53(id_53),
      .id_47(id_52)
  );
  id_58 id_59 (
      .id_55(id_55),
      .id_52({id_48, id_48}),
      .id_50(id_52),
      .id_47(id_57),
      .id_55(id_47)
  );
  id_60 id_61 (
      .id_46(1),
      .id_59(id_59)
  );
  id_62 id_63 (
      .id_55(id_47[id_46]),
      .id_47(id_48),
      .id_61(id_61),
      .id_52(id_47)
  );
  id_64 id_65 (
      .id_50(id_49),
      .id_61(id_55)
  );
  id_66 id_67 (
      .id_49(id_48),
      .id_47(id_47)
  );
  id_68 id_69 ();
endmodule
