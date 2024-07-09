module module_0 (
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
  id_7 id_8 (
      .id_4(id_5),
      .id_6(id_4)
  );
  id_9 id_10 (
      .id_6(id_5),
      .id_6(id_5)
  );
  id_11 id_12 (
      .id_4 (id_5),
      .id_3 (id_2),
      .id_10(id_1),
      .id_1 (id_3)
  );
  id_13 id_14 (
      .id_1 (id_10),
      .id_10(id_8)
  );
  id_15 id_16 (
      .id_10(1),
      .id_1 (id_1)
  );
  assign id_4 = id_1;
  id_17 id_18 (
      .id_6 (id_8),
      .id_12(1),
      .id_16(id_10)
  );
  logic id_19;
  always @(posedge id_4, posedge id_2) begin
    id_18 <= id_2;
  end
  logic id_20;
  id_21 id_22 (
      .id_20(1),
      .id_20(id_20),
      .id_23(id_20 == id_23)
  );
  id_24 id_25 (
      .id_23(id_22[id_20 : id_26]),
      .id_22(id_23),
      .id_26(id_27),
      .id_23(1),
      .id_23(id_23),
      .id_20(id_22),
      .id_23(id_26),
      .id_20(id_27),
      .id_23(id_27),
      .id_23(1),
      .id_23(id_28),
      .id_26(id_28)
  );
  id_29 id_30 (
      .id_20(id_25),
      .id_27(id_25),
      .id_26(id_26)
  );
  id_31 id_32 (
      .id_20(id_30[id_23]),
      .id_23(id_20)
  );
  id_33 id_34 (
      .id_22(id_20[id_30 : id_25]),
      .id_25(1)
  );
endmodule
