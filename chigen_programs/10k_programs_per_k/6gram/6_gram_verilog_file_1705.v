// Seed: 3626093240
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  rtran (1, 1, 1);
  id_5(
      .id_0(id_4), .id_1(1), .id_2(id_3 == 1)
  ); id_6(
      .id_0({id_2{1'd0}}),
      .id_1(id_1),
      .id_2(id_2 + 1'h0),
      .id_3(1),
      .id_4(id_3),
      .id_5(1),
      .id_6(1 == 1),
      .id_7(1'b0),
      .id_8(1 == 1),
      .id_9(id_1 - id_3),
      .id_10(id_4),
      .id_11(id_1),
      .id_12(id_2),
      .id_13(1)
  );
  wire id_7;
  wire id_8;
  wire id_9, id_10;
  specify
    (id_11 *> id_12) = 0;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wor id_5;
  always @(*) begin
    disable id_6;
  end
  module_0(
      id_5, id_5, id_5, id_5
  );
  assign id_5 = 1;
  assign id_4 = 1;
  assign {id_5 == id_5, 'b0} = id_4;
  timeprecision 1ps;
endmodule
