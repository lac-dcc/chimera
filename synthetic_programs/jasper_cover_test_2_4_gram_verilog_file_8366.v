module module_0 (
    id_1,
    id_2
);
  output id_2;
  input id_1;
  id_3 id_4 (
      .id_2(id_1),
      .id_2(id_2),
      .id_5(id_2),
      .id_1(1),
      .id_2(id_1),
      .id_1(id_2),
      .id_5(id_2),
      .id_5(id_5),
      .id_1(id_5),
      .id_1(id_2),
      .id_2(id_2[id_1]),
      .id_1(id_1)
  );
  id_6 id_7 (
      .id_1({id_4, id_4}),
      .id_2(id_1),
      .id_4(id_2),
      .id_5((id_5))
  );
  id_8 id_9 (
      .id_2(id_4),
      .id_4(id_4),
      .id_1(id_5),
      .id_7(1)
  );
  logic [id_5 : id_5] id_10;
  id_11 id_12 (
      .id_7 (id_9),
      .id_4 (id_2),
      .id_7 (id_5),
      .id_5 (id_10),
      .id_2 (id_9),
      .id_5 (id_10),
      .id_10(id_4)
  );
  id_13 id_14 (
      .id_5(1),
      .id_4(id_10)
  );
  id_15 id_16 (
      .id_7(id_5),
      .id_1(id_10),
      .id_4(id_9),
      .id_7(id_12),
      .id_7(id_9),
      .id_4(id_9)
  );
  id_17 id_18 (
      .id_14(id_7),
      .id_2 (id_5),
      .id_16(1),
      .id_10(id_2),
      .id_12(id_2)
  );
  id_19 id_20 (
      .id_14(id_1),
      .id_16(id_7[id_21]),
      .id_14(id_5)
  );
  assign id_9[id_12] = id_16 ? id_1 : id_10;
  id_22 id_23 (
      .id_10(id_4),
      .id_5 (id_21[id_14])
  );
  id_24 id_25 (
      .id_21(1),
      .id_21(id_4),
      .id_4 (1),
      .id_12(id_5[id_23])
  );
  logic id_26;
  id_27 id_28 (
      .id_16(id_2),
      .id_4 (id_25)
  );
  assign id_10 = id_25;
  id_29 id_30 (
      .id_23(id_4),
      .id_14(),
      .id_7 (id_4),
      .id_10(id_25)
  );
  id_31 id_32 (
      .id_14(id_25),
      .id_12(id_5),
      .id_28(id_5),
      .id_9 (id_12),
      .id_25(id_25)
  );
  logic id_33;
  id_34 id_35 (
      .id_21(id_16),
      .id_26(id_23),
      .id_30(id_16),
      .id_16(id_30 & 1'b0)
  );
  assign id_16[id_30] = id_30;
  logic id_36;
  id_37 id_38 (
      .id_25(id_36),
      .id_10(id_36),
      .id_14(id_32),
      .id_21(id_28)
  );
  id_39 id_40 (
      .id_35(id_38[id_21]),
      .id_21(id_12 & id_5#(.id_5(id_38))),
      .id_16(id_38)
  );
  assign id_33 = id_36;
  id_41 id_42 (
      .id_18(id_1),
      .id_18(id_21),
      .id_32(id_10),
      .id_14(id_38)
  );
  id_43 id_44 (
      .id_35(id_14),
      .id_26(id_23),
      .id_25(1),
      .id_21(id_20),
      .id_1 (id_28),
      .id_26(id_18)
  );
  always @(posedge 1) begin
  end
  id_45 id_46 (
      .id_47(id_48),
      .id_48(id_47)
  );
  id_49 id_50 (
      .id_47(id_46),
      .id_46(id_48),
      .id_51(id_47),
      .id_47(id_47),
      .id_47(1)
  );
  id_52 id_53 (
      .id_50(1),
      .id_47((1'd0)),
      .id_47(id_47),
      .id_54(id_46),
      .id_47((id_48)),
      .id_46(id_54),
      .id_54(id_46),
      .id_54(id_46)
  );
  logic [id_50 : id_53] id_55 (
      .id_50(id_47),
      .id_54(id_51),
      .id_53(id_53)
  );
  logic id_56;
  id_57 id_58 (
      .id_46(1),
      .id_55(id_55),
      .id_53(1)
  );
  id_59 id_60 (
      .id_48(id_55),
      .id_51(id_56)
  );
  id_61 id_62 (
      .id_50(id_46),
      .id_58(id_46),
      .id_56(id_47),
      .id_50(id_55),
      .id_47(id_46)
  );
  id_63 id_64;
  assign id_62 = id_56;
  always @(posedge id_58 or posedge id_54) begin
    id_58 <= id_48;
  end
endmodule
