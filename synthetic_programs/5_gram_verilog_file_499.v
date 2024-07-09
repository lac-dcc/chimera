module module_0 (
    id_1,
    inout logic [id_2 : id_3] id_4,
    input id_5,
    id_6,
    id_7,
    input [id_6[1] : id_4] id_8,
    id_9,
    input logic id_10,
    id_11,
    output id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  logic [id_6 : 1] id_17;
  id_18 id_19 (
      .id_8 (id_17),
      .id_12(id_18)
  );
  logic id_20;
  assign id_13 = 1;
  id_21 id_22 (
      .id_6 (1),
      .id_19(id_15)
  );
  always @(posedge 1 or posedge id_18) begin
    id_2  = id_12;
    id_20 = id_22;
    id_1 <= 1;
  end
  id_23 id_24 (
      .id_23(id_23 + id_25),
      .id_23(id_26)
  );
  assign id_23[id_25] = id_24;
  assign id_24 = id_24;
  id_27 id_28 (
      .id_23(1),
      .id_25(1'b0),
      .id_27(1),
      1,
      .id_24(id_27),
      .id_24(id_25[id_25])
  );
  logic [1 'b0 : 1] id_29;
  logic id_30;
  logic id_31 (
      .id_29(id_26[id_27]),
      .id_26(id_29),
      id_29
  );
  id_32 id_33 (
      .id_27(1'd0),
      .id_25(1)
  );
  assign id_27 = id_31[id_31];
  id_34 id_35 ();
  logic id_36;
  id_37 id_38 (
      .id_34(id_37#(id_24, 1'b0, 1)),
      .id_36(id_34),
      .id_37(1),
      .id_37(1),
      .id_25(""),
      .id_26(id_31)
  );
  assign id_38 = id_29;
  parameter id_39 = id_29;
  always @(posedge 1 & id_34[id_37] & id_25[1] & 1 & id_28) begin
    id_25 = id_25;
    if (1) id_26 <= 1;
    else id_36 <= id_39;
    id_29 = id_25;
  end
  logic [1 : id_40  !==  1] id_41;
  id_42 id_43 (
      .id_40(1),
      .id_41(id_40),
      .id_44(id_41),
      .id_41(1),
      .id_40((id_41[1'd0&id_40]))
  );
  id_45 id_46 (
      .id_45(id_41),
      .id_42(id_41)
  );
  id_47 id_48 (
      .id_47(1),
      .id_47(id_41)
  );
  id_49 id_50 (
      .id_41(id_45),
      .id_41(1),
      .id_42(id_47 & id_42)
  );
  logic id_51 (
      .id_41(id_40),
      .id_42(id_46[1]),
      id_49
  );
  logic id_52;
  always @(posedge 1'b0 or posedge 1) id_44 <= ~id_47;
  output id_53;
  logic id_54 (
      .id_47(~id_43),
      id_53[1]
  );
  id_55 id_56 (
      .id_49(id_41),
      .id_42(id_54[id_46])
  );
  logic [id_54[id_49] : id_47] id_57;
  assign id_48 = id_44;
  id_58 id_59 (
      .id_42(id_48),
      .id_58(1),
      id_44,
      .id_50(id_52),
      id_52,
      .id_43(id_42),
      id_46[1],
      .id_53((1)),
      .id_54(1),
      .id_53(id_56),
      .id_40(id_55),
      .id_51(1)
  );
  assign id_48 = id_47;
  id_60 id_61 (
      .id_52(1'b0 / id_40),
      .id_46(id_41)
  );
  localparam id_62 = id_40;
  id_63 id_64 (
      id_56,
      .id_49(1),
      .id_49(id_40),
      .id_43(id_41[(1'd0)]),
      .id_46(id_44)
  );
  logic id_65 (
      .id_49(id_58),
      id_60[(1)]
  );
  id_66 id_67 (
      .id_60(id_56),
      .id_59(1'b0),
      .id_51(),
      .id_54(id_57),
      .id_46(1'b0)
  );
  id_68 id_69 (
      .id_59(id_55),
      .id_65(id_45),
      .id_65(1),
      .id_52(id_43[id_66])
  );
  always @(*) id_70;
  id_71 id_72 (
      .id_57(id_70),
      .id_59(id_63),
      .id_44(1'b0),
      .id_65(id_52),
      .id_49(1),
      .id_47((id_58)),
      .id_64(id_42),
      .id_53(id_52[1]),
      .id_68(1'b0),
      .id_61(id_53),
      .id_42(id_53)
  );
  assign id_46 = id_55[id_57];
  logic id_73;
  logic id_74;
  id_75 id_76 (
      .id_67(1),
      .id_46(id_47)
  );
  always @(posedge 1'b0 or posedge id_61) id_47[id_60] <= ((id_54));
  id_77 id_78 (
      .id_58(1),
      .id_55(1),
      .id_70(id_50[id_62]),
      .id_50(1),
      .id_51(1)
  );
  assign id_48 = 1'd0;
  id_79 id_80 (
      .id_58(id_59),
      .id_70(1),
      .id_44(1)
  );
  assign id_69 = id_67;
endmodule
