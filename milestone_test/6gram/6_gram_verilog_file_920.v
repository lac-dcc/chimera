// Seed: 2401324427
module module_0 #(
    parameter id_3 = 32'd23,
    parameter id_4 = 32'd67,
    parameter id_5 = 32'd35
) (
    input logic id_2,
    input logic _id_3,
    input _id_4
);
  always @(posedge id_1 or 1) begin
    if (id_2) id_3[1 : 1] <= #1 id_1;
    else begin
      id_3 <= 1;
      id_1 <= 1;
    end
  end
  assign id_2[1|id_4] = id_3[id_3&1] + id_2;
  logic _id_5;
  type_11 id_6 (
      .id_0 (1),
      .id_1 (id_2),
      .id_2 (),
      .id_3 (),
      .id_4 (id_7[id_5]),
      .id_5 (id_5),
      .id_6 (1),
      .id_7 (1'h0),
      .id_8 (),
      .id_9 (id_4),
      .id_10(id_7[1]),
      .id_11(id_2),
      .id_12(1),
      .id_13(id_5),
      .id_14(id_5),
      .id_15(id_2),
      .id_16(1'h0),
      .id_17(id_2)
  );
endmodule
