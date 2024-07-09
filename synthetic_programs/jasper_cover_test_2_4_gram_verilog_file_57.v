module module_0 (
    output [id_1 : id_1] id_2,
    input [id_2 : id_1[id_1]] id_3,
    input [id_1 : id_2] id_4,
    input id_5,
    input id_6,
    input id_7,
    output signed id_8,
    input id_9,
    output id_10,
    input [id_4 : 1] id_11,
    inout [id_5 : 1] id_12,
    input id_13,
    output id_14,
    input logic id_15,
    input [id_6 : id_14] id_16,
    input [id_6 : id_5] id_17,
    input id_18,
    output logic [id_4 : id_11] id_19,
    input logic id_20,
    input logic id_21,
    output id_22
);
  id_23 id_24 (
      .id_14(id_6),
      .id_8 (id_13),
      .id_15(id_11)
  );
  id_25 id_26 (
      .id_13(id_16),
      .id_9 (id_3),
      .id_10(id_22)
  );
  id_27 id_28 (
      .id_13(id_2),
      .id_8({
        id_15,
        1,
        id_21,
        id_24,
        id_3,
        id_17,
        1,
        id_6,
        id_8,
        id_7,
        id_19,
        id_14,
        1,
        id_8,
        id_21,
        id_2,
        id_4,
        id_6,
        id_16,
        1,
        1,
        id_13,
        (id_2),
        id_1,
        id_10,
        id_5,
        id_12,
        id_26,
        (id_9),
        id_20[id_19],
        id_2
      })
  );
  logic [id_13 : id_5] id_29 (
      .id_20(id_3),
      .id_3 (1),
      .id_11(id_16),
      .id_15(id_12)
  );
  logic id_30;
  id_31 id_32 (
      .id_24(id_2),
      .id_3 (!id_11 || id_7),
      .id_16(id_28)
  );
  id_33 id_34 (
      .id_6 (id_30),
      .id_20(id_15)
  );
  id_35 id_36 (
      .id_16(id_16),
      .id_30(1)
  );
  id_37 id_38 (
      .id_26(id_1),
      .id_34(id_12)
  );
  id_39 id_40 (
      .id_16(1),
      .id_5 (id_5),
      .id_14(id_17),
      .id_4 (id_12)
  );
  id_41 id_42 (
      .id_13(id_3),
      .id_2 (id_34)
  );
  id_43 id_44 (
      .id_22(id_36[id_20 : 1]),
      .id_3 (id_28),
      .id_18(id_6),
      .id_10(id_38),
      .id_11(1),
      .id_19(id_20),
      .id_24(id_26),
      .id_16(1'd0),
      .id_9 (id_10),
      .id_2 (id_17[id_3]),
      .id_15(id_26)
  );
  id_45 id_46 (
      .id_6 (1'b0),
      .id_36(id_11),
      .id_4 (id_3),
      .id_18(1),
      .id_26(id_4),
      .id_36(id_6),
      .id_24(1'b0)
  );
  logic [id_3 : id_4] id_47;
  id_48 id_49 (
      .id_36(id_30),
      .id_17(id_47)
  );
  logic id_50;
  id_51 id_52 (
      .id_24(id_44),
      .id_4 (id_1)
  );
  id_53 id_54 (
      .id_40(id_9),
      .id_32(id_11)
  );
endmodule
