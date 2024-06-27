module module_0;
  id_1 id_2 ();
  id_3 id_4 (
      .id_1(id_2),
      .id_3(id_1),
      id_3,
      .id_1(id_2)
  );
  assign id_4[1] = 1'b0;
  logic id_5;
  logic id_6;
  logic id_7 (
      .id_6(1),
      1
  );
  logic id_8;
  always @(posedge id_3) begin
    if (id_6) id_5 <= #1 1;
    else if (id_6) begin
      id_5[(id_5&id_2)] <= (1);
    end
  end
  id_9 id_10 (
      .id_11(1),
      .id_12(id_9),
      .id_12(1),
      .id_9 (id_11),
      .id_13(id_11),
      .id_11(id_13)
  );
  logic id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21;
  assign id_12[1|id_9] = 1'b0;
  id_22 id_23 (
      .id_11(id_20),
      .id_9 (id_11),
      .id_10(id_22)
  );
  logic id_24;
  id_25 id_26 (
      .id_13(~id_10),
      .id_11(id_17),
      (id_17),
      .id_15(1),
      .id_12(~id_13)
  );
  id_27 id_28 (
      .id_10(id_24),
      .id_13(1'b0),
      .id_18(id_15)
  );
  output [id_22[1] : 1] id_29;
  always @(posedge id_22[id_21]) begin
    id_21 <= id_20;
  end
  id_30 id_31 (
      .id_32(id_33[1]),
      .id_32(1'b0)
  );
  id_34 id_35 ();
  logic id_36;
  id_37 id_38 (
      .id_33(1),
      .id_32(id_36)
  );
  id_39 id_40 (
      .id_31(1),
      id_30[1],
      .id_38(id_36),
      .id_39(1),
      .id_30(id_31),
      .id_36((id_30)),
      .id_39(id_38)
  );
  id_41 id_42 = 1;
  id_43 id_44 (
      .id_41(id_39),
      .id_37(id_41[1])
  );
endmodule
