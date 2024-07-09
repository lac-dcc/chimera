module module_0 (
    output [id_1 : id_1] id_2,
    output logic id_3,
    input [id_2 : id_3] id_4,
    input id_5,
    input logic id_6,
    output id_7,
    output [id_2 : id_6] id_8,
    input id_9,
    input logic [id_2 : id_8] id_10,
    input [id_8 : id_1] id_11,
    output id_12,
    output logic [id_11 : id_10] id_13,
    id_14,
    output [id_9[id_8] : 1 'h0] id_15
);
  assign {id_11, id_7, id_14, 1, id_15} = id_9;
  id_16 id_17 (
      .id_12(id_8[id_5 : id_8]),
      .id_9 (id_3),
      .id_10(id_6)
  );
  id_18 id_19 (
      .id_9(id_13),
      .id_3(id_6)
  );
  assign id_19[id_2] = id_7 ? id_19 : id_11;
endmodule
