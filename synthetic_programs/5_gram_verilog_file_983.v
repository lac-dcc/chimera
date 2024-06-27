module module_0 ();
  logic id_1;
  id_2  id_3;
  logic id_4;
  logic id_5;
  assign id_2 = 1;
  always @(posedge id_4 or negedge 1) begin
    id_3 = {1};
  end
  id_6 id_7 (
      .id_6(id_6),
      .id_6(1)
  );
  id_8 id_9 (
      .id_7(id_8),
      .id_8(id_7[~id_6]),
      .id_7(id_6),
      .id_6(id_7)
  );
  always @(posedge 1) begin
    id_9[id_7] = id_9;
  end
  assign id_10 = 1;
  assign id_10 = id_10[id_10];
  id_11 id_12 (
      1'h0,
      .id_13(~id_11),
      .id_11(1)
  );
  id_14 id_15 (
      .id_13(id_14),
      .id_14(1),
      .id_14(id_10)
  );
  logic id_16;
  id_17 id_18 (
      .id_19(1),
      .id_11(id_10),
      id_12,
      .id_16(id_13),
      .id_17(id_10 | id_16)
  );
  logic id_20;
  id_21 id_22;
  id_23 id_24 (
      .id_18(1'b0),
      .id_10(id_10[1]),
      .id_17(id_16),
      .id_10(id_19)
  );
  id_25 id_26 (
      .id_17(id_24),
      .id_15(1),
      .id_17(id_22)
  );
  id_27 id_28 (
      1'b0,
      .id_27(id_13)
  );
  id_29 id_30 ();
  defparam id_31.id_32 = id_16;
  assign id_29 = id_14 ? id_29[id_25] : id_15 ? id_30 : id_20;
  id_33 id_34 (
      .id_23(id_29),
      .id_13(id_30),
      .id_21(1'h0)
  );
  id_35 id_36 (
      .id_34(id_18),
      .id_27((1))
  );
  logic id_37;
  id_38 id_39 = id_27;
  assign id_24[1'b0] = id_25;
  id_40 id_41 (
      .id_18(id_31),
      .id_13(1)
  );
  logic id_42 (
      .id_36(1),
      .id_22(1),
      .id_35(id_30),
      id_27
  );
  id_43 id_44 (
      .id_16(id_26),
      .id_40(id_16#(.id_28(id_15))),
      .id_15(1)
  );
  id_45 id_46 (
      .id_21(1),
      .id_33(id_37),
      .id_24(id_44),
      .id_23(id_31),
      .id_10(id_22),
      .id_29(1),
      .id_36(id_13)
  );
  logic id_47;
  id_48 id_49 (
      .id_15(id_31),
      .id_22(id_48),
      .id_32(id_27[id_12] & 1)
  );
  input [1 : id_37] id_50;
  id_51 id_52 (
      .id_44(id_39),
      .id_25(id_29[id_49]),
      .id_35(id_19),
      .id_33(1)
  );
  id_53 id_54 (
      .id_35({id_40, id_14}),
      .id_30(id_18),
      .id_32(id_12[1]),
      .id_43(id_33),
      .id_34(id_45)
  );
endmodule
