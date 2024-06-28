module module_0 #(
    parameter id_1 = id_1,
    parameter id_2 = id_2,
    parameter id_3 = id_3,
    parameter id_4 = id_1,
    parameter id_5 = id_2[id_5],
    parameter id_6 = id_2,
    parameter [id_6 : id_3] id_7 = 1,
    parameter id_8 = id_3,
    id_9 = id_4,
    parameter [id_5 : id_4] id_10 = id_1,
    parameter id_11 = id_4
) (
    input [id_7 : id_2] id_12,
    input id_13,
    output id_14,
    input [id_6 : id_12] id_15,
    inout [id_14 : id_4] id_16
);
  id_17 id_18 (
      .id_9 (id_15[id_12+:id_3[id_12]]),
      .id_9 (id_13),
      .id_3 (id_6),
      .id_2 (id_7),
      .id_11(id_1)
  );
  id_19 id_20 (
      .id_18(id_2),
      .id_5 (1)
  );
endmodule
