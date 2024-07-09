module module_0 #(
    parameter id_5 = id_2,
    parameter id_6 = id_5,
    id_7 = id_4,
    parameter id_8 = id_4
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  id_9 id_10 (
      .id_3(id_8),
      .id_4(id_5),
      .id_4(1),
      .id_2(id_4),
      .id_5(id_3)
  );
  id_11 id_12 (
      .id_4(id_8),
      .id_4(id_10),
      .id_2(id_3)
  );
  id_13 id_14 (
      .id_7(id_5),
      .id_1(id_8),
      .id_1(id_1),
      .id_4(id_1),
      .id_8(id_4),
      .id_2(1),
      .id_4(id_3)
  );
  id_15 id_16 (
      .id_5(id_2),
      .id_3(id_3)
  );
  id_17 id_18 (
      .id_12(id_16),
      .id_10(id_8),
      .id_8 (id_10)
  );
  defparam id_19.id_20.id_21 = id_19, id_22.id_23 = id_7, id_24.id_25 = id_19, id_26.id_27 = id_10,
      id_28.id_29 = id_4, id_30.id_31 = id_29, id_32.id_33 = 1, id_34.id_35 = id_32;
  logic [id_33 : {  id_12  {  id_19  }  }] id_36 (
      .id_35(id_1),
      .id_12(id_7),
      .id_32(id_34),
      .id_18(id_7)
  );
  id_37 id_38 (
      .id_36(id_36),
      .id_36(id_4)
  );
  id_39 id_40 (
      .id_16(id_29),
      .id_23(id_27)
  );
  assign id_16 = id_12;
  always @(posedge id_36) begin
    id_32 <= id_18;
  end
  assign id_41 = id_41;
  id_42 id_43 (
      .id_44(1'b0),
      .id_41(id_41),
      .id_44(id_44)
  );
endmodule
