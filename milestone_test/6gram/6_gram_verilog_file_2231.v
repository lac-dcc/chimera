// Seed: 3161652404
module module_0 #(
    parameter id_10 = 32'd80,
    parameter id_2  = 32'd56,
    parameter id_5  = 32'd73,
    parameter id_7  = 32'd62
) (
    input type_11 id_1,
    input logic _id_2,
    input reg id_3,
    output id_4
);
  logic _id_5;
  reg   id_6;
  type_16 _id_7 (
      .id_0(1),
      .id_1(id_4),
      .id_2(1 != !id_4),
      .id_3(id_5),
      .id_4(id_6),
      .id_5(1),
      .id_6(1)
  );
  type_17(
      1, 1
  );
  reg id_8 (
      .id_0(id_5[1'b0]),
      .id_1(id_6),
      .id_2(1)
  );
  always @(id_5[{1{id_5[1'b0]}}]) id_2 = 1;
  type_19(
      1, 1, ~id_4
  );
  assign id_6 = (id_4);
  assign id_8 = id_5 ? 1 : 1 - 1;
  string id_9;
  assign id_1 = !id_3;
  logic _id_10 = id_10;
  assign id_8 = id_7;
  assign id_3[id_5] = 1'b0;
  assign id_1 = id_8;
  assign id_8[1] = 1;
  assign id_2 = id_1;
  assign id_3[id_7] = id_4;
  assign id_9 = id_8 ? 1 : 1;
  assign id_1 = id_7;
  assign id_9 = "";
  initial begin
    id_1 = 1;
    if (id_6) begin
      if (id_3[id_2]) id_6 <= 1;
      else id_5[id_10] <= (id_7);
    end else begin
      id_4 <= id_9;
    end
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd76,
    parameter id_12 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input id_4;
  input id_3;
  output id_2;
  output id_1;
  logic id_5, id_6, id_7, id_8, id_9, _id_10, id_11, _id_12, id_13, id_14;
  type_17 id_15 (
      .id_0 (id_1[1 : 1]),
      .id_1 (1'h0),
      .id_2 (id_3),
      .id_3 (id_4[1 : id_10]),
      .id_4 (id_14),
      .id_5 (id_6),
      .id_6 (id_2),
      .id_7 (id_13),
      .id_8 (id_6),
      .id_9 (id_3),
      .id_10(id_1),
      .id_11(id_3),
      .id_12(1'h0),
      .id_13(id_1),
      .id_14(id_1[id_12^id_10] & 1),
      .id_15(1'h0),
      .id_16(1'd0),
      .id_17(1),
      .id_18(),
      .id_19(1)
  );
  assign id_8 = 1 & id_12;
endmodule
