module module_0 (
    input [id_1 : id_1] id_2,
    inout id_3,
    input logic id_4,
    output logic id_5
);
  id_6 id_7 (
      .id_2(id_3),
      .id_5(id_1),
      .id_5(id_2),
      .id_3(id_5),
      .id_4(id_5)
  );
  id_8 id_9 (
      .id_1(id_3),
      .id_1(id_4),
      .id_7(id_5),
      .id_5(id_4[id_2]),
      .id_5(id_5)
  );
  always @(posedge id_2) begin
    id_2 <= id_1;
  end
  logic id_10;
  id_11 id_12 (
      .id_10(id_10),
      .id_10(id_13),
      .id_13(id_10)
  );
  id_14 id_15 (
      .id_10(id_13),
      .id_10(id_12 && id_13),
      .id_13(id_13)
  );
  assign id_10 = id_15;
  id_16 id_17 (
      .id_13(id_12),
      .id_10(id_18),
      .id_10(id_12),
      .id_15(id_15[id_13]),
      .id_15(id_15)
  );
  id_19 id_20 (
      .id_18(id_15),
      .id_17(id_10)
  );
  logic id_21 (
      id_15,
      id_10
  );
  id_22 id_23 (
      .id_20(id_10),
      .id_12(id_18)
  );
  id_24 id_25 (
      .id_20(id_13),
      .id_18(id_17),
      .id_21(id_17),
      .id_18(id_13),
      .id_18(id_18)
  );
  assign id_20 = id_25;
  id_26 id_27 (
      .id_15(id_25),
      .id_20(id_12),
      .id_21(id_12[id_23]),
      .id_10(id_21),
      .id_15(id_17 & id_13)
  );
  id_28 id_29 (
      .id_15(1),
      .id_17(id_21),
      .id_12(id_18[id_18]),
      .id_10(id_23),
      .id_12(id_25),
      .id_12(id_10)
  );
  logic id_30;
  id_31 id_32 (
      .id_23(id_20),
      .id_21(id_27),
      .id_21(id_18)
  );
  id_33 id_34 (
      .id_32(id_25),
      .id_15(id_32),
      .id_10(~id_27),
      .id_10(id_17),
      .id_18(id_23)
  );
  id_35 id_36 (
      .id_27(id_34),
      .id_17(id_34)
  );
  id_37 id_38 (
      .id_13(1),
      .id_12(id_34),
      .id_32(id_12),
      .id_36(id_29),
      .id_15(id_29 & id_34)
  );
  id_39 id_40 (
      .id_20(id_30),
      .id_36(id_21),
      .id_34(id_36[1])
  );
  id_41 id_42 (
      .id_29(id_20),
      .id_12(id_12),
      .id_30(id_18),
      .id_40(id_23)
  );
  id_43 id_44 (
      .id_27(id_15),
      .id_38(id_12),
      .id_34(id_32)
  );
  id_45 id_46 ();
  id_47 id_48 (
      .id_46(id_34 - id_20),
      .id_10(id_36),
      .id_32(id_32),
      .id_27(id_15)
  );
  id_49 id_50 (
      .id_15(id_15),
      .id_36(id_46),
      .id_18(id_44),
      .id_21(id_17),
      .id_36(id_17)
  );
endmodule
