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
      .id_4(id_5)
  );
  id_11 id_12 (
      .id_1 (id_7[id_4 : id_4]),
      .id_8 (id_4),
      .id_10(id_2),
      .id_3 (id_1),
      .id_8 (id_8[id_7]),
      .id_3 (id_5),
      .id_1 (id_8)
  );
  id_13 id_14 (
      .id_1(id_8),
      .id_4(id_2),
      .id_4(id_3)
  );
  id_15 id_16 (
      .id_5 (id_2),
      .id_3 (id_3),
      .id_3 (id_1),
      .id_4 (id_14),
      .id_12(id_4),
      .id_1 (1'b0)
  );
  logic id_17;
  id_18 id_19;
  logic id_20;
  id_21 id_22 (
      .id_19(id_3),
      .id_12(id_5),
      .id_16(id_16),
      .id_20(1),
      .id_2 (id_19),
      .id_16(id_20),
      .id_20(id_3)
  );
  id_23 id_24 (
      .id_17(id_19),
      .id_20(id_22)
  );
  id_25 id_26 (
      .id_2(id_20),
      .id_5(id_7)
  );
  id_27 id_28 (
      .id_22(id_6),
      .id_10(id_17)
  );
  id_29 id_30 (
      .id_6(id_17),
      .id_6(id_22)
  );
  logic id_31 (
      id_16,
      id_7,
      id_19,
      1'h0
  );
  id_32 id_33 (
      .id_12(1'b0),
      .id_26(id_2)
  );
  id_34 id_35 (
      .id_22(id_5),
      .id_6 (id_17)
  );
  id_36 id_37 (
      .id_24(id_16),
      .id_16(id_4),
      .id_5 (1'b0)
  );
  logic id_38;
  id_39 id_40 (
      .id_8 (id_12),
      .id_19(1),
      .id_30(1),
      .id_38(id_38),
      .id_6 (id_12),
      .id_37(id_20),
      .id_24(1),
      .id_24(id_26)
  );
  logic id_41;
  id_42 id_43 (
      .id_14(id_8),
      .id_30(id_3)
  );
  assign id_16 = id_33;
  logic id_44;
  id_45 id_46 (
      .id_44(id_20),
      .id_1 (id_40),
      .id_1 (id_30)
  );
  id_47 id_48 (
      .id_2(1'b0),
      .id_6(id_1 | id_3)
  );
  id_49 id_50 (
      .id_20(id_17),
      .id_41(id_24),
      .id_10(id_35)
  );
  id_51 id_52 (
      .id_6 (id_16),
      .id_22(1'h0),
      .id_35(id_28),
      .id_33(id_4),
      .id_35(id_6),
      .id_22(id_17),
      .id_16(id_7),
      .id_37(id_6)
  );
  logic id_53;
  id_54 id_55 (
      .id_50(id_38),
      .id_38(id_40)
  );
  generate
    always @(posedge id_37 or posedge 1) begin
    end
  endgenerate
endmodule
