module module_0 (
    output [id_1 : id_1] id_2,
    input id_3,
    input logic [id_2 : id_3] id_4,
    input [1 : id_1] id_5,
    input [id_2 : id_5] id_6,
    output id_7,
    input logic [id_4 : id_5] id_8,
    input id_9,
    input id_10,
    output id_11,
    output id_12
);
  id_13 id_14 (
      .id_12(id_6),
      .id_11(id_10),
      .id_9 (id_1),
      .id_12(id_4),
      .id_3 (1)
  );
  id_15 id_16 (
      .id_12(id_12),
      .id_11(id_9)
  );
  id_17 id_18 (
      .id_6 (id_14),
      .id_10(id_14[id_2]),
      .id_8 (id_5),
      .id_1 (id_3[id_3]),
      .id_12(id_1),
      .id_3 ((id_2)),
      .id_16(id_16)
  );
  id_19 id_20 (
      .id_6 (1),
      .id_11(id_3)
  );
  id_21 id_22 (
      .id_18(id_11),
      .id_18(id_11)
  );
  id_23 id_24 (
      .id_4 (id_20),
      .id_7 (id_6),
      .id_7 (id_8),
      .id_22(id_10),
      .id_10(id_9)
  );
  id_25 id_26 (
      .id_5 (id_18),
      .id_20(id_3),
      .id_16(id_10),
      .id_22(id_20),
      .id_6 (id_20)
  );
  always @(posedge id_16 or posedge id_11) begin
    id_4 <= id_1;
  end
  id_27 id_28 (
      .id_29(id_29),
      .id_29(id_29)
  );
  assign id_29 = id_28;
  logic [1 : id_29] id_30;
  id_31 id_32 (
      .id_28(id_33),
      .id_29(1'd0),
      .id_29(id_28)
  );
  id_34 id_35 (
      .id_30(id_28),
      .id_32(id_33),
      .id_36(id_29),
      .id_36(id_36),
      .id_30(id_28),
      .id_30(id_36)
  );
  id_37 id_38 (
      .id_33(id_35),
      .id_35(id_35),
      .id_33(id_36)
  );
  id_39 id_40 (
      .id_32(id_36),
      .id_30(id_29)
  );
  id_41 id_42 (
      .id_32(id_40),
      .id_32(id_40),
      .id_33(1),
      .id_28(id_35)
  );
endmodule
