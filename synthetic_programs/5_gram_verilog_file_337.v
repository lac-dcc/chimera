module module_0 (
    input logic [id_1 : 1] id_2,
    input [1 : id_1] id_3
);
  logic id_4;
  id_5 id_6 (
      .id_2(id_3[id_5]),
      .id_1(1)
  );
  id_7 id_8 (
      .id_1(id_6),
      .id_4(id_7[1])
  );
  output [id_3 : id_6] id_9;
  logic [id_5 : id_4] id_10 (
      .id_1(id_7),
      .id_4(~id_4),
      .id_8(id_4),
      .id_9(id_2),
      .id_3(id_1),
      .id_8(id_8),
      .id_7(id_3[id_5[id_1]])
  );
  id_11 id_12 (
      id_6[id_6],
      .id_6(id_7),
      .id_9(id_11)
  );
  logic id_13;
  id_14 id_15 (
      .id_14(1),
      .id_14(1),
      id_8[id_6[id_12[id_9]]],
      .id_1 (id_1)
  );
  id_16 id_17 (
      .id_11(id_14),
      .id_4 (1)
  );
  id_18 id_19 (
      .id_3 (id_5[id_3[id_12]]),
      .id_11(id_14 & id_18[id_4] & 1 & id_5 & id_15),
      .id_16(1)
  );
  id_20 id_21 (
      .id_11(1),
      .id_12(id_15),
      .id_10(id_9),
      id_4,
      .id_16(id_2)
  );
  id_22 id_23 ();
  id_24 id_25 (
      id_21,
      .id_12(1'b0),
      .id_18(),
      .id_1 (id_5[~id_18]),
      id_5,
      .id_11(id_8)
  );
  logic id_26;
  assign id_4 = id_16 | id_19[("")];
  assign id_12[id_11] = id_16;
  id_27 id_28 ();
  logic id_29;
  logic [id_3 : id_19] id_30;
  id_31 id_32 (
      .id_20(1),
      .id_16(id_5)
  );
  assign id_5[1] = id_14 | id_17[id_4&id_12&1&id_20[id_8]&id_5&id_4&id_30];
  id_33 id_34 (
      .id_30(id_20),
      .id_3 (id_25),
      .id_18(id_6)
  );
  localparam [1 'h0 : id_10[id_31]] id_35 = id_9;
  always @(posedge (1) or posedge id_28) begin
    id_8[(id_18)] <= id_28;
  end
  always @(posedge id_36) begin
    id_36 = id_36[{id_36, id_36, id_36}];
  end
  logic id_37;
endmodule
