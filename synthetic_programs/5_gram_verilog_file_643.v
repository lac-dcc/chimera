module module_0 #(
    parameter id_1 = 1,
    parameter id_2 = id_1
) (
    id_3,
    id_4,
    id_5,
    id_6
);
  logic [id_2 : id_3] id_7;
  assign id_2 = id_6;
  id_8 id_9 (
      .id_2(id_8),
      .id_6(id_3)
  );
  assign id_8 = id_4 ? id_5[id_4^id_2 : id_4] : (id_5[1]);
  logic id_10 (
      .id_4((1'b0)),
      .id_8(id_4[1'h0]),
      id_9[1],
      id_2,
      .id_3(id_1),
      id_8
  );
  id_11 id_12 (
      .id_10(id_10[{id_5, 1'b0} : id_5]),
      .id_5 (id_7[1])
  );
  assign id_6 = 1;
endmodule
