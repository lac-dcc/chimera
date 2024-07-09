module module_0 (
    input logic id_1,
    output id_2
);
  id_3 id_4 (
      .id_2(1),
      .id_2(id_2)
  );
  logic id_5;
  id_6 id_7 (
      .id_2(id_5),
      .id_4(id_1)
  );
  id_8 id_9 (
      .id_7(id_5),
      .id_7(id_5)
  );
  logic id_10 (
      id_4,
      id_1
  );
  logic [id_10 : 1] id_11 = id_5;
  assign id_9 = id_5;
  logic id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  id_19 id_20 (
      .id_11(id_7),
      .id_11(id_12),
      .id_4 (id_13)
  );
  id_21 id_22 (
      .id_15(id_12),
      .id_16(id_4)
  );
  id_23 id_24 (
      .id_22(id_16),
      .id_25(1'b0),
      .id_16(id_18),
      .id_17(1)
  );
  id_26 id_27 (
      .id_10(1),
      .id_5 (id_12),
      .id_24(1),
      .id_14(id_10),
      .id_25(id_1),
      .id_20(id_4)
  );
  id_28 id_29 (
      .id_1 (id_25),
      .id_25(id_9),
      .id_5 (id_2),
      .id_17(id_16),
      .id_16(id_15),
      .id_13(id_13),
      .id_27(id_14),
      .id_15(id_18)
  );
  id_30 id_31 (
      .id_24(id_25),
      .id_20(1'b0),
      .id_16(id_15),
      .id_12(id_10),
      .id_29(id_1)
  );
  id_32 id_33 (
      .id_1 (id_14),
      .id_29(1)
  );
  always @(*) begin
    if (id_24) begin
      id_20 <= id_7;
    end else id_34 = (id_34);
  end
  assign id_35[1] = id_35;
  logic id_36 (
      id_35,
      id_37
  );
  id_38 id_39 (
      .id_36(id_40),
      .id_36(id_35)
  );
  id_41 id_42 (
      .id_40(id_43),
      .id_36(id_43),
      .id_43(id_37),
      .id_35(id_37),
      .id_43(id_37),
      .id_43(id_39),
      .id_43(id_36),
      .id_43(id_35)
  );
  logic [id_39 : id_43] id_44;
  id_45 id_46 (
      .id_36(id_43),
      .id_36(id_43),
      .id_35(id_44)
  );
  id_47 id_48 (
      .id_40(id_35),
      .id_42(id_35)
  );
  id_49 id_50 (
      .id_43(id_46),
      .id_43(id_44),
      .id_35(id_44),
      .id_42(id_46),
      .id_35(id_37)
  );
  logic id_51 (
      id_46,
      id_44
  );
  id_52 id_53 (
      .id_44(id_39),
      .id_35(id_48),
      .id_44(id_39)
  );
  id_54 id_55 (
      .id_36(id_50),
      .id_48(id_37)
  );
  id_56 id_57 (
      .id_51(id_35),
      .id_51(id_36),
      .id_48(id_40[id_42])
  );
  id_58 id_59 (
      .id_51(id_53),
      .id_42(id_50),
      .id_36(id_40)
  );
  id_60 id_61 (
      .id_36(id_44),
      .id_57(id_59),
      .id_35(id_42),
      .id_50(id_40)
  );
  logic id_62 (
      id_61,
      id_55,
      id_48
  );
  id_63 id_64 (
      .id_53(id_50),
      .id_48(id_40),
      .id_57(id_37)
  );
  specify
    (id_65 => id_66[1]) = (id_66[id_39] : id_65  : id_62, id_55  : id_40  : id_48);
    (id_67[1] => id_68) = (id_44, id_64  : id_64  : id_48);
    (id_69[1] => id_70[1]) = (id_35, id_39);
    (id_71 => id_72) = (id_64  : id_36  : id_64, id_71  : id_42  : id_50);
    (id_73 => id_74) = (id_67  : id_36  : id_42, 1);
    $setuphold(id_75, posedge id_76[id_71], id_65, 1'b0 : id_74  : id_43);
    (id_77 => id_78) = (id_71, id_68  : id_65  : id_59);
    (id_79[1] => id_80) = (id_51  : 1  : (id_55), id_40);
  endspecify
endmodule
