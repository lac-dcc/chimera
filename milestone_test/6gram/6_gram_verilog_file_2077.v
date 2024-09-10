// Seed: 461137506
module module_0 #(
    parameter id_1  = 32'd11,
    parameter id_12 = 32'd42,
    parameter id_3  = 32'd29
) (
    inout _id_1,
    input id_2,
    input logic _id_3,
    input id_4,
    input id_5,
    input logic id_6
);
  always @* id_5 = id_2;
  assign id_3 = id_5;
  logic id_7;
  logic id_8;
  assign id_1 = id_6;
  logic id_9;
  logic id_10, id_11;
  generate
    for (_id_12 = 1; id_10; id_5 = id_10) begin : id_13
      type_24 id_14 (
          .id_0(1),
          .id_1(1),
          .id_2(id_3),
          .id_3(1 / id_1),
          .id_4(1),
          .id_5(""),
          .id_6(id_4)
      );
    end
  endgenerate
  assign id_6 = 1;
  logic id_15;
  logic id_16 (
      .id_0(1),
      .id_1(1),
      .id_2(id_12),
      .id_3(id_12 * {id_11[1'b0], 1, 1} - 1'b0),
      .id_4(id_9[1'b0 : 1])
  );
  assign id_5[1] = 1;
  type_26(
      1, id_12, id_2, 1
  );
  assign id_2[id_1] = id_15 && 1;
  type_27 id_17 (
      .id_0(id_1),
      .id_1(1'b0),
      .id_2("" + 1)
  );
  always @(id_3 or negedge id_3[id_12[1] : id_1[id_3]*1'b0]) begin
    id_2 = id_16;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output id_4;
  input id_3;
  input id_2;
  input id_1;
  always @(id_3 or posedge id_2) begin
    id_4 <= 1;
  end
endmodule
