// Seed: 3959621777
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic id_9, id_10, id_11;
  logic id_12 = 1'b0;
  type_15 id_13 (
      .id_0(1'b0),
      .id_1({1'b0, id_11}),
      .id_2(id_10),
      .id_3(1),
      .id_4(id_9),
      .id_5(id_1),
      .id_6(id_12)
  );
endmodule
module module_1 #(
    parameter id_14 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input id_5;
  output id_4;
  output id_3;
  output id_2;
  output id_1;
  logic id_6;
  logic id_7, id_8;
  logic id_9;
  logic id_10;
  defparam id_11.id_12 = id_9 - id_3;
  logic id_13;
  logic _id_14 = id_2 && id_1;
  assign id_13[1^1] = id_9;
  type_23(
      1, id_9, id_4
  );
  logic id_15;
  always @(posedge id_12 or negedge id_1) id_3 <= id_2[{id_14, 1}];
  type_25(
      1, id_14 <= id_8, id_6
  );
  always @(posedge 1) begin
    id_12 <= 1;
  end
  logic id_16;
  assign id_11 = 1 ? id_9 & id_8 : id_7 & id_2;
  type_27 id_17 (
      .id_0 (id_4),
      .id_1 (1),
      .id_2 (1),
      .id_3 (1),
      .id_4 (id_7),
      .id_5 (id_8),
      .id_6 (id_15),
      .id_7 (1'b0),
      .id_8 (id_6),
      .id_9 (id_8),
      .id_10((1))
  );
endmodule
