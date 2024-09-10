// Seed: 3502688987
module module_0 #(
    parameter id_1 = 32'd5,
    parameter id_2 = 32'd46,
    parameter id_3 = 32'd29,
    parameter id_4 = 32'd13,
    parameter id_5 = 32'd57,
    parameter id_7 = 32'd24
) (
    input _id_1,
    inout _id_2,
    input logic _id_3,
    output _id_4
);
  assign id_1[id_3[1 : id_2]] = 1 ? 1 : 1 ? id_2 : id_2 * 1;
  type_10 _id_5 (
      .id_0 (1'b0),
      .id_1 (""),
      .id_2 (id_1),
      .id_3 (1),
      .id_4 (1),
      .id_5 (id_3),
      .id_6 (1),
      .id_7 (id_2),
      .id_8 (1'b0),
      .id_9 (id_4),
      .id_10(id_4 + id_3),
      .id_11(1'b0),
      .id_12(id_1 - id_2[id_4 : id_1]),
      .id_13(id_1 - 1),
      .id_14(1),
      .id_15(1),
      .id_16(1),
      .id_17(id_3),
      .id_18(id_2),
      .id_19(id_1),
      .id_20(1),
      .id_21(1),
      .id_22(id_6 == 1)
  );
  logic _id_7;
  assign id_2[1'b0<id_7[1]] = id_6;
  initial begin
    id_6[id_5] <= id_3[id_3 : 1];
    if (id_6) begin
      id_4 <= #1 id_5;
    end else id_1 = 1;
  end
  always @(1 or negedge id_3) id_2 <= id_4;
  logic id_8 = 1;
endmodule
