// Seed: 3940287928
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge (id_1) or posedge 1) begin
    fork
      return 1'd0;
    join_any
  end
  id_5(
      .id_0(id_4),
      .id_1(!id_1),
      .id_2(1'b0),
      .id_3(id_1),
      .id_4(~1),
      .id_5(id_3 == 1'b0),
      .id_6(1),
      .id_7(1'b0)
  ); id_6(
      .id_0({1, 1}),
      .id_1(1 + 1'b0),
      .id_2(1),
      .id_3(id_4),
      .id_4(id_2),
      .id_5(1'b0 ==? id_3),
      .id_6(1),
      .id_7(id_2),
      .id_8(id_2),
      .id_9(1'h0),
      .id_10(1'b0),
      .id_11(1),
      .id_12(1),
      .id_13(1),
      .id_14(),
      .id_15((1'h0)),
      .id_16(1'd0)
  );
endmodule
module module_1 #(
    parameter id_7 = 32'd79
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  supply0 id_6;
  wire _id_7;
  always_ff force id_3[id_7+:id_7] = 1;
  assign id_6 = 1;
  module_0(
      id_2, id_6, id_3, id_4
  );
endmodule
