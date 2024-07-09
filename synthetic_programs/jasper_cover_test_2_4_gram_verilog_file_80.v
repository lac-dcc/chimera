module module_0 #(
    id_3 = id_3,
    parameter id_4 = id_1,
    parameter id_5 = id_2,
    parameter id_6 = id_5[id_2],
    parameter [id_6 : id_3] id_7 = id_4[id_5],
    localparam [id_2 : id_1] id_8 = id_5,
    parameter [id_5[id_2] : 1] id_9 = id_3,
    parameter id_10 = id_4
) (
    id_1,
    id_2
);
  output id_2;
  input id_1;
  logic [id_8 : id_4] id_11 (
      .id_1(id_3),
      .id_6(id_7)
  );
  assign id_5[id_11] = id_1;
  id_12 id_13 (
      .id_5(id_5),
      .id_7(id_6)
  );
endmodule
