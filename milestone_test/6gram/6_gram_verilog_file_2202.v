// Seed: 902951338
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = 32'd1,
    parameter id_4 = 32'd97
) (
    _id_1,
    id_2
);
  output id_2;
  input _id_1;
  logic id_3;
  assign id_3 = 1;
  type_13(
      1, id_2, 1, id_1, id_4
  );
  logic id_5;
  reg   id_6;
  logic id_7;
  always @(*)
    if (|id_5) begin
      id_4 <= #id_8 1;
      id_2 <= 1;
      if (1 * 1 - 1 | id_1) id_6 <= id_4;
      else if (id_5 && ~1) begin
        id_2 <= 1;
        SystemTFIdentifier((id_1) < 1);
        id_8 = 1'b0;
      end
    end else id_2 = 1;
  generate
    if (id_7) begin
      type_0 id_9 (
          .id_0(id_4),
          .id_1(1'b0)
      );
    end else begin
      assign id_3 = id_7;
      logic id_10 = id_5 && id_6[id_1[1]&1'h0];
      assign id_4[id_4] = id_4;
      type_1 id_11 (
          .id_0(id_10),
          .id_1(1),
          .id_2(1),
          .id_3(id_10 - id_2),
          .id_4(1),
          .id_5(1'h0),
          .id_6(id_6),
          .id_7(1),
          .id_8(id_7),
          .id_9(id_10)
      );
    end
  endgenerate
  assign id_4[1] = 1;
  assign id_7 = 1 - id_6;
endmodule
