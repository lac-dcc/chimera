module module_0 #(
    [id_1 : id_1] id_2 = 1,
    parameter [id_2 : 1] id_3 = id_3,
    parameter id_4 = id_1,
    parameter id_5 = 1,
    parameter [id_2 : id_5] id_6 = id_2,
    parameter id_7 = id_5,
    parameter id_8 = id_7,
    parameter [id_3 : id_6] id_9 = id_5,
    parameter id_10 = id_10,
    id_11 = id_8,
    parameter [id_4 : id_7] id_12 = id_12,
    parameter [id_6 : id_8] id_13 = id_2
) (
    input [id_6 : id_5] id_14,
    input logic id_15
);
  logic [id_3 : id_6] id_16;
  id_17 id_18 (
      .id_3(id_12),
      .id_9(id_13)
  );
  specify
    (id_19 => id_20[1]) = (id_14  : id_19  : id_13, id_15  : id_2  : id_13);
  endspecify
endmodule
