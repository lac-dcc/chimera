module module_0 #(
    parameter id_7 = id_4
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic [id_5 : id_6] id_8 (
      .id_3(id_6),
      .id_5(id_6),
      .id_5(1'd0),
      .id_5(id_2),
      .id_4(id_6),
      .id_4(id_5)
  );
  id_9 id_10 (
      .id_1(id_3),
      .id_3(id_1),
      .id_1(1),
      .id_1(id_5),
      .id_8(id_8),
      .id_4(id_11),
      .id_2(id_1),
      .id_3(id_7),
      .id_4(id_8),
      .id_1(id_7)
  );
  id_12 id_13 (
      .id_7(id_11),
      .id_1(id_7),
      .id_2(id_4[id_5]),
      .id_3(id_5)
  );
endmodule
module module_1 #(
    parameter [id_1 : 1 'b0] id_2 = id_1,
    parameter [id_2 : ""] id_3 = id_1,
    [id_3 : id_1] id_4 = id_2,
    parameter id_5 = id_4,
    parameter id_6 = id_5,
    parameter [id_3 : id_3] id_7 = id_3,
    parameter [id_2 : id_4] id_8 = id_7
) (
    input [id_2 : id_7] id_9,
    output id_10,
    input id_11,
    input [id_7 : id_10] id_12,
    output logic id_13,
    output id_14,
    output id_15,
    input logic id_16,
    input logic id_17
);
  id_18 id_19 (
      .id_9 (id_9),
      .id_16(id_3)
  );
  id_20 id_21 (
      .id_14(id_19),
      .id_16(id_6)
  );
  logic id_22;
endmodule
