module module_0 (
    input logic [1 : 1] id_1,
    input id_2,
    id_3
);
  assign id_2 = 1;
  id_4 id_5 (
      .id_4(id_3),
      .id_2(id_4),
      .id_3(id_1),
      1,
      .id_4({id_3, id_3[id_1], id_2, id_4, id_4})
  );
  id_6 id_7 (
      .id_5(id_5),
      .id_4(1),
      .id_2(id_5 & ({id_5#(.id_2(1))}))
  );
  id_8 id_9 (
      .id_1(id_5),
      .id_8(id_8 == id_4)
  );
  logic id_10;
  id_11 id_12 (
      .id_6(1),
      .id_6(id_6)
  );
  logic [id_7 : id_9[id_11]]
      id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23;
  logic id_24 (
      .id_8(1),
      .id_5(id_14),
      .id_3(1),
      id_3[1 : id_3]
  );
  id_25 id_26 (
      .id_25(id_22),
      .id_21(1),
      .id_8 (~id_9),
      .id_24(id_25),
      .id_2 (id_13),
      .id_22(id_24)
  );
  assign id_23 = id_2;
  id_27 id_28 (
      .id_10(1),
      .id_20(id_11),
      .id_19(1'd0)
  );
  logic id_29 (
      .id_11(1),
      .id_11(id_15),
      .id_25(1'h0),
      .id_15(1'b0),
      id_2
  );
  logic id_30;
  logic id_31;
  id_32 id_33 (
      .id_9 (id_29),
      .id_10(1),
      .id_12(id_24[id_18]),
      .id_22(id_12),
      .id_10(~id_31),
      .id_27(id_13)
  );
  id_34 id_35 (
      .id_28(1),
      .id_32(id_9),
      .id_7 (id_17),
      .id_31(id_7),
      .id_19(1),
      .id_6 (id_6)
  );
  output id_36;
  id_37 id_38 (
      .id_8 (id_20[id_34]),
      .id_28(id_1),
      .id_2 (id_8 << id_14),
      .id_34(id_31)
  );
  output [id_37 : id_34] id_39;
  assign id_10 = id_11;
  logic id_40;
  assign id_13 = id_39[1] ? 1 : id_23 & {id_18, id_3} - id_28;
  id_41 id_42 (
      .id_8 (1),
      .id_34(1),
      .id_17(1'b0)
  );
  always @(posedge 1) begin
    id_40[id_22] = 1;
  end
  logic id_43, id_44, id_45, id_46, id_47, id_48, id_49, id_50, id_51, id_52;
  id_53 id_54 (
      .id_53(id_45),
      .id_49(1),
      .id_50(id_43 == 1)
  );
  id_55 id_56 (
      .id_44(id_53),
      .id_53(id_45[id_53[~id_45[~id_53[id_51]]]]),
      .id_55(id_51)
  );
  id_57 id_58 (
      .id_51(1 & id_49 & id_57 & id_48 & ~id_53[1'b0] & id_48[id_47]),
      .id_47(id_50 & 1 & id_51 & id_54 & id_45 & id_43)
  );
  logic id_59;
  assign id_55 = id_55[id_53];
  id_60 id_61 (
      .id_48(id_60),
      .id_51(id_56)
  );
  id_62 id_63 (
      .id_45(id_52),
      .id_52(id_44)
  );
  id_64 id_65 (
      .id_59(id_44),
      .id_44((id_54[id_55[id_45]]))
  );
  logic [id_47 : id_43] id_66 (
      .id_52(id_65),
      .id_62(id_64),
      .id_62(1)
  );
  id_67 id_68 (
      .id_66(id_64),
      id_61,
      .id_66(1),
      .id_61(1),
      .id_43(id_47),
      .id_63(id_51),
      .id_58(id_56)
  );
  assign id_57 = id_55 ? id_54 : 1 ? ~id_43[id_59[1 : id_58[id_53[id_52]]] : id_53] : 1'b0;
  always @(posedge 'b0) begin
    id_45 <= #id_69 id_68;
    if (1) begin
      id_48[1] <= (id_53);
    end else if (id_70) id_70 <= 1;
  end
  always @(posedge id_71) begin
    id_71 <= id_71;
  end
endmodule
