module module_0 #(
    parameter [id_3 : id_1] id_5 = id_4,
    parameter id_6 = id_6,
    parameter id_7 = id_6,
    parameter id_8 = 1,
    parameter id_9 = id_8,
    parameter id_10 = id_8,
    parameter id_11 = id_4,
    parameter id_12 = id_10,
    parameter id_13 = id_9,
    parameter [(  id_1  ) : id_12] id_14 = id_4,
    parameter [id_6 : id_12] id_15 = id_14[id_4],
    id_16 = id_8,
    parameter id_17 = id_15
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  id_18 id_19 (
      .id_3 (id_10),
      .id_10(id_10),
      .id_5 (id_17)
  );
  id_20 id_21 (
      .id_19(id_13),
      .id_15(id_2),
      .id_13(1),
      .id_15(id_14),
      .id_5 (1'd0)
  );
  id_22 id_23 (
      .id_4 (id_9),
      .id_19(id_11),
      .id_7 (id_21),
      .id_1 (id_16),
      .id_3 (id_2),
      .id_16(id_5)
  );
endmodule
