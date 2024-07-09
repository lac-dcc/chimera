`default_nettype id_1
module module_0 (
    id_1,
    id_2 = id_7,
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
      .id_8(id_4),
      .id_5(id_4 ? id_2 : id_4),
      .id_5(id_3),
      .id_2(id_8),
      .id_1(id_1),
      .id_3(id_3),
      .id_1(id_1),
      .id_1(id_5),
      .id_8(id_8),
      .id_4(id_11),
      .id_2(id_1[id_3]),
      .id_7(id_4),
      .id_8(id_1[id_7]),
      .id_1(id_6)
  );
  id_12 id_13 (id_1);
  id_14 id_15 (
      .id_11(id_4),
      .id_1 (id_6),
      .id_7 (id_2),
      .id_5 (id_4),
      .id_4 (id_3)
  );
  id_16 id_17 (
      .id_2(id_7),
      .id_7(id_3)
  );
  logic id_18;
  id_19 id_20 (
      .id_21(1),
      .id_4 (id_10)
  );
  id_22 id_23 (
      .id_20(id_21),
      .id_7 (id_15),
      .id_20(id_3)
  );
  id_24 id_25 (.id_10(id_10));
  id_26 id_27 (
      .id_5 (id_6),
      .id_18(id_25),
      .id_21(id_6 & id_6)
  );
  id_28 id_29 (
      .id_4 (id_2),
      .id_15(id_21),
      .id_23(id_10)
  );
  id_30 id_31 (
      .id_17(id_29),
      .id_10(id_3),
      .id_21(id_18)
  );
  logic id_32 (.id_25(id_6));
  id_33 id_34 (
      .id_11(id_6),
      .id_6 (id_5),
      .id_29(1'd0),
      .id_18(id_5),
      .id_18(id_23)
  );
endmodule
