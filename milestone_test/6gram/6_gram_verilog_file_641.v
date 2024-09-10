// Seed: 1092996395
module module_0;
  type_4 id_2 (
      .id_0(~id_1),
      .id_1(1),
      .id_2(id_1),
      .id_3(id_1),
      .id_4({id_3[1'b0], 1})
  );
  assign id_3 = id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output id_20;
  output id_19;
  input id_18;
  output id_17;
  input id_16;
  output id_15;
  input id_14;
  output id_13;
  output id_12;
  input id_11;
  output id_10;
  input id_9;
  input id_8;
  input id_7;
  input _id_6;
  output id_5;
  input id_4;
  output id_3;
  input id_2;
  input id_1;
  always @(posedge !id_7) begin
    #1;
    if (id_18) id_10 <= 1;
    id_4 = id_19;
    if (id_15) begin
      id_15 = 1;
      integer id_21;
      if (1) SystemTFIdentifier;
      id_10 <= id_9;
      id_4  <= id_16;
      id_2 = id_3[1'b0];
      id_11 <= 0;
      id_7 = 1;
    end
  end
  always @(id_16, posedge id_5) begin
    #1 id_18 = id_15[1'b0/id_6-1 : 1];
  end
  logic id_22;
endmodule
