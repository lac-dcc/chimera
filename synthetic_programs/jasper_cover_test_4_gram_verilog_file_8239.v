module module_0 (
    input id_1,
    input logic id_2,
    input id_3,
    input logic id_4,
    output id_5
);
  id_6 id_7 (
      .id_5(id_2),
      .id_3(id_5),
      .id_1(id_5),
      .id_2(id_3),
      .id_5(id_4),
      .id_5(id_4),
      .id_5(id_1),
      .id_2(id_8),
      .id_5(id_5)
  );
  id_9 id_10 (
      .id_5(id_1),
      .id_3(id_2)
  );
  id_11 id_12 (
      .id_1(id_1),
      .id_5(1)
  );
  id_13 id_14 (
      .id_3 (id_5),
      .id_1 (id_10),
      .id_10(id_2),
      .id_1 (id_3),
      .id_8 (id_4[id_12]),
      .id_10(id_1)
  );
  id_15 id_16 (
      .id_1 (id_8),
      .id_14(id_1),
      .id_8 (id_2)
  );
  id_17 id_18 (
      .id_1(id_7),
      .id_8(id_2)
  );
  logic [1 : id_5] id_19;
  id_20 id_21 (
      .id_7 (id_7),
      .id_5 (id_14),
      .id_14(id_7),
      .id_16(id_5 & 1),
      .id_1 (id_14),
      .id_12(id_4),
      .id_12(id_2),
      .id_3 (id_16),
      .id_8 (id_2),
      .id_16(id_18),
      .id_16(id_4)
  );
  id_22 id_23 (
      .id_3 (id_1),
      .id_1 (id_18),
      .id_14(id_10),
      .id_18(id_12),
      .id_8 (id_8),
      .id_7 (1),
      .id_18(id_4),
      .id_1 (id_16)
  );
  id_24 id_25 (
      .id_4(id_18),
      .id_4(id_10)
  );
  id_26 id_27 ();
  id_28 id_29 (
      .id_27(id_10),
      .id_2 (id_7),
      .id_8 (id_12),
      .id_10(1),
      .id_25(id_10)
  );
  always @(posedge id_1 or posedge id_23) begin
    id_19 <= id_25;
  end
  id_30 id_31 (
      .id_32(id_32),
      .id_32(id_32),
      .id_32(id_33),
      .id_32(id_32),
      .id_33({
        id_33,
        id_32,
        id_33,
        1,
        id_33,
        id_33,
        id_32,
        id_33,
        id_32,
        id_33,
        id_33,
        id_32,
        id_34,
        id_34[id_34],
        id_34,
        1,
        id_33,
        id_35,
        id_35,
        id_32[id_32],
        id_35[id_35],
        id_34,
        id_32,
        !id_32,
        id_35,
        id_34,
        id_34,
        id_34,
        id_35,
        id_32,
        id_32,
        id_34,
        id_35,
        id_32,
        1'b0,
        id_35,
        id_36,
        id_36,
        id_32,
        id_34,
        id_33,
        id_33,
        id_35,
        id_33[id_32],
        id_32,
        id_37,
        1,
        1,
        id_35,
        id_35,
        id_32,
        id_36,
        id_37,
        1,
        1,
        id_35,
        id_37,
        id_33,
        id_36,
        id_35,
        id_34,
        id_32,
        id_32,
        id_34,
        1,
        id_33[id_36] & id_38,
        id_35,
        id_35,
        1,
        id_33,
        id_36,
        id_32,
        id_38,
        id_38,
        id_36,
        1,
        id_38,
        id_38,
        id_37,
        id_33,
        id_33,
        id_34,
        1'b0
      }),
      .id_34(id_32),
      .id_36(id_35)
  );
  id_39 id_40 (
      .id_38(id_37),
      .id_38(id_33),
      .id_37(id_37),
      .id_37(id_32),
      .id_36(id_37),
      .id_33(id_31 & id_32)
  );
  id_41 id_42 (
      .id_33(id_35),
      .id_36(1),
      .id_32(id_40),
      .id_38(id_32),
      .id_31(id_37),
      .id_34(id_32),
      .id_38(id_40)
  );
  logic id_43;
  id_44 id_45 (
      .id_32(id_33),
      .id_43(id_43)
  );
  assign id_36[id_32] = id_37;
  id_46 id_47 (
      .id_34(id_43),
      .id_38(id_37),
      .id_38(id_43),
      .id_42(id_45[id_42]),
      .id_31(id_38 & id_45),
      .id_45(id_37),
      .id_36(id_34),
      .id_48(1),
      .id_34(1)
  );
endmodule
