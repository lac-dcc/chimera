module module_0 #(
    parameter id_1 = id_1,
    id_2 = id_2,
    parameter id_3 = id_3,
    parameter id_4 = id_1,
    parameter id_5 = id_2,
    parameter id_6 = 1'b0,
    parameter logic id_7 = id_4
) (
    input id_8,
    output logic id_9
);
  id_10 id_11 (
      .id_4(id_8),
      .id_1(id_9),
      .id_8(id_3)
  );
  id_12 id_13 (
      .id_6(id_8 - id_4[id_7 : id_2]),
      .id_1(id_9[id_1 : id_3]),
      .id_6(id_7)
  );
  id_14 id_15 (
      .id_11(id_11),
      .id_5 (id_5),
      .id_5 (id_7),
      .id_6 (id_6),
      .id_6 (id_7),
      .id_9 (id_13),
      .id_8 (id_5)
  );
endmodule
