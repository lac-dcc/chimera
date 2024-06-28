module module_0 (
    output logic id_1,
    input id_2,
    output logic [id_1 : id_2] id_3,
    output id_4,
    input logic id_5,
    input logic id_6,
    input id_7,
    output [id_5 : id_2] id_8,
    output [id_7 : id_1] id_9,
    input logic id_10,
    input id_11,
    output id_12,
    output [id_2 : id_12] id_13,
    output logic id_14,
    output id_15,
    input [id_6 : id_14] id_16,
    output id_17,
    input id_18,
    input [id_4 : id_5] id_19,
    output id_20,
    input id_21,
    output id_22,
    input [1  &  id_6 : id_19] id_23,
    input [id_14 : id_6] id_24,
    input [id_12[1 'h0] : id_6] id_25,
    output id_26,
    output [id_16 : id_2] id_27,
    inout id_28,
    input id_29,
    input [id_22[id_24] : id_15] id_30,
    output [id_21[id_28] : id_10] id_31,
    output id_32
);
  id_33 id_34 (
      .id_22(id_23[id_8 : id_23&id_1]),
      .id_15(id_12)
  );
  id_35 id_36 (
      .id_11(id_1),
      .id_31(id_24[id_13]),
      .id_20(id_31),
      .id_25(id_15),
      .id_11(id_32),
      .id_11(id_14),
      .id_4 (id_7),
      .id_8 (1'b0),
      .id_15(id_6),
      .id_25(id_30)
  );
  id_37 id_38 (
      .id_36(id_12),
      .id_3 (id_10),
      .id_36(id_4),
      .id_5 (id_15),
      .id_31(id_23),
      .id_4 (id_30),
      .id_9 (id_31 & 1'd0),
      .id_32(id_28),
      .id_16(id_25),
      .id_34(id_25)
  );
endmodule
