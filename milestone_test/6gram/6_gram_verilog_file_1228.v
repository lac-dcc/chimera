// Seed: 373821504
module module_0 #(
    parameter id_10 = 32'd88,
    parameter id_15 = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18
);
  input id_18;
  input id_17;
  input id_16;
  output _id_15;
  input id_14;
  output id_13;
  input id_12;
  output id_11;
  input _id_10;
  input id_9;
  input id_8;
  output id_7;
  output id_6;
  output id_5;
  input id_4;
  output id_3;
  output id_2;
  input id_1;
  logic id_19;
  logic id_20;
  assign id_18[id_15[1]] = 1;
  type_27 id_21 (
      .id_0(1),
      .id_1(1),
      .id_2(id_10[(1)]),
      .id_3(1'b0),
      .id_4(id_7)
  );
  assign id_12[1 : 1'b0] = 1;
  type_0 id_22 (
      .id_0(id_2),
      .id_1((1'b0)),
      .id_2(1),
      .id_3(1)
  );
  assign id_15[id_10] = 1'b0;
  logic id_23 = 1;
  logic id_24;
  initial begin
    id_12 <= #1 1;
    SystemTFIdentifier(id_22);
  end
endmodule
