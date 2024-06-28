module module_0 (
    input logic [id_1 : id_1] id_2,
    input logic [id_2 : id_1] id_3,
    input [id_2 : id_1] id_4
);
  id_5 id_6 (
      .id_4(1),
      .id_3(id_1)
  );
  logic id_7;
  id_8 id_9 (
      .id_4(id_6),
      .id_2(id_1),
      .id_3(id_1),
      .id_4(id_7),
      .id_6(id_6),
      .id_4(id_2),
      .id_6(1'b0)
  );
  assign id_6 = id_2;
  assign id_2 = 1;
  id_10 id_11 (
      .id_6(id_6.id_1.id_9[id_7][id_2]),
      .id_7(id_3),
      .id_1(id_9),
      .id_6(id_7),
      .id_3(id_3)
  );
  id_12 id_13 (
      .id_9(id_4[id_6]),
      .id_4(id_9)
  );
  id_14 id_15 (
      .id_6(id_9),
      .id_4(id_13),
      .id_4(id_9)
  );
  id_16 id_17 (
      .id_6(id_7),
      .id_7(id_4[id_9])
  );
  id_18 id_19 (
      .id_3 (id_4),
      .id_13(1)
  );
  id_20 id_21 (
      .id_19(id_13),
      .id_13(id_2)
  );
endmodule
