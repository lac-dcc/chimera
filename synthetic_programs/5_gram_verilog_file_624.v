module module_0 (
    id_1,
    id_2,
    id_3,
    output logic id_4
);
  id_5 id_6 (
      (id_5[id_2]),
      .id_3(id_5),
      .id_1(id_5),
      .id_2(id_3),
      .id_5(id_4),
      .id_5((1'b0)),
      .id_4(id_5),
      .id_1(id_2[id_7])
  );
  logic id_8;
  id_9 id_10 (
      .id_8(id_4),
      .id_9(1),
      .id_2(1),
      .id_3(id_1),
      .id_8(id_8[1])
  );
  assign id_7 = id_3 ? id_5 : id_1;
  input [id_8[1] : 1] id_11;
  id_12 id_13 (
      .id_12(id_4),
      .id_8 (id_9),
      .id_3 (id_8[1]),
      .id_4 (1'd0),
      .id_2 (1),
      .id_12(1)
  );
  id_14 id_15 ();
  assign id_12 = id_9;
  logic id_16;
  assign id_9 = id_8[id_7];
  assign id_2 = 1;
  id_17 id_18 (
      .id_16(1'b0),
      .id_7 (id_6[1]),
      .id_7 (1),
      .id_8 (id_17)
  );
  assign id_10 = id_10;
  logic id_19;
  id_20 id_21 (
      .id_12(id_10),
      .id_10(id_20),
      .id_11(id_12)
  );
  id_22 id_23 ();
  id_24 id_25 (
      .id_16(id_23[1]),
      .id_14(id_20[id_4]),
      .id_21(1)
  );
  logic id_26 (
      .id_15(id_13),
      .id_14(id_11)
  );
  id_27 id_28 (
      .id_26(id_11),
      .id_18(id_5[id_10])
  );
  id_29 id_30 (
      1,
      1'b0,
      id_16[id_27],
      .id_10(id_23[id_12])
  );
  logic id_31;
  logic id_32;
  id_33 id_34 (
      .id_2 (id_10),
      .id_16(id_28),
      .id_13(id_15[id_12]),
      .id_3 (id_10[id_18])
  );
  always @(posedge id_2 or posedge id_32) begin
    if (id_7) if (id_34) if (1'd0) if (1) id_22 = id_30;
  end
  logic id_35;
  localparam id_36 = id_36;
  id_37 id_38 (
      .id_35((id_35)),
      .id_36(id_36),
      .id_36(id_35 | id_37 > id_37)
  );
  logic id_39, id_40, id_41, id_42, id_43, id_44, id_45 = id_38;
  defparam id_46.id_47 = 1;
  logic id_48 (
      .id_45(id_42),
      id_40
  );
  logic id_49 (
      .id_48(id_44),
      .id_38(1),
      .id_48(id_35)
  );
  id_50 id_51 (
      .id_41(id_49),
      .id_44(id_42)
  );
  logic id_52;
  input id_53;
  assign id_51 = 1;
  id_54 id_55 (
      .id_51(id_52),
      .id_44(1),
      .id_52(id_50)
  );
  logic id_56;
  id_57 id_58 (
      .id_37(1'b0),
      .id_51(id_43)
  );
  id_59 id_60 ();
  logic id_61 (
      .id_36(id_47),
      .id_40(1)
  );
  id_62 id_63 (
      .id_37(id_61),
      .id_55(id_38),
      .id_46(id_39),
      .id_57(1 & id_37)
  );
endmodule
